require 'spec_helper'
describe Image do
  context "associations" do
    it { should belong_to :country }
  end
end
