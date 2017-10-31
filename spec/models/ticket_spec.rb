require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:service) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:ticket) }
  end
end
