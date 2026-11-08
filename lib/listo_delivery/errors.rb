# frozen_string_literal: true

module ListoDelivery
  # Raised for every non-2xx answer. The fields come from the API's `error`
  # envelope; a body that is not that envelope (a proxy's HTML page, other
  # JSON) still raises this class, with `code` "http_<status>".
  class Error < StandardError
    # @return [String, nil] the stable code to branch on, never `message`
    attr_reader :code
    # @return [String, nil] the request field the error is about
    attr_reader :param
    # @return [Boolean, nil] whether the same call may be repeated
    attr_reader :retryable
    # @return [Integer, nil] the HTTP status; nil when no answer arrived
    attr_reader :status
    # @return [String, nil] quote this when asking for support
    attr_reader :request_id
    # @return [String, nil] the docs page for `code`
    attr_reader :doc_url
    # @return [Object, nil] the parsed response body, or the raw text when it is not JSON
    attr_reader :body

    def initialize(message = nil, code: nil, param: nil, retryable: nil, status: nil, request_id: nil, doc_url: nil, body: nil)
      super(message)
      @code = code
      @param = param
      @retryable = retryable
      @status = status
      @request_id = request_id
      @doc_url = doc_url
      @body = body
    end

    def retryable?
      retryable == true
    end
  end

  # The request never got an answer (DNS, refused, timeout). A write may or
  # may not have happened, so this is never retried for you.
  class ConnectionError < Error
    def initialize(message = nil, **rest)
      super(message, code: "connection_error", retryable: false, **rest)
    end
  end

  # A webhook whose signature does not verify (see Webhooks.construct_event).
  class SignatureError < Error
    def initialize(message = "The webhook signature does not match.", **rest)
      super(message, code: "invalid_signature", retryable: false, **rest)
    end
  end
end
