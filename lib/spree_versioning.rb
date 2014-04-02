require 'spree'
require 'spree_versioning/engine'
require 'spree_versioning/config'
require 'spree_versioning/auth_helper'
require 'paper_trail'

module SpreeVersioning
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def track_models
      configuration.models_to_track.each do |model|
        unless model < ActiveRecord::Base
          raise "#{model} does not inherit from ActiveRecord::Base"
        end
        model.has_paper_trail
      end
    end
  end
end
