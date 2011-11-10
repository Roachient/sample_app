class UsersController < ApplicationController
  
  #def index
  #end
  #
  #def login
  #  if User.validate(params[:username], params[:password])
  #    session[:user] = User.find_by_username(params[:username])
  #    flash[:notice] = "Successful Login"
  #  else
  #    flash[:error] = "Incorrect credentials"
  #  end
  #  redirect_to :bookmarks
  #
  #end
  
  #def logout
  #  session[:user] = nil
  #  flash[:notice] = "You are now Logged Out"
  #  redirect_to :bookmarks
  #end
  
  def new
    @user = User.new
    @title = User.new
  end
  
  #def create
  #  @user = User.new(params[:user])
  #  
  #  respond_to do |format|
  #    if @user.save
  #      session[:user] = @user
  #      format.html {redirect_to(@user, :notice => "Account Created")}
  #    else
  #      format.html {render :action => "new"}
  #    end
  #  end
  #end

  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  #def edit
  #  @user = User.find(session[:user].id)
  #end
  #
  #def update
  #  @user = User.find(params[:id])
  #  respond_to do |format|
  #    if @user.update_attributes(params[:user])
  #      format.html{redirect_to(@user, :notice => "Account Updated and Saved")}
  #    else
  #      format.html{render :action => :edit, :error => "Account Not Updated"}
  #    end
  #  end
  #end
end
