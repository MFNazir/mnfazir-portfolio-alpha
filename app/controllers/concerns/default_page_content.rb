module DefaultPageContent
    extend ActiveSupport::Concern
   
    included do
        before_action :set_title    
    end
    def set_title
        @page_title = "DevCamp Portfolio | My Super Awesome Portfolio"
        @seo_keywords = "Muhammad Nazirs Portfolio"
    end
end