require "spec_helper"
module Style
  describe CollectionCapitalizer do
    let(:hash) {{"use" => 'utilize', "good" => "great"}}
    let(:array) {["use", "utilize"]}
    context "#capitalize" do
      it "adds capitalized versions of all array items, returning an array" do

        CollectionCapitalizer.new(array).capitalize.should =~ 
          ["use", "utilize", "Use", "Utilize"]
      end
      it "adds capitalized versions of hash keys and values, returning a hash" do
        CollectionCapitalizer.new(hash).capitalize.should == 
          {"use" => 'utilize', "good" => "great", "Use" => "Utilize", "Good" => "Great"}

      end
      it "accepts an option to also add all caps version" do
        CollectionCapitalizer.new(array).capitalize(:all_caps => true).should =~
          ["use", "utilize", "Use", "Utilize", "USE", "UTILIZE"]
      end
    end
  end
end
