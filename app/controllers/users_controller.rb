class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_user_id_and_analysis, only: [ :analysis_show, :analysis_edit, :analysis_update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @analysis = @user.build_analysis
  end


  def analysis_show
    @analysis = @user.analysis
    @bins = @user.bins
  end

  def analysis_edit
    @analysis = @user.analysis
  end

  def analysis_update
    @analysis = @user.analysis
    respond_to do |format|
      if @analysis.update(analysis_params)
        format.html { redirect_to user_analysis_show_path(@user) }
        flash[:success] = "User was successfully updated."
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :analysis_edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @analysis = @user.build_analysis(num1:"0", num2:"0")


    respond_to do |format|
      if @user.save && @analysis.save
        format.html { redirect_to @user }
        flash[:success] = "User was successfully created."
        format.json { render :show, status: :created, location: @user }
        log_in(@user)
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_user_id_and_analysis
      @user = User.find(params[:user_id])
      @analysis = @user.analysis
    end



    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def analysis_params
      params.require(:analysis).permit(:num1, :num2, :user_id)
    end


end
