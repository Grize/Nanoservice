require 'rails_helper'

RSpec.describe Message, type: :model do
  subject { FactoryBot.create(:message, sender: sender, addressee: addressee, body: body) }
  let(:messanger) { FactoryBot.create(:messanger) }
  let(:messanger2) { FactoryBot.create(:messanger, name: "Viber") }

  context "check for validation of sender" do
    let(:sender) { "{some bad} = 'code' " }
    let(:addressee) { FFaker::NameDA.female_name }
    let(:body) { FFaker::Lorem.paragraph }
    it "return error because sender is't valid" do
      expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context "check for validation of addressee" do
    let(:sender) { FFaker::NameDA.female_name }
    let(:addressee) { "{some bad} = 'code' " }
    let(:body) { FFaker::Lorem.paragraph }
    it "return error because addressee is't valid" do
      expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context "check for validation of body" do
    let(:sender) { FFaker::NameDA.female_name }
    let(:addressee) { FFaker::NameDA.female_name }
    let(:body) { "{some bad} = 'code' " }
    it "return error because body is't valid" do
      expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context "Check for connection models" do
    let(:sender) { FFaker::NameDA.female_name }
    let(:addressee) { FFaker::NameDA.female_name }
    let(:body) { FFaker::Lorem.paragraph }
    it "connect messangers to message" do
      result = subject.messangers << messanger
      result = subject.messangers << messanger2
      expect(subject.messangers.length).to eq(2)
    end
  end
end
