require 'spec_helper'
describe Language do
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  context "associations" do
    it { should have_many :countries }
    it { should have_many :phrases }
  end
end
