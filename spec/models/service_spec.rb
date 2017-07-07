require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'relations' do
    it { is_expected.to have_many(:service_urls) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
