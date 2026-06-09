module EventEngine
  module Subscribers
    class Handler
      HANDLED_PROCESS_TYPES = [ :inline, :background ].freeze

      def call(event)
        return unless handles?(event)

        Registry.subscribers_for(event.event_name).each { |subscriber| subscriber.new.handle(event) }
        event
      end

      def handles?(event)
        HANDLED_PROCESS_TYPES.include?(event.process_type&.to_sym)
      end
    end
  end
end
