Rails.application.routes.draw do

  root to: 'pages#home'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  # Para modificar una ruta que viene por defecto, except:
  resources :portfolios, except: [:show]
  # La queremos en singular, enlazada al action controller y asignando un nombre
  # para poder utilizar el enlace en la vista como: portfolio_show_path(portfolio)
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  get 'ruby-on-rails-items', to: 'portfolios#ruby_on_rails'
  
  # Añadir una ruta a blogs
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  # Authentication
  # devise_for :users
  # Para cambiar el nombre a rutas por defecto path: '', path_names: {}
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }


end

# Para filtrar por consola las routes que queremos ver: 
# rails routes | grep portfolio