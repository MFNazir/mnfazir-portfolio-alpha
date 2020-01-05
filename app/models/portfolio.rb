class Portfolio < ApplicationRecord
    has_many :technologies, dependent: :delete_all, inverse_of: :portfolio
    accepts_nested_attributes_for :technologies, 
                                   allow_destroy: true,
                                   reject_if: lambda { |attrs| attrs['name'].blank? }
    
    
    validates_presence_of :title, :body, :main_image, :thumb_image

    mount_uploader :thumb_image, PortfolioUploader
    mount_uploader :main_image, PortfolioUploader


    def self.angular
        where(subtitle: 'Angular')
    end 

    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails')}

    after_initialize :set_defaults
    
    def set_defaults
    self.main_image ||= "https://via.placeholder.com/600x400"
    self.thumb_image ||= "https://via.placeholder.com/350x200" 
    
    end

    def self.by_position 
        order("position ASC")
    end 
end
