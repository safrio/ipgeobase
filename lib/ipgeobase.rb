# frozen_string_literal: true

require_relative 'ipgeobase/version'
require 'rest-client'
require 'happymapper'
require 'resolv'
require 'addressable/template'
require_relative 'ipgeobase/model'

module Ipgeobase
  include Model

  API_URL = 'http://ip-api.com/xml/{ip}'

  def self.lookup(ip)
    validate(ip)

    address = Addressable::Template.new(API_URL).expand({ ip: ip }).to_s
    response = RestClient.get(address)
    IpMeta.parse(response)
  rescue StandardError => e
    raise "Can't obtain geodata: #{e.message}"
  end

  def self.validate(ip)
    raise "Can't resolve ip: #{ip}" unless ip.to_s =~ Resolv::IPv4::Regex || ip.to_s =~ Resolv::IPv6::Regex
  end
end
