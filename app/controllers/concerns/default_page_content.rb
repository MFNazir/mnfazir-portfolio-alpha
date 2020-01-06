module DefaultPageContent
    extend ActiveSupport::Concern
   
    included do
        before_action :set_title    
    end
    def set_title
        @page_title = "Muhammad Nazir | Portfolio "
        @seo_keywords = "Muhammad Nazirs Portfolio"
    end
end