require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:phong_number) }
    it { is_expected.to validate_presence_of(:address) }
  end
  # it "has a valid factory" do
  #   expect(contact).to be_valid
  # end
end
