class ActionController::Base
  def user_for_paper_trail
    respond_to?(:current_api_user) ? current_api_user : try_spree_current_user
  end
end
