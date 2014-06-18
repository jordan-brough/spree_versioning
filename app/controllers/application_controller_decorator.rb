ApplicationController.class_eval do
  # NOTE: Spree::Api::BaseController has its own version of this.  (It doesn't inherit
  #       from ApplicationController and works differently anyway)
  def user_for_paper_trail
    try_spree_current_user
  end
end
