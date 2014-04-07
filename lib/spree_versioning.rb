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
      return if ( File.basename($0) == "rake" && ARGV.include?("db:migrate") )
      configuration.models_to_track.each do |model|
        unless model < ActiveRecord::Base
          raise "#{model} does not inherit from ActiveRecord::Base"
        end
        model.has_paper_trail
      end

      # in certain cases we have to apply papertrail to STI subclasses individually.
      # all subclasses need to be set up correctly with papertrail or else papertrail will blow up.
      #
      # example problem scenario:
      #   Spree::Promotion::Actions::CreateAdjustment defines its own "has_many :adjustments"
      #   relationship.   From that point on it doesn't inherit any new associations that are added
      #   to its base class.  The Papertrail "has_many :versions" relationship is added to the base
      #   class after that point so we have to specifically add papertrail to CreateAdjustment.
      configuration.models_to_track.map(&:descendants).flatten.uniq.each do |descendant|
        if !descendant.reflections.keys.include?(:versions)
          descendant.has_paper_trail
        end
      end
    end
  end
end
