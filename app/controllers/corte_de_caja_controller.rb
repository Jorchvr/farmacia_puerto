class CorteDeCajaController < ApplicationController
  before_action :authenticate_user!

  def index
    # Listamos los cortes anteriores del usuario
    @cortes = CorteDeCaja.where(user: current_user).order(sale_date: :desc)
    # Asignamos un nuevo objeto para el formulario
    @corte = CorteDeCaja.new
  end

  def create
    @corte = CorteDeCaja.new(corte_params)
    @corte.user = current_user
    @corte.sale_date ||= Date.today

    if @corte.save
      # Después de registrar el corte, se cierra la sesión y se redirige al login
      sign_out current_user
      redirect_to new_user_session_path, notice: "Bonito día"
    else
      @cortes = CorteDeCaja.where(user: current_user).order(sale_date: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def corte_params
    params.require(:corte_de_caja).permit(:total, :sale_date)
  end
end
