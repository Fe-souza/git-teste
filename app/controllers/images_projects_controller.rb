class ImagesProjectsController < ApplicationController
  before_action :set_images_project, only: [:show, :edit, :update, :destroy]

  # GET /images_projects
  # GET /images_projects.json
  def index
    @images_projects = ImagesProject.all
  end

  # GET /images_projects/1
  # GET /images_projects/1.json
  def show
  end

  # GET /images_projects/new
  def new
    @images_project = ImagesProject.new
  end

  # GET /images_projects/1/edit
  def edit
  end

  # POST /images_projects
  # POST /images_projects.json
  def create
    @images_project = ImagesProject.new(images_project_params)

    respond_to do |format|
      if @images_project.save
        format.html { redirect_to @images_project, notice: 'Images project was successfully created.' }
        format.json { render :show, status: :created, location: @images_project }
      else
        format.html { render :new }
        format.json { render json: @images_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images_projects/1
  # PATCH/PUT /images_projects/1.json
  def update
    respond_to do |format|
      if @images_project.update(images_project_params)
        format.html { redirect_to @images_project, notice: 'Images project was successfully updated.' }
        format.json { render :show, status: :ok, location: @images_project }
      else
        format.html { render :edit }
        format.json { render json: @images_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images_projects/1
  # DELETE /images_projects/1.json
  def destroy
    @images_project.destroy
    respond_to do |format|
      format.html { redirect_to images_projects_url, notice: 'Images project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_images_project
      @images_project = ImagesProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def images_project_params
      params.require(:images_project).permit(:id_projeto, :img, :tipo)
    end
end
