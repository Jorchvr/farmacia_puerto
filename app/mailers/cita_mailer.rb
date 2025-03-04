class CitaMailer < ApplicationMailer
    default from: 'jgael_vr@hotmail.com'  # Cambia por el correo que desees usar
  
    def confirmation_email(cita)
      @cita = cita
      mail(to: @cita.email, subject: 'Confirmación de Cita - Farmacias del Puerto')
    end
  end
  