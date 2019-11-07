class Table < ApplicationRecord
  belongs_to    :user
  belongs_to    :restaurant

  before_save   :format_book_time
  before_update :format_book_time

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  before_save { self.guest_email = guest_email.downcase }
  before_save {self.booking_time = booking_time.strftime("%H:%M")}

  validates :guest_number,       :booking_date,   :booking_time,   :guest_first_name,  :guest_last_name,
            :guest_phone_number,  presence: true

  validates :guest_email,   presence: true,   format: { with: VALID_EMAIL_REGEX }

  validates_format_of :guest_phone_number,  with: /\A(\d{10}|\(?\d{3}\)?[-.\s]\d{3}[-.\s]\d{4})\z/



  private
    def format_book_time
      self.booking_time = booking_time.strftime("%H:%M")
    end
end
