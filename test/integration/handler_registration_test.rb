require "test_helper"

class HandlerRegistrationTest < ActiveSupport::TestCase
  test "registers its handler with the core bus at boot" do
    registered = EventEngine.handler_registry
      .instance_variable_get(:@handlers)
      .any? { |registration| registration[:handler].is_a?(EventEngine::Subscribers::Handler) }

    assert registered
  end

  test "the core bus can dispatch an event to the registered handler" do
    event = EventEngine::Event.new(process_type: :inline)

    assert_nothing_raised { EventEngine.dispatch(event) }
  end
end
