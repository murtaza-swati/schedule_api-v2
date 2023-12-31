# == Schema Information
#
# Table name: organizations
#
#  id             :integer          not null, primary key
#  name           :string
#  email          :string
#  api_key_digest :string
#  token          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

RSpec.describe Organization do
  describe "validations" do
    subject { build(:organization) }

    it { is_expected.to be_valid }

    context "when email is not present" do
      subject { build(:organization, email: nil) }

      it { is_expected.to be_invalid }
    end

    context "when email is not unique" do
      let(:email) { "foo@example.com" }
      subject { build(:organization, email: email) }
      before { create(:organization, email: email) }

      it { is_expected.to be_invalid }
    end

    context "when name is not present" do
      subject { build(:organization, name: nil) }

      it { is_expected.to be_invalid }
    end
  end
end
