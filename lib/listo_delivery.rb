# frozen_string_literal: true

require_relative "listo_delivery/version"
require_relative "listo_delivery/errors"
require_relative "listo_delivery/util"
require_relative "listo_delivery/model"
require_relative "listo_delivery/generated/loader"
require_relative "listo_delivery/webhooks"
require_relative "listo_delivery/client"

# Official Ruby client for the Listo Delivery API.
#
#   require "listo_delivery"
#   client = ListoDelivery::Client.new(api_key: "lst_test_...")
module ListoDelivery
end
