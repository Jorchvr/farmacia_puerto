class CitasController < ApplicationController
    layout "front_office"
    def new
      @cita = Cita.new
    end
  
    def create
      @cita = Cita.new(cita_params)
      if @cita.save
        # Enviar correo de confirmación (usa deliver_later para ejecutarlo en background, si tienes ActiveJob configurado)
        CitaMailer.confirmation_email(@cita).deliver_later
        redirect_to new_cita_path, notice: "Cita agendada exitosamente. Se ha enviado un correo de confirmación."
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def cita_params
      params.require(:cita).permit(:patient_name, :reason, :email, :appointment_date)
    end
  end
  
  