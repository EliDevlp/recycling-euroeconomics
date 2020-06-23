class BinsController < ApplicationController


  def edit
    @user = User.find(params[:user_id])
    @bin = @user.bins.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @bin = @user.bins.find(params[:id])

    respond_to do |format|
      if @bin.update(bin_params)
        format.html { redirect_to user_analysis_show_path(@user) }
        flash[:success] = "bins were successfully updated."
      else
        format.html { render :edit }
        format.json { render json: @bin.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def bin_params
    params.require(:bin).permit(:colour, :quantity, :user_id)
  end
end
