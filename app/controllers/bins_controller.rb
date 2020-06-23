class BinsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @bin = @user.bins.build

      respond_to do |format|
        format.html
        format.js
      end
  end

  def create
    @user = User.find(params[:user_id])
    @bin = @user.bins.build(bin_params)

    respond_to do |format|
      if @bin.save
        format.html { redirect_to user_analysis_show_path(@user) }
        flash[:success] = "bins were successfully created."
      else
        format.html { render :new }
        format.json { render json: @bin.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def bin_params
    params.require(:bin).permit(:colour, :quantity, :user_id)
  end
end
