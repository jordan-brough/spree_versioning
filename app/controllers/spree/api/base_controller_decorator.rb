# TODO: Delete the following chunk as soon as PaperClip has bumped up its gem version to include this:
#       https://github.com/airblade/paper_trail/pull/352/files
#
if !defined?(ActionController::API)
  class ActionController::API; end
end

Spree::Api::BaseController.class_eval do
  def user_for_paper_trail
    current_api_user
  end
end
