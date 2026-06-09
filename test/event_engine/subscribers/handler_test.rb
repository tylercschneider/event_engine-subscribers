require "test_helper"

module EventEngine
  module Subscribers
    class HandlerTest < ActiveSupport::TestCase
      test "handles an :inline event" do
        event = EventEngine::Event.new(process_type: :inline)

        assert Handler.new.handles?(event)
      end

      test "handles a :background event" do
        event = EventEngine::Event.new(process_type: :background)

        assert Handler.new.handles?(event)
      end
    end
  end
end
