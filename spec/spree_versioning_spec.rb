require 'spec_helper'

describe SpreeVersioning do
  describe "#track_models" do
    before(:each) do
      @config = SpreeVersioning.configuration
    end

    it "calls has_paper_trail on all tracked models" do
      @config.models_to_track.each do |model|
        model.should_receive(:has_paper_trail)
      end
      SpreeVersioning.track_models
    end

    it "throws a runtime error if one of the models does not inherit from ActiveRecord::Base" do
      SpreeVersioning.configure { |config| config.include [Spree::Ability] }
      expect { SpreeVersioning.track_models }.to raise_error
    end
  end
end

