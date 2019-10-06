class Table < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  before_save :format_book_time
  before_update :format_book_time

  private
    def format_book_time
      self.booking_time = booking_time.strftime("%H:%M")
    end
end
