module EventEngine
  module Subscribers
    class Handler
      HANDLED_PROCESS_TYPES = [ :inline, :background ].freeze

      def call(event)
        handles?(event)
      end

      def handles?(event)
        HANDLED_PROCESS_TYPES.include?(event.process_type&.to_sym)
      end
    end
  end
end
