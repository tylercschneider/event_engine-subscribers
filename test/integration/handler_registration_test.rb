require "test_helper"

class HandlerRegistrationTest < ActiveSupport::TestCase
  test "registers its handler with the core bus at boot" do
    registered = EventEngine.handler_registry
      .instance_variable_get(:@handlers)
      .any? { |registration| registration[:handler].is_a?(EventEngine::Subscribers::Handler) }

    assert registered
  end
end
