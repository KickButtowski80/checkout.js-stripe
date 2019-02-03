module ApplicationHelper
    def admin_types
        ['admin_user']
    end
    
    def active? path 
        "active" if current_page? path
    end
    
    def admin?
        admin_types.include? curent_user.type
    end
end
