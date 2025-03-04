class OrdenesController < ApplicationController
  layout "back_office"
    # Muestra una vista de confirmación de la orden basada en el contenido del carrito
    def new
      @cart_items = []
      current_cart.each do |producto_id, quantity|
        producto = Producto.find(producto_id)
        @cart_items << { producto: producto, quantity: quantity }
      end
  
      if @cart_items.empty?
        redirect_to carrito_path, alert: "Tu carrito está vacío."
      end
    end
  
    # Crea la orden y, por ejemplo, vacía el carrito
    def create
      total = 0
      current_cart.each do |producto_id, quantity|
        producto = Producto.find(producto_id)
        total += producto.precio * quantity
      end
  
      @orden = Orden.new(total: total)
      if @orden.save
        # Aquí podrías guardar detalles de la orden en otra tabla, relacionar productos, etc.
        session[:cart] = {}  # Vaciar el carrito
        redirect_to @orden, notice: "Orden creada exitosamente."
      else
        flash[:alert] = "Ocurrió un error al procesar tu orden."
        render :new
      end
    end
  
    # Muestra los detalles de la orden
    def show
      @orden = Orden.find(params[:id])
    end
  end
  