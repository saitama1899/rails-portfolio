module ApplicationHelper
    def sample_helper
        "<p>My helper</p>".html_safe
    end

    def sample_helper_tag
        content_tag(:div, "Soy un Div", class: "clase-especial")
    end

    def login_helper
        if current_user.is_a?(User)
            link_to "Logout", destroy_user_session_path, method: :delete
        else
            (link_to "Register", new_user_registration_path) +
            "<br>".html_safe +
            (link_to "Login", new_user_session_path)
        end
    end

    def source_helper
        if session[:source]
            greeting = "Gracias por visitarnos desde #{session[:source]}"
            content_tag(:p, greeting, class: "source-greeting")
        end
    end

end
