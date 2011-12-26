require "spec_helper"
module Style
  describe String do
     context "#strip_punctuation" do
       let(:string_with_dot) {"He isn't that furry."}
       let(:string_with_ampersand) {"Shepards Pie & Lasange use mince meat."}
       it "removes . and ' and &" do
         string_with_dot.strip_punctuation.should == "He isnt that furry"
       end
       it "removes excess white space generated" do
         string_with_ampersand.strip_punctuation.should == "Shepards Pie Lasange use mince meat"
       end
     end
  end
end
