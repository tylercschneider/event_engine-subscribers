module EventEngine
  module Subscribers
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
