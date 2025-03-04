class ProductosController < ApplicationController
  before_action :set_producto, only: %i[ show edit update destroy ]

  def index
    @productos = Producto.all
  end

  def show; end

  def new
    @producto = Producto.new
  end

  def edit; end

  def create
    @producto = Producto.new(producto_params)
    if @producto.save
      redirect_to productos_path, notice: "Producto fue creado correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @producto.update(producto_params)
      redirect_to productos_path, notice: "Producto fue actualizado correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @producto.destroy!
    respond_to do |format|
      format.html { redirect_to productos_path, notice: "Producto eliminado definitivamente." }
      format.json { head :no_content }
    end
  end
  

  private

  def set_producto
    @producto = Producto.find(params.require(:id))
  end

  def producto_params
    params.require(:producto).permit(:nombre, :descripcion, :precio, :stock, :sale_price, :imagen)
  end
end


