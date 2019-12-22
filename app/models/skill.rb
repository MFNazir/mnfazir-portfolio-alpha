class Skill < ApplicationRecord
    
    validates_presence_of :title, :percent_utilized

    after_initialize :set_defaults
    
    def set_defaults
    self.badge ||= "https://via.placeholder.com/250x250"
    
    end
end
