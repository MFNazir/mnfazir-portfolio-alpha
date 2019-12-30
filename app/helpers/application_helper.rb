module ApplicationHelper

    def login_helper style = ''
         if current_user.is_a?(GuestUser) 
             (link_to "Register", new_user_registration_path, class: style) + 

               " ".html_safe +

               (link_to "Login", new_user_session_path, class: style) 
         else 
            link_to "Logout", destroy_user_session_path, method: :delete, class: style
        end
    end

    def source_helper(layout_name)
         if session[:source] 
            greeting = "Thanks for Visting From  #{session[:source]} and You're On The #{layout_name} page"
            content_tag(:p, greeting, class: "source-greeting")
         end 
    end 

    class Renderer 
        def self.copyright name, msg 
            "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
        end
    end

    def set_copyright
        @copyright = ApplicationHelper::Renderer.copyright 'Muhammad Nazir', 'All Rights Reserved'
    end

    
end
