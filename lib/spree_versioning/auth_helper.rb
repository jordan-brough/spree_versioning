class ActionController::Base
  # NOTE: This is overridden in Spree::Api::BaseController to use 'current_api_user'
  def user_for_paper_trail
    try_spree_current_user
  end
end
