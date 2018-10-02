require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.create(:user) }
  let(:messanger) { FactoryBot.create(:messanger) }
  context "Check right model connection" do
    it "return error" do
      expect { subject.messages << messanger }.to raise_error(ActiveRecord::AssociationTypeMismatch)
    end
  end
end
