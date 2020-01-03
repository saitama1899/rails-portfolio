class ApplicationController < ActionController::Base
    ### include de Concerns para tener codigo modular
    
    # Para permitir parametros personalizados en los formularios de devise auth
    include DeviseWhitelist
    # Para crear la variable de session source
    include SetSource
    # Para los guests
    include CurrentUserConcern
    # Para los datos de la pagina como title
    include DefaultPageContent
end
