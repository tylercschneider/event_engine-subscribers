require "test_helper"

module EventEngine
  module Subscribers
    class HandlerTest < ActiveSupport::TestCase
      teardown { Registry.clear! }

      test "runs subscribers synchronously for an :inline event" do
        handled = []
        subscriber = Class.new { define_method(:handle) { |event| handled << event } }
        Registry.register(:cow_fed, subscriber)
        event = EventEngine::Event.new(event_name: :cow_fed, process_type: :inline)

        Handler.new.call(event)

        assert_equal [ event ], handled
      end

      test "handles an :inline event" do
        event = EventEngine::Event.new(process_type: :inline)

        assert Handler.new.handles?(event)
      end

      test "handles a :background event" do
        event = EventEngine::Event.new(process_type: :background)

        assert Handler.new.handles?(event)
      end

      test "does not handle a :durable event" do
        event = EventEngine::Event.new(process_type: :durable)

        assert_not Handler.new.handles?(event)
      end
    end
  end
end
