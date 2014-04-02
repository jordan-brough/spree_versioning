# temporary workaround for this: https://github.com/airblade/paper_trail/pull/351
# TODO: Remove when papertrail PR is resolved
if !defined?(ActionController::API)
  class ActionController::API; end
end

Spree::Api::BaseController.class_eval do
  def user_for_paper_trail
    current_api_user
  end

  # Spree::Api::BaseController does not inherit from ActionController::Base in Spree 2.1 but it does in Spree 2.2.
  # If it doesn't inherit from ActionController::Base then we need to include it ourselves.
  if !(Spree::Api::BaseController < ActionController::Base)
    include PaperTrail::Rails::Controller
    # TODO: Possibly remove the following when the papertrail PR above is resolved, depending on how it is resolved.
    # Spree::Api::BaseController does not inherit from ActionController::Base in Spree 2.1 but it does in Spree 2.2,
    # and that is what currently determines whether or not the before_filters are added by PaperTrail.
    # See here: https://github.com/jordan-brough/paper_trail/blob/ffd7bc2/lib/paper_trail/frameworks/rails.rb#L6
    # If the filters aren't added by PaperTrail automatically then we need to add them manually.
    if Spree::Api::BaseController._process_action_callbacks.none? { |c| c.raw_filter == :set_paper_trail_enabled_for_controller }
      before_filter :set_paper_trail_enabled_for_controller
      before_filter :set_paper_trail_whodunnit, :set_paper_trail_controller_info
    end
  end
end
