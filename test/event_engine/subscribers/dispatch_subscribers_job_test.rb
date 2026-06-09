require "test_helper"

module EventEngine
  module Subscribers
    class DispatchSubscribersJobTest < ActiveSupport::TestCase
      teardown { Registry.clear! }

      test "perform runs the event's subscribers" do
        handled = []
        subscriber = Class.new { define_method(:handle) { |event| handled << event } }
        Registry.register(:cow_fed, subscriber)

        DispatchSubscribersJob.perform_now("cow_fed", { event_name: :cow_fed, process_type: :background })

        assert_equal 1, handled.size
      end
    end
  end
end
