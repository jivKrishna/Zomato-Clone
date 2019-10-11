class MenuCard < ApplicationRecord
  belongs_to :restaurant

  has_attached_file :image, styles: { large: "300x760>", medium: "300x600>", thumb: "200x200#" },
                    default_url: "https://placehold.it/300.png/09f/fff?text=Restaurant Menu Card"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
