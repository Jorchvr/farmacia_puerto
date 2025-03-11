class TiendaController < ApplicationController
  layout "front_office"
  def index
    if params[:q].present?
      @productos = Producto.where("nombre ILIKE ?", "%#{params[:q]}%").no_en_oferta
    else
      @productos = Producto.no_en_oferta
    end
  end
end


