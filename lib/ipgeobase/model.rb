# frozen_string_literal: true

require 'happymapper'

module Ipgeobase
  module Model
    class IpMeta
      include HappyMapper

      tag 'query'

      element :city, String
      element :country, String
      element :countryCode, String
      element :lat, Float
      element :lon, Float
    end
  end
end
