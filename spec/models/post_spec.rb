require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) {User.create(name: "DatTT", password: "123123")}

  let(:post_params) do
    {
      link_youtube: "https://youtube.com/embed/2CzXvHRPmls",
      description: "Là ai từ bỏ, Là ai vô tình",
      user_id: user.id
    }
  end

  context "associations" do
    it { should belong_to(:user) }
    it { should have_many(:votes) }
    it { should have_many(:user_votes) }
  end

  describe ".new" do
    it { expect(Post).to respond_to(:new) }
  end

  describe ".create" do
    it { expect(Post).to respond_to(:create) }
    it do
      action = -> { Post.create(post_params) }
      behavior = -> { Post.count }
      expect { action.call }.to change { behavior.call }.by(1)
    end
  end

  describe ".find" do
    let(:record) { Post.create(post_params) }
    it { expect(Post).to respond_to(:find) }
    it { expect(Post.find(record.id)).to eq(record) }
  end

  describe "#save" do
    subject { Post.new(post_params) }
    it { is_expected.to respond_to(:save) }
    it { expect { subject.save }.to change { Post.count }.by(1) }
  end

  describe "#update" do
    subject { Post.create(post_params) }
    it { is_expected.to respond_to(:update) }
    it { expect(subject.update(description: "test123")).to be_truthy }
  end

  describe "#destroy" do
    let!(:record) { Post.create(post_params) }
    subject { record }
    it { is_expected.to respond_to(:destroy) }
    it { expect { subject.destroy }.to change { Post.count }.by(-1) }
  end
end
