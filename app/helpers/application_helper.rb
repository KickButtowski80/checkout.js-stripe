module ApplicationHelper
    def admin_types
        ['admin user']
    end
    
    def active? path 
        "active" if current_page? path
    end
    
    def admin?
        admin_types.include? current_user.user_type
    end
    
    def user_type_color 
        if admin?
            "btn btn-info"
        else
            "btn btn-secondary"
        end
    end
end
