class OfertasController < ApplicationController
  layout "front_office"
    def index
      if params[:q].present?
        @productos_en_oferta = Producto.oferta.where("nombre ILIKE ?", "%#{params[:q]}%")
      else
        @productos_en_oferta = Producto.oferta
      end
    end
  end
  


  