# frozen_string_literal: true

require 'test_helper'
require 'webmock/minitest'
require 'minitest/autorun'

class IpgeobaseTest < Minitest::Test
  def before_setup
    body = File.read('./test/fixtures/ip_response.xml')

    stub_request(:get, 'http://ip-api.com/xml/83.169.216.199').to_return(status: 200, body: body)
  end

  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_lookup_correct_data
    test_instance = Ipgeobase.lookup('83.169.216.199')

    assert_equal test_instance.city, 'Baranchinskiy'
    assert_equal test_instance.country, 'Russia'
    assert_equal test_instance.countryCode, 'RU'
    assert_equal test_instance.lat, 58.1617
    assert_equal test_instance.lon, 59.6991
  end

  def test_lookup_incorrect_ip
    assert_raises RuntimeError do
      Ipgeobase.lookup('incorrect_ip')
    end
  end
end
