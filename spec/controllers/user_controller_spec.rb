require 'rails_helper'

describe UsersController, :type => :controller do
  
  before do
    #@user = User.create!(email: "john.smith@hotmail.com", password: "123456")
    #@user2 = User.create!(email: "anna.white@hotmail.com", password: "testok")
    @user = FactoryGirl.create(:user)

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
         redirect_to(new_user_session_path)
       end
     end

     context "Unathorized access to user account" do
        before do
          sign_in @user
        end
        it "redirects to root_path" do
          get :show, params: {id: @user.id}
          redirect_to(root_path)
        end
      end
  end
end

