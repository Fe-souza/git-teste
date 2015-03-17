class HistoricalProjectsController < ApplicationController
  before_action :set_historical_project, only: [:show, :edit, :update, :destroy]

  # GET /historical_projects
  # GET /historical_projects.json
  def index
    @historical_projects = HistoricalProject.all
  end

  # GET /historical_projects/1
  # GET /historical_projects/1.json
  def show
  end

  # GET /historical_projects/new
  def new
    @historical_project = HistoricalProject.new
  end

  # GET /historical_projects/1/edit
  def edit
  end

  # POST /historical_projects
  # POST /historical_projects.json
  def create
    @historical_project = HistoricalProject.new(historical_project_params)

    respond_to do |format|
      if @historical_project.save
        format.html { redirect_to @historical_project, notice: 'Historical project was successfully created.' }
        format.json { render :show, status: :created, location: @historical_project }
      else
        format.html { render :new }
        format.json { render json: @historical_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historical_projects/1
  # PATCH/PUT /historical_projects/1.json
  def update
    respond_to do |format|
      if @historical_project.update(historical_project_params)
        format.html { redirect_to @historical_project, notice: 'Historical project was successfully updated.' }
        format.json { render :show, status: :ok, location: @historical_project }
      else
        format.html { render :edit }
        format.json { render json: @historical_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historical_projects/1
  # DELETE /historical_projects/1.json
  def destroy
    @historical_project.destroy
    respond_to do |format|
      format.html { redirect_to historical_projects_url, notice: 'Historical project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historical_project
      @historical_project = HistoricalProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historical_project_params
      params.require(:historical_project).permit(:id_projeto, :user_id_admin, :tipo, :descricao, :visivel_cliente, :inserido_cliente, :data_criacao)
    end
end
