require "spec_helper"
describe Rewriter do

  subject {Rewriter.new(input_text)}

  it "recommends you replaces utilize with use" do
    input_text = "We will utilize these apples." 
    subect.rewrite.should == "We will use these apples."
  end

end
