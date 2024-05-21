require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.ignore_localhost = true

  config.ignore_request do |request|
    # ignore all requests to datadoghq hosts
    request.uri =~ /datadoghq/
  end
end

require 'webmock/rspec'
WebMock.disable_net_connect!(:allow => /datadoghq/)
