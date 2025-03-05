Rails.application.routes.draw do
  devise_for :users, sign_out_via: :get

  # Rutas para el Front Office
  root 'tienda#index'
  resources :productos, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resource :carrito, only: [:show, :update, :destroy] do
    patch 'update_entrega', on: :collection
  end
  
  # Ruta para simular el pago en el Front Office
  post 'checkout', to: 'carritos#checkout', as: 'checkout'

  # Rutas para el menú superior del Front Office
  get 'tienda', to: 'tienda#index', as: 'tienda_index'
  resources :citas, only: [:index, :new, :create]
  get 'ofertas', to: 'ofertas#index', as: 'offers'
  get 'contactos', to: 'contactos#index', as: 'contactos'

  # Rutas para el acceso al Back Office mediante código de admin
  get 'admin_access', to: 'admin_access#new', as: 'admin_access'
  post 'admin_access', to: 'admin_access#create'

  # Rutas para el Back Office (Dashboard)
  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/ventas', to: 'dashboard#ventas', as: 'dashboard_ventas'
  get 'dashboard/stock', to: 'dashboard#stock', as: 'dashboard_stock'
  get 'dashboard/mas_vendidos', to: 'dashboard#mas_vendidos', as: 'dashboard_mas_vendidos'
  get 'dashboard/registrar_venta', to: 'dashboard#nueva_venta', as: 'dashboard_registrar_venta'
  post 'dashboard/registrar_venta', to: 'dashboard#crear_venta'

  # Rutas para Corte de Caja
  resources :corte_de_caja, only: [:new, :create, :index]
end















