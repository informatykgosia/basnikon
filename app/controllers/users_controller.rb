class UsersController < ApplicationController
  before_filter :admin_required, :only => [:index, :destroy]
  before_filter :authenticate, :only => [:edit]
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Rejestracja udana!"
      redirect_to heros_path
    else
      render :action => "new"
    end
  end
  def show
    
      @user = User.find(params[:id])
      @heros = @user.heros   
    @heros_by_letter = @heros.group_by{ |s| s.name.first.upcase}.sort
  end
  def edit
   if  current_user.admin?
    @user = User.find(params[:id])
   else
     @user = current_user
  end
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Zaktualizowano dane!"
      redirect_to :action =>"show"
    else
      render :action => 'edit'
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end
