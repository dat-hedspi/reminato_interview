require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_params) do
    {
      name: "test",
      password: "123123",
    }
  end
  context "associations" do
    it { should have_many(:posts) }
    it { should have_many(:votes) }
    it { should have_many(:active_relationships) }
    it { should have_many(:following) }
    it { should have_many(:passive_relationships) }
    it { should have_many(:followers) }
  end

  describe ".new" do
    it { expect(User).to respond_to(:new) }
  end

  describe ".create" do
    it { expect(User).to respond_to(:create) }
    it do
      action = -> { User.create(user_params) }
      behavior = -> { User.count }
      expect { action.call }.to change { behavior.call }.by(1)
    end
  end

  describe ".find" do
    let(:record) { User.create(user_params) }
    it { expect(User).to respond_to(:find) }
    it { expect(User.find(record.id)).to eq(record) }
  end

  describe "#save" do
    subject { User.new(user_params) }
    it { is_expected.to respond_to(:save) }
    it { expect { subject.save }.to change { User.count }.by(1) }
  end

  describe "#update" do
    subject { User.create(user_params) }
    it { is_expected.to respond_to(:update) }
    it { expect(subject.update(name: "test name update")).to be_truthy }
  end

  describe "#destroy" do
    let!(:record) { User.create(user_params) }
    subject { record }
    it { is_expected.to respond_to(:destroy) }
    it { expect { subject.destroy }.to change { User.count }.by(-1) }
  end
end
