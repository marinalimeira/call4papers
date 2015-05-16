require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:user) { create(:user) }

  context "Edit event" do
    let(:new_user) { create(:user, email: 'name@example.com') }
    let(:event) { create(:event, user: user) }

    before{
      sign_in(new_user)
      patch :update, id: event.id, event: attributes_for(:event)
    }

    it "can't be from another user" do
      expect(response).to redirect_to(root_path) 
      expect(flash[:alert]).to eq("Não é possível editar esse evento!")
    end
  end
end