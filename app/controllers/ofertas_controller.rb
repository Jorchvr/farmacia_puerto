class OfertasController < ApplicationController
  layout "front_office"
  def index
    @productos_en_oferta = Producto.oferta
  end
end


  