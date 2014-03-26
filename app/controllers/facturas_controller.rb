class FacturasController < ApplicationController
	before_action :authorize
  before_action :set_factura, :set_clientes, only: [:show, :edit, :update, :destroy]

  # GET /facturas
  # GET /facturas.json
  def index
    @facturas = Factura.all
  end

  # GET /facturas/1
  # GET /facturas/1.json
  def show
      @items = @factura.items
	  respond_to do |format|
		 format.html
	 	 format.pdf do
			 pdf = FacturaPdf.new(@factura, view_context)
			 send_data pdf.render, filename: "#{@factura.numero}",
			 			type: "application/pdf",
						disposition: "attachment"
		 end
	  end		 
  end

  # GET /facturas/new
  def new
    @factura = Factura.new
    set_clientes
  end

  # GET /facturas/1/edit
  def edit
    set_clientes
  end

  # POST /facturas
  # POST /facturas.json
  def create
    @factura = Factura.new(factura_params)

    respond_to do |format|
      if @factura.save
        format.html { redirect_to @factura, notice: 'Factura registrada exitosamente.' }
        format.json { render action: 'show', status: :created, location: @factura }
      else
        format.html { render action: 'new' }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facturas/1
  # PATCH/PUT /facturas/1.json
  def update
    respond_to do |format|
      if @factura.update(factura_params)
        format.html { redirect_to @facturas, notice: 'Factura editada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facturas/1
  # DELETE /facturas/1.json
  def destroy
    @factura.destroy
    respond_to do |format|
      format.html { redirect_to facturas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factura
      @factura = Factura.find(params[:id])
    end

    def set_clientes
	    @clientes = Cliente.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factura_params
      params.require(:factura).permit(:fecha, :numero, :cliente_id, :oc, :gd, :cp, :vencimiento , items_attributes: [:id, :cantidad, :detalle, :precio,  :_destroy])
    end
end
