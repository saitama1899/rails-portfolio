module ApplicationHelper
    def sample_helper
        "<p>My helper</p>".html_safe
    end

    def sample_helper_tag
        content_tag(:div, "Soy un Div", class: "clase-especial")
    end

    def login_helper(style)
        if current_user.is_a?(GuestUser)
            (link_to "Register", new_user_registration_path, class: style) +
            " ".html_safe +
            (link_to "Login", new_user_session_path, class: style)
        else
            link_to "Logout", destroy_user_session_path, method: :delete, class: style
        end
    end

    def source_helper
        if session[:source]
            greeting = "Gracias por visitarnos desde #{session[:source]}"
            content_tag(:p, greeting, class: "source-greeting")
        end
    end

    def copyright_generator
        EricSelvaViewTool::Renderer.copyright 'Eric Selva', 'All rights reserved'
    end

end
