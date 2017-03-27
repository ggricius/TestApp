require 'rails_helper'
describe UsersController, :type => :controller do

  before do
    @user = User.create!(email: "example@example.com", password: "testpassed123")
    @user2 = User.create!(email: "example1@example.com", password: "testpasseddfdf123")
  end
  describe 'GET #show' do
     context 'User is logged in' do
       before do
         sign_in @user
       end
       it "loads correct user details" do
         get :show, params: {id: @user.id}
         expect(response).to have_http_status(200)
         expect(assigns(:user)).to eq @user
       end
     end
     context 'No user is logged in' do
       it 'redirects to login' do
         get :show, id: @user.id
         expect(response).to redirect_to(new_user_session_path)
       end
     end
      context "cannot access second user show page" do
        it "redirects to root" do
          get :show, params: { id: @user.id }
          redirect_to(fallback_location: root_path)
        end
      end
  end
end
