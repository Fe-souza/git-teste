class UserAdminsController < ApplicationController
  before_action :set_user_admin, only: [:show, :edit, :update, :destroy]

  # GET /user_admins
  # GET /user_admins.json
  def index
    @user_admins = UserAdmin.all
  end

  # GET /user_admins/1
  # GET /user_admins/1.json
  def show
  end

  # GET /user_admins/new
  def new
    @user_admin = UserAdmin.new
  end

  # GET /user_admins/1/edit
  def edit
  end

  # POST /user_admins
  # POST /user_admins.json
  def create
    @user_admin = UserAdmin.new(user_admin_params)

    respond_to do |format|
      if @user_admin.save
        format.html { redirect_to @user_admin, notice: 'User admin was successfully created.' }
        format.json { render :show, status: :created, location: @user_admin }
      else
        format.html { render :new }
        format.json { render json: @user_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_admins/1
  # PATCH/PUT /user_admins/1.json
  def update
    respond_to do |format|
      if @user_admin.update(user_admin_params)
        format.html { redirect_to @user_admin, notice: 'User admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_admin }
      else
        format.html { render :edit }
        format.json { render json: @user_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_admins/1
  # DELETE /user_admins/1.json
  def destroy
    @user_admin.destroy
    respond_to do |format|
      format.html { redirect_to user_admins_url, notice: 'User admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_admin
      @user_admin = UserAdmin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_admin_params
      params.require(:user_admin).permit(:user_id_admin, :nome_usuario, :email_usuario, :ddd_usuario, :fone_usuario, :chave_admin, :perfil_usuario, :status)
    end
end
