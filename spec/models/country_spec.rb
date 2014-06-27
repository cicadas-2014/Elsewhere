require 'spec_helper'
describe Country do
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  context "associations" do
    it { should belong_to :language }
    it { should have_many :images }
    it { should have_many :phrases }
  end
end
