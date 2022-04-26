require 'rails_helper'
require 'spec_helper'

describe UsersController do
  let(:user) {User.create(name: "DatTT", password: "123123")}

  let(:valid_attributes) do
    {
      name: "test",
      password: "123123"
    }
  end

  before(:each) do
    request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  describe "GET index" do
    it "assigns all users as @users" do
      new_user = User.create! valid_attributes
      get :index
      assigns(:users).should eq([user, new_user])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      new_user = User.create! valid_attributes
      get :show, params: {id: new_user.id}
      assigns(:user).should eq(new_user)
    end
  end
end
