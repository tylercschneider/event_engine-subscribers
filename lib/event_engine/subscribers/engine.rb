module EventEngine
  module Subscribers
    class Engine < ::Rails::Engine
      isolate_namespace EventEngine::Subscribers

      initializer "event_engine.subscribers.register_handler" do
        config.after_initialize do
          EventEngine.register_handler(Handler.new, levels: :all)
        end
      end
    end
  end
end
