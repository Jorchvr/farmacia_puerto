class DashboardController < ApplicationController
  layout "back_office"
  before_action :authenticate_user!

  def index
    # Página de inicio del dashboard
  end

  def ventas
    @ventas = Venta.where(fecha: Date.today.beginning_of_month..Date.today.end_of_month)
  end

  def stock
    @productos = Producto.all
  end

  def mas_vendidos
    @productos_mas_vendidos = Venta.joins(:producto)
      .group("productos.id", "productos.nombre")
      .sum(:cantidad)
      .sort_by { |_, total| -total }
  end

  # Muestra el formulario para registrar una nueva venta
  def nueva_venta
    @venta = Venta.new
    @productos = Producto.all
  end

  # Procesa la creación de la venta y actualiza el stock del producto
  def crear_venta
    @venta = Venta.new(venta_params)
    @venta.fecha = Date.today
    @producto = Producto.find(@venta.producto_id)
    
    if @producto.stock >= @venta.cantidad
      @venta.total = @producto.precio * @venta.cantidad
      if @venta.save
        # Se actualiza el stock del producto restándole la cantidad vendida
        @producto.update(stock: @producto.stock - @venta.cantidad)
        redirect_to dashboard_ventas_path, notice: 'Venta registrada exitosamente.'
      else
        render :nueva_venta
      end
    else
      flash.now[:alert] = "No hay stock suficiente para este producto."
      render :nueva_venta
    end
  end

  private

  def venta_params
    params.require(:venta).permit(:producto_id, :cantidad)
  end
end

