class TiendaController < ApplicationController
  layout "front_office"
  def index
    @productos = Producto.no_en_oferta
  end
end
