class MenuCard < ApplicationRecord
  belongs_to  :restaurant

  validates         :image,         presence: true
  validates         :description,   presence: true,   length: { minimum: 50 }

  has_attached_file :image, styles: { large: "300x760>", medium: "300x600>", thumb: "200x200#" },
                    default_url: "menu1.jpg"
                    
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
