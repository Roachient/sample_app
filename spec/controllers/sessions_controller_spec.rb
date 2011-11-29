require 'spec_helper'

describe SessionsController do
  render_views

  describe "GET 'new'" do

    it "should be successful" do
      get :new
      response.should be_success
    end

    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => "Sign in")
    end
  end
  
  
  
  describe "POST 'create'" do
    
    describe "invalid signin" do
      before(:each) do
        @attr = { :email => "email@example.com", :password => "invalid" }
      end
      it "should re-render the new page" do
        post :create, :session => @attr
        response.should render_template('new')
      end
      it "should have the right title" do
        post :create, :session => @attr
        response.should have_selector("title", :content => "Sign in")
      end
      it "should have a flash.now message" do
        post :create, :session => @attr
        flash.now[:error].should =~ /invalid/i
      end
    end
    describe "with valid email and password" do
      before(:each) do
        @user = Factory(:user)
        @attr = { :email => @user.email, :password => @user.password }
      end
      it "should sign the user in" do
        post :create, :session => @attr
        controller.current_user.should == @user
        controller.should be_signed_in
      end
      it "should redirect to the user show page" do
        post :create, :session => @attr
        response.should redirect_to(user_path(@user))
      end
    end
    
    describe "DELETE 'destroy'" do
      #it "should sign a user out" do
      #  test_sign_in(Factory(:user))
      #  delete :destroy
      #  controller.should_not be_signed_in
      #  response.should redirect_to(root_path)
      #end
    before(:each) do
      @user = Factory(:user)
    end

    describe "as a non-signed-in user" do
      it "should deny access" do
        delete :destroy, :id => @user
        response.should redirect_to(signin_path)
      end
    end

    describe "as a non-admin user" do
      it "should protect the page" do
        test_sign_in(@user)
        delete :destroy, :id => @user
        response.should redirect_to(root_path)
      end
    end

    describe "as an admin user" do

      before(:each) do
        admin = Factory(:user, :email => "admin@example.com", :admin => true)
        test_sign_in(admin)
      end

      it "should destroy the user" do
        lambda do
          delete :destroy, :id => @user
        end.should change(User, :count).by(-1)
      end

      it "should redirect to the users page" do
        delete :destroy, :id => @user
        response.should redirect_to(users_path)
      end
    end
    end
  end
end