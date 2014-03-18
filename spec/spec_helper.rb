require "rspec"
require "webmock/rspec"
require "wimp"
require "vcr"
require "uri"

RSpec.configure do |config|
  config.mock_with :rspec
end

VCR.configure do |c|
  c.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  c.hook_into :webmock
  c.default_cassette_options = {
    record: :new_episodes
  }
  c.allow_http_connections_when_no_cassette = false
  c.configure_rspec_metadata!
end