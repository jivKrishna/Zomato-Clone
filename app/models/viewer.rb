class Viewer < User
  validates :email, uniqueness: { scope: [:provider, :type] }
end
