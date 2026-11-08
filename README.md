# listo-delivery (Ruby)

The official Ruby client for the Listo Delivery API. Standard library only
(`net/http`, `json`, `openssl`, `securerandom`), Ruby 3.1 or newer.

## Install

```sh
gem install listo-delivery
```

## Quickstart

```ruby
require "listo_delivery"

client = ListoDelivery::Client.new(api_key: ENV.fetch("LISTO_API_KEY")) # lst_test_... or lst_live_...
client.mode # => "test"

store = "st_4bR8kM2wQ7xT1nV5cZ9pLdYe"
quote = client.quotes.create(
  store_id: store,
  dropoff: {street: "Blvd. Puerta de Hierro 4965, Zapopan, Jalisco 45116"},
  payment_method: "cash",
  order_value_cents: 19_600
)
puts quote.fee_cents

delivery = client.deliveries.create(
  store_id: store,
  quote_id: quote.id,
  external_id: "order-1042",
  payment_method: "cash",
  order_value_cents: 19_600,
  dropoff: {name: "Ana", phone: "+523312345678", street: "Blvd. Puerta de Hierro 4965, Zapopan, Jalisco 45116"},
  idempotency_key: "order-1042" # your own order id makes a retry safe
)
puts delivery.id, delivery.status
```

The request fields are the API's wire names (`store_id`, `order_value_cents`).
Pass them as keywords, as one Hash (`create({"store_id" => "..."})`), or both.
Responses are model objects with a reader per documented field, `#to_h` and
`#[]` by wire name; a field the API adds later is kept in `#to_h`, never a
parsing error.

Path parameters are positional: `client.deliveries.cancel(delivery_id, reason: "customer_canceled")`.
Reads take their filters the same way: `client.deliveries.list(status: "pending")`.
Every operation of the API is a method, named after it in snake_case
(`deliveries.retrieve`, `stores.cancel_plan`, `ledger.list_for_store`, ...;
`client.ping` lives on the client itself); the API reference at
[docs.listo.delivery](https://docs.listo.delivery) lists them all.

## Verify a webhook

Verification needs the secret, not an API key, so it is also a plain module.
Pass the body exactly as received (never re-serialized JSON):

```ruby
begin
  event = ListoDelivery::Webhooks.construct_event(
    request.body.read, request.headers["X-Listo-Signature"], ENV.fetch("LISTO_WEBHOOK_SECRET")
  )
rescue ListoDelivery::Error
  head 400 # invalid_signature or invalid_payload: do not act on it
else
  case event
  when ListoDelivery::Models::DeliveryStatusChangedEvent then event.data.status
  end
end
```

`construct_event` raises `ListoDelivery::SignatureError` when the signature
does not verify, and `ListoDelivery::Error` with code `invalid_payload` when the
signed body is not a JSON object; both are `ListoDelivery::Error`, so a receiver
that answers 400 rescues `ListoDelivery::Error`. `ListoDelivery::Webhooks.verify(raw_body, signature_header, secrets)`
returns true or false and never raises. `secrets` is one string or a list (two
during a rotation); `tolerance:` (default 300 seconds, in both directions) and
`now:` (unix seconds) are keywords. `client.webhooks.verify` and
`client.webhooks.construct_event` are the same functions. An event whose
`type` this SDK does not know comes back as a plain `Models::WebhookEvent`
(`id`, `type`, `created_at`, and `data` as the raw Hash), never an error.

## Errors

Every non-2xx answer raises `ListoDelivery::Error` with `code` (branch on this),
`message`, `param`, `retryable`, `status`, `request_id`, `doc_url` and the
parsed `body`. A body that is not the API's error envelope (a proxy's HTML
page) raises the same class with `code` `"http_<status>"`. A request that got
no answer (DNS, refused, timeout) raises `ListoDelivery::ConnectionError`
(`code` `"connection_error"`, `status` nil, `retryable` false: a write may
have happened, so you decide). The API key is never put in an error message.

```ruby
begin
  client.deliveries.retrieve("dlv_missing")
rescue ListoDelivery::Error => e
  warn "#{e.code} (#{e.status}) request #{e.request_id}"
end
```

## Idempotency

`deliveries.create`, `deliveries.refund`, `stores.create`, `stores.reactivate_plan`
and `stores.cancel_plan` (the operations whose schema declares the
`Idempotency-Key` header) accept `idempotency_key:`. Without one, a fresh UUID
is sent per call and reused only by that call's own retries. No other
operation sends the header, and passing `idempotency_key:` to one raises
`ArgumentError` before any request (a body field really named that goes inside
the Hash argument). An empty or blank key raises `ArgumentError` too.

## Pagination

Lists return the page as the API has it: `data`, `has_more` and `cursor`. Pass
the cursor back to read the next page:

```ruby
cursor = nil
loop do
  page = client.deliveries.list(cursor: cursor)
  page.data.each { |delivery| puts delivery.id }
  break unless page.has_more

  cursor = page.cursor
end
```

## Retries and timeouts

Nothing is retried by default. With `max_retries: n`, only a 429 is retried,
after its `Retry-After` (seconds or an HTTP date, one second when missing,
capped at 60), at most `n` times, with the same idempotency key. 5xx answers
and network failures are never retried for you. `timeout:` (seconds, default
30) bounds connecting, writing and reading.

```ruby
ListoDelivery::Client.new(api_key: key, max_retries: 2, timeout: 10, base_url: "https://api.listo.delivery")
```

## Differences from the other SDKs

Ruby spells operations in snake_case, takes
request fields as keywords or one Hash, and has no top-level `Listo`
constant (it could clash with an application's own); the client is
`ListoDelivery::Client`.

## About this repository

This code is generated from Listo's API definition. Issues and questions are
welcome in this repository. Changes are made upstream by Listo and released
here, so a pull request cannot be merged as it stands: open an issue and the
change is made at the source.
