class ContactosController < ApplicationController
      layout "front_office"
    def index
      # Opcional: Puedes definir variables si deseas mostrar información dinámica.
      @farmacias = [
        { name: "Farmacia Central", phone: "123-456-7890" },
        { name: "Farmacia del Sur", phone: "987-654-3210" },
        { name: "Farmacia del Norte", phone: "555-555-5555" }
      ]
    end
  end
  