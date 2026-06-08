Rails.application.routes.draw do
  mount EventEngine::Subscribers::Engine => "/event_engine-subscribers"
end
