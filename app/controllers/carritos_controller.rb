class CarritosController < ApplicationController
  layout "front_office"
  before_action :load_cart

  def show
    @cart_items = @cart.map do |producto_id, quantity|
      producto = Producto.find_by(id: producto_id)
      producto.present? ? { producto: producto, quantity: quantity } : nil
    end.compact
  end

  def update
    producto_id = params[:producto_id].to_s
    quantity = params[:quantity].to_i
    if params[:set_quantity] == "true"
      @cart[producto_id] = quantity
    else
      @cart[producto_id] = (@cart[producto_id] || 0) + quantity
    end
    session[:cart] = @cart
    redirect_to carrito_path, notice: "Producto actualizado en el carrito."
  end

  
    def destroy
      if params[:producto_id].present?
        @cart.delete(params[:producto_id].to_s)
        session[:cart] = @cart
        redirect_to carrito_path, notice: "Producto eliminado del carrito."
      else
        session[:cart] = {}
        redirect_to carrito_path, notice: "Carrito vaciado."
      end
    end
  
    private
  
    def load_cart
      session[:cart] ||= {}
      @cart = session[:cart]
    end
  end
  


  