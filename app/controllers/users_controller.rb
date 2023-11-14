class UsersController < ApplicationController
  def index; end
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: 'User was successfully destroyed.' }
    end
  end
end
