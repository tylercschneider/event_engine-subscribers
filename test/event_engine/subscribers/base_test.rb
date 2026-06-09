require "test_helper"

module EventEngine
  module Subscribers
    class BaseTest < ActiveSupport::TestCase
      teardown do
        Registry.clear!
      end

      test "subscribes_to registers the subclass for the event" do
        subscriber = Class.new(Base) do
          subscribes_to :cow_fed
        end

        assert_includes Registry.subscribers_for(:cow_fed), subscriber
      end

      test "handle raises NotImplementedError until a subclass implements it" do
        subscriber = Class.new(Base)

        assert_raises(NotImplementedError) do
          subscriber.new.handle(:any_event)
        end
      end
    end
  end
end
