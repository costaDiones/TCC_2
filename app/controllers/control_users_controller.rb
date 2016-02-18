class ControlUsersController < ApplicationController

  def index


  		if params[:search]
	@users = User.where("nome like ?", "%#{params[:search]}%")
		else
      @users = User.all
      authorize @users
		end




  end


end
