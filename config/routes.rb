Rails.application.routes.draw do

  root to: 'pages#home'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  # Para modificar una ruta que viene por defecto, except:
  resources :portfolios, except: [:show]
  # La queremos en singular, enlazada al action controller y asignando un nombre
  # para poder utilizar el enlace en la vista como: portfolio_show_path(portfolio)
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  # Añadir una ruta a blogs
  resources :blogs do
    member do
      get :toggle_status
    end
  end

end

# Para filtrar por consola las routes que queremos ver: 
# rails routes | grep portfolio