module EventEngine
  module Subscribers
    class Engine < ::Rails::Engine
      isolate_namespace EventEngine::Subscribers
    end
  end
end
