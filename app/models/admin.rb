class Admin < User
  validates :email, uniqueness: { scope: [:provider, :type] }
end
