require 'spec_helper'
describe Phrase do
  context "associations" do
    it { should belong_to :language }
  end
end