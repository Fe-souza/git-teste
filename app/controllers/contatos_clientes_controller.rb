class ContatosClientesController < ApplicationController
  before_action :set_contatos_cliente, only: [:show, :edit, :update, :destroy]

  # GET /contatos_clientes
  # GET /contatos_clientes.json
  def index
    @contatos_clientes = ContatosCliente.all
  end

  # GET /contatos_clientes/1
  # GET /contatos_clientes/1.json
  def show
  end

  # GET /contatos_clientes/new
  def new
    @contatos_cliente = ContatosCliente.new
  end

  # GET /contatos_clientes/1/edit
  def edit
  end

  # POST /contatos_clientes
  # POST /contatos_clientes.json
  def create
    @contatos_cliente = ContatosCliente.new(contatos_cliente_params)

    respond_to do |format|
      if @contatos_cliente.save
        format.html { redirect_to @contatos_cliente, notice: 'Contatos cliente was successfully created.' }
        format.json { render :show, status: :created, location: @contatos_cliente }
      else
        format.html { render :new }
        format.json { render json: @contatos_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contatos_clientes/1
  # PATCH/PUT /contatos_clientes/1.json
  def update
    respond_to do |format|
      if @contatos_cliente.update(contatos_cliente_params)
        format.html { redirect_to @contatos_cliente, notice: 'Contatos cliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @contatos_cliente }
      else
        format.html { render :edit }
        format.json { render json: @contatos_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contatos_clientes/1
  # DELETE /contatos_clientes/1.json
  def destroy
    @contatos_cliente.destroy
    respond_to do |format|
      format.html { redirect_to contatos_clientes_url, notice: 'Contatos cliente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contatos_cliente
      @contatos_cliente = ContatosCliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contatos_cliente_params
      params.require(:contatos_cliente).permit(:cod_cliente, :ddd_tel_1, :tel_1, :ddd_tel_2, :tel_2, :ddd_tel_3, :tel_3, :nome_contato, :cargo_contato, :email_contato, :senha, :data_criacao, :status, :last_update)
    end
end
