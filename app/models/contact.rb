class Contact < ApplicationRecord
  validates :full_name, :email, :phong_number, :address, presence: true
end
