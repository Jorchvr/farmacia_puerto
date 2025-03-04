Rails.application.routes.draw do
  devise_for :users

  # Rutas para el Front Office
  root 'tienda#index'
  resources :productos, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resource :carrito, only: [:show, :update, :destroy] do
    patch 'update_entrega', on: :collection
  end
  resources :orders, only: [:new, :create, :show]

  # Rutas para el menú superior del Front Office
  get 'tienda', to: 'tienda#index', as: 'tienda_index'
  resources :citas, only: [:index, :new, :create]
  get 'ofertas', to: 'ofertas#index', as: 'offers'
  get 'contactos', to: 'contactos#index', as: 'contactos'

  # Rutas para el Back Office (Dashboard)
  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/ventas', to: 'dashboard#ventas', as: 'dashboard_ventas'
  get 'dashboard/stock', to: 'dashboard#stock', as: 'dashboard_stock'
  get 'dashboard/mas_vendidos', to: 'dashboard#mas_vendidos', as: 'dashboard_mas_vendidos'
  get 'dashboard/registrar_venta', to: 'dashboard#nueva_venta', as: 'dashboard_registrar_venta'
  post 'dashboard/registrar_venta', to: 'dashboard#crear_venta'
end






