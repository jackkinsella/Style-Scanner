require "spec_helper"
module StyleScanner
  describe String do
    context "#strip_punctuation" do
      let(:string_with_dot) {"He isn't that furry."}
      let(:string_with_ampersand) {"Shepards Pie & Lasange use mince meat."}

      it "removes . and '" do
        string_with_dot.strip_punctuation.should == "He isnt that furry"
      end

      it "removes excess white space generated" do
        string_with_ampersand.strip_punctuation.should == "Shepards Pie Lasange use mince meat"
      end
    end

    context "#stem_verbs" do
      let(:goldfish) {"I want a goldfish."}
      let(:flossed) {"I flossed my teeth."}

      it "stems verbs" do
        flossed.stem_verbs.should == "I floss my teeth"
      end
      it "doesnt stem nouns" do
        goldfish.stem_verbs.should == "I want a goldfish"
      end
    end

  end
end
