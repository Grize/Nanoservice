require 'rails_helper'

RSpec.describe Messanger, type: :model do
  subject { FactoryBot.create(:messanger, name: name) }
  let(:message) { FactoryBot.create(:message) }

  context "Check for validation" do
    let(:name) { "some name" }
    it "return error because name is't valid" do
      expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context "Check for connect models" do
    let(:name) { "Viber" }
    it "connection message to messanger" do
      result = subject.messages << message
      expect(subject.messages[0]).to eq(message)
    end
  end
end
