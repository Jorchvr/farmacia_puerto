class Producto < ApplicationRecord
  has_many :ventas, dependent: :destroy
  has_one_attached :imagen

  def en_oferta?
    precio.present? && sale_price.present? && sale_price < precio
  end

  # Scope para productos en oferta
  scope :oferta, -> { where.not(sale_price: nil).where("sale_price < precio") }

  # Scope para productos que no están en oferta
  scope :no_en_oferta, -> { where("sale_price IS NULL OR sale_price >= precio") }
end

