require 'spec_helper'

describe "whodunnit" do
  let(:user)  { create(:admin_user) }

  before do
    SpreeVersioning.track_models
    Spree::Admin::BaseController.any_instance.stub(:spree_current_user).and_return(user)
  end

  it "records the admin user who makes changes" do
    expect do
      post("/admin/promotions", {"promotion" => {"name" => "some promo"}})
    end.to change { Spree::Promotion.count }

    promotion = Spree::Promotion.order('id asc').last

    expect(promotion.versions.last.whodunnit.to_i).to eq user.id
  end
end
