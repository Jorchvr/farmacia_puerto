class Producto < ApplicationRecord
  has_one_attached :imagen

  # Retorna true si hay un precio de oferta válido (sale_price presente y menor que precio)
  def en_oferta?
    sale_price.present? && sale_price < precio
  end

  # Scope para productos en oferta
  scope :oferta, -> { where("sale_price IS NOT NULL AND sale_price < precio") }
  
  # Scope para productos que NO están en oferta
  scope :no_en_oferta, -> { where("sale_price IS NULL OR sale_price >= precio") }
end


