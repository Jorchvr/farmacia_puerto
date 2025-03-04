class AdminAccessController < ApplicationController
    layout "front_office"
    def new
      # Muestra el formulario de acceso de admin
    end
  
    def create
      if params[:admin_code] == "PAN123"
        session[:admin_authenticated] = true
        redirect_to dashboard_path, notice: "Acceso concedido al Back Office."
      else
        flash.now[:alert] = "Código incorrecto."
        render :new, status: :unprocessable_entity
      end
    end
  end
  