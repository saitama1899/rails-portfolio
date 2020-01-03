module DefaultPageContent
    extend ActiveSupport::Concern

    included do
        before_action :set_page_defaults
    end

    def set_page_defaults
        @page_title = "Portfolio Eric Selva"
        @seo_keywords = "Eric Selva portfolio"
    end
end