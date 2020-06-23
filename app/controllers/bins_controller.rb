class BinsController < ApplicationController
  def new
    @analysis = @user.analysis
    @bin = @analysis.build_bin

      respond_to do |format|
        format.html
        format.js
      end
  end

  def create
    @analysis = @user.analysis
    @bin = @analysis.build_bin(bin_params)
  end

  def index
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def bin_params
    params.require(:bin).permit(:colour, :quantity, :analysis_id)
  end
end
