require 'rails_helper'

RSpec.describe User, type: :model do
  context "associations" do
    it { should have_many(:posts) }
    it { should have_many(:votes) }
    it { should have_many(:active_relationships) }
    it { should have_many(:following) }
    it { should have_many(:passive_relationships) }
    it { should have_many(:followers) }
  end

  describe ".new" do
    it { expect(described_class).to respond_to(:new) }
  end

  describe ".create" do
    it { expect(described_class).to respond_to(:create) }
    it do
      action = -> { create(:user) }
      behavior = -> { described_class.count }
      expect { action.call }.to change { behavior.call }.by(1)
    end
  end

  describe ".find" do
    let(:record) { create(:user) }
    it { expect(described_class).to respond_to(:find) }
    it { expect(described_class.find(record.id)).to eq(record) }
  end

  describe "#save" do
    subject { build(:user) }
    it { is_expected.to respond_to(:save) }
    it { expect { subject.save }.to change { described_class.count }.by(1) }
  end

  describe "#update" do
    subject { create(:user) }
    it { is_expected.to respond_to(:update) }
    it { expect(subject.update(name: "test name update")).to be_truthy }
  end

  describe "#destroy" do
    let!(:record) { create(:user) }
    subject { record }
    it { is_expected.to respond_to(:destroy) }
    it { expect { subject.destroy }.to change { described_class.count }.by(-1) }
  end
end
