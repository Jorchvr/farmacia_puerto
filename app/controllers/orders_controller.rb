class OrdersController < ApplicationController
 layout "front_office"
  def new
    # Inicializa una nueva orden usando el modelo Orden
    @orden = Orden.new
  end

  def create
    @orden = Orden.new(orden_params)
    if @orden.save
      redirect_to orden_path(@orden), notice: "Orden creada correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @orden = Orden.find(params[:id])
  end

  private

  def orden_params
    # Ajusta los atributos permitidos según tu modelo Orden
    params.require(:orden).permit(:payment_method, :other_attribute)
  end
end


