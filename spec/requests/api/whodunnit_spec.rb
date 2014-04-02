require 'spec_helper'

describe "whodunnit" do
  let(:user)  { create(:admin_user) }
  let!(:order) { create(:order_with_line_items) }

  before do
    SpreeVersioning.track_models
    user.generate_spree_api_key!
  end

  it "records the api user who makes changes" do
    expect do
      put "/api/orders/#{order.number}/addresses/#{order.ship_address.id}", token: user.spree_api_key, address: { address1: order.ship_address.address1 + "1" }
    end.to change { order.ship_address.reload.address1 }
    response.status.should == 200

    expect(order.ship_address.versions.last.whodunnit.to_i).to eq user.id
  end
end
