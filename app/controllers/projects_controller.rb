class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.new
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @HistoricalProject =  HistoricalProject.where(:id_projeto =>params[:id])
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create

   
   #@project = Project.new(project_params) 
    @objetivo = params[:project][:objetivo]
    @publico_alvo = params[:project][:publico_alvo]
    @inf_obrigatorias = params[:project][:inf_obrigatorias]

    if not (@objetivo.nil?)
      @objetivo = params[:project][:objetivo].join(",")  
    end

    if not (@publico_alvo.nil?)
      @publico_alvo = params[:project][:publico_alvo].join(",") 
    end 

    if not (@inf_obrigatorias.nil?)
      @inf_obrigatorias = params[:project][:inf_obrigatorias].join(",")     
    end  


    Project.new do |o|

      o.id_projeto       = params[:project][:id_projeto]     
      o.cod_cliente      = params[:project][:cod_cliente]
      o.id_categoria     = params[:project][:id_categoria]
      o.id_sub_categoria = params[:project][:id_sub_categoria]
      o.data_criacao     = Time.now
      o.titulo           = params[:project][:titulo]
      o.descricao        = params[:project][:descricao]
      o.solicitante      = params[:project][:solicitante]
      o.data_prazo       = params[:project][:data_prazo]
      o.status           = params[:project][:status]
      o.prospeccao       = params[:project][:prospeccao]
      o.criador_projeto  = params[:project][:criador_projeto]
      o.veiculo          = params[:project][:veiculo]
      o.formato          = params[:project][:formato]
      o.formato_outro    = params[:project][:formato_outro]
      o.formato2         = params[:project][:formato2]
      o.formato_outro2   = params[:project][:formato_outro2]
      o.linguagem        = params[:project][:linguagem]
      o.objetivo         = @objetivo
      o.publico_alvo     = @publico_alvo
      o.inf_obrigatorias = @inf_obrigatorias
      o.concorrentes     = params[:project][:concorrentes]
      o.referencia_web   = params[:project][:referencia_web]
      o.titulo_projeto   = params[:project][:titulo_projeto]
      o.empresa          = params[:project][:empresa]

      o.save  

    @image_selo_qualidade = params[:project][:img]
    @image_packshot = params[:project][:image_packshot]    
    @image_outros_selos = params[:project][:image_outros_selos]    
    @image_selo_iso = params[:project][:image_selo_iso]     
    @image_referencia = params[:project][:image_referencia]

        if not (@image_selo_qualidade.nil?)
          @images_project = ImagesProject.create(:id_projeto =>o.id,:img =>@image_selo_qualidade,:tipo =>"selo_qualidade")
        end  
        if not (@image_packshot.nil?)
          @images_packshot = ImagesProject.create(:id_projeto =>o.id,:img =>@image_packshot,:tipo =>"packshot_produtos")
        end
        if not (@image_selo_iso.nil?)
          @images_selo_iso = ImagesProject.create(:id_projeto =>o.id,:img =>@image_selo_iso,:tipo =>"selo_iso")
        end
        if not (@image_outros_selos.nil?)
          @images_outros_selos = ImagesProject.create(:id_projeto =>o.id,:img =>@image_outros_selos,:tipo =>"outros_selos")
        end
        if not (@image_referencia.nil?)
          @images_referencia = ImagesProject.create(:id_projeto =>o.id,:img =>@image_referencia,:tipo =>"referencias")
        end 

        
    end   

  

    
    respond_to do |format|       
    #if @project.save        

        format.html { redirect_to '/projects/', notice: 'Project was successfully created.' }
        #format.html { redirect_to @project, notice: 'Project was successfully created.' }
        #format.json { render :show, status: :created, location: @project }
      # else
      #   format.html { render :new }
      #   format.json { render json: @project.errors, status: :unprocessable_entity }
      # end
     end
   end


 def busca
    

     @id_categoria = params[:project][:id_categoria]
     @titulo       = params[:project][:titulo]
     @data_inicial = params[:project][:data_inicial]
     @data_final   = params[:project][:data_final]

     if not (@data_inicial == "")
       @data_inicial =  @data_inicial.to_time.strftime("%Y-%m-%d 00:00:00")
     end 
     if not (@data_final == "")
       @data_final = @data_final.to_time.strftime("%Y-%m-%d 00:00:00")
     end 
 


    if not (@id_categoria =="")  
      @list_projects = Project.where(:id_categoria =>@id_categoria)
    end
    if not (@titulo=="")  
      @list_projects = Project.where(:titulo =>@titulo)
    end
    if not (@data_inicial=="")  
      @list_projects = Project.where(:data_inicial =>@data_inicial)
    end
    if not (@data_final=="")  
      @list_projects = Project.where(:data_final =>@data_final)
    end

    if not (@titulo =="" or @id_categoria =="")  
      @list_projects = Project.where(:id_categoria =>@id_categoria,:titulo =>@titulo)
    end
    if not (@data_inicial =="" or @id_categoria =="")  
      @list_projects = Project.where(:id_categoria =>@id_categoria,:data_inicial =>@data_inicial)
    end
    if not (@data_final =="" or @id_categoria =="")  
      @list_projects = Project.where(:id_categoria =>@id_categoria,:data_final =>@data_final)
    end
    if not (@titulo =="" or @data_inicial =="")  
      @list_projects = Project.where(:titulo =>@titulo,:data_inicial =>@data_inicial)
    end
    if not (@titulo =="" or @data_final =="")  
      @list_projects = Project.where(:titulo =>@titulo,:data_final =>@data_final)
    end
    if not (@data_inicial =="" or @data_final =="")  
      @list_projects = Project.where(:data_inicial =>@data_inicial,:data_final =>@data_final)
    end

    if not (@titulo =="" or @id_categoria =="" or @data_inicial =="")  
      @list_projects = Project.where(:id_categoria =>@id_categoria,:titulo =>@titulo,data_criacao:(@data_inicial)..Time.now.midnight)
    end
    if not (@titulo =="" or @id_categoria =="" or @data_final =="")  
      @list_projects = Project.where(:id_categoria =>@id_categoria,:titulo =>@titulo,data_criacao:(Time.now.midnight)..@data_final)
    end

    if not (@titulo =="" or @data_inicial =="" or @data_final =="")  
      @list_projects = Project.where(:titulo =>@titulo,data_criacao:(@data_inicial)..@data_final)
    end

    if not (@id_categoria =="" or @data_inicial =="" or @data_final =="")  
      @list_projects = Project.where(:id_categoria =>@id_categoria,data_criacao:(@data_inicial)..@data_final)
    end
    
    if not (@id_categoria =="" or @titulo =="" or @data_inicial =="" or @data_final =="")  
      @list_projects = Project.where(:id_categoria =>@id_categoria,:titulo =>@titulo,data_criacao:(@data_inicial)..@data_final)
    end

    #  @list_projects = self


    # respond_to do |format|
    #     format.js 
    # end
    #@list_projects = Project.search_with(params_busca)

    respond_to do |format|
         format.js 
    end

  end
  def self.search_with(parameters)
    projects_query = self
    parameters.each do |parameter, value|
      if not value.empty? and self.respond_to? parameter
        projects_query = projects_query.send(parameter, value)
      end
    end    
  end  

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def ListSubCategory
    #@nada = SubCategory.new 
    #@SubCategory = SubCategory.find_by(id_categoria: params[:projetos][:id_categoria])
    
    @SubCategory =  SubCategory.where("id_categoria = ?", params[:project][:id_categoria])

    #@SubCategory = SubCategory.all
    
     respond_to do |format|
        format.js 
      end
  end  


  def Addhistorico
     @id_projeto = params[:id_projeto]
     @descricao  = params[:historico]

      HistoricalProject.create(:id_projeto =>@id_projeto,:descricao =>@descricao,:user_id_admin =>session[:nome_contato],:inserido_cliente =>"1",:visivel_cliente =>"1",:data_criacao =>Time.now)
      
      respond_to do |format|  
        format.html { redirect_to '/projects/', notice: 'Histórico inserido com sucesso!' }
      end    
  end  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def params_busca
      params.require(:project).permit(:id_categoria,:data_inicial, :data_final,:titulo)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:id_projeto, :valor_projeto, :cod_cliente, :id_categoria, :id_sub_categoria, :data_criacao, :data_inicial, :data_final, :titulo, :descricao, :solicitante, :data_prazo, :status, :prospeccao, :endereco_arqs, :data_projeto_finalizado, :criador_projeto, :veiculo, :formato, :formato_outro, :formato2, :formato_outro2, :linguagem,{:objetivo => [].join(",")}, {:publico_alvo =>[]}, {:inf_obrigatorias =>[]}, :concorrentes, :referencia_web, :cadastro_finalizado, :id_setor, :titulo_projeto, :img_projeto, :img_projeto_pqn, :publicar_projeto, :empresa, :id_orcamento)
    end
end
