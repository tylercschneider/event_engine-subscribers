require "test_helper"

module EventEngine
  module Subscribers
    class RegistryTest < ActiveSupport::TestCase
      class FakeSubscriber; end

      teardown do
        Registry.clear!
      end

      test "registers a subscriber retrievable by event name" do
        Registry.register(:cow_fed, FakeSubscriber)

        assert_includes Registry.subscribers_for(:cow_fed), FakeSubscriber
      end
    end
  end
end
