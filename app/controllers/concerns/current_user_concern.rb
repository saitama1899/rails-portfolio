module CurrentUserConcern
    extend ActiveSupport::Concern

    # Sobreescribir este metodo de Devise para poder tener user guests y que
    # siempre exista un current_user
    def current_user
        super || guest_user
    end
    # Esto funciona como una condicion if (false || true) siempre devuelve true
    # Si current_user existe se ejecuta super, la funcion padre. Si no existe
    # se ejecuta la creacion del Guest clonando los campos de un usuario para que
    # nada sea Nil
    def guest_user
        OpenStruct.new(name: "Visitante Usuario", 
            first_name: "Visitante",
            last_name: "Usuario",
            email: "visitante@usuario.com"
            )
    end
end