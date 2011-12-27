module Style
  class Scanner 

    attr_reader :input_text, :tokenized_text, :sentences
    attr_accessor :finished_text

    def initialize(input_text)
      @input_text = input_text
      @sentences = split_into_sentences
      @tokenized_text = tokenize_text
    end

    # Run from cmd lin
    # Scanner.new(text).print
    def scan 
      sentences.each do |sentence|
        UselessWordScan.new(sentence)
        UglyWordScan.new(sentence)
        RepeatedWordScan.new(sentence)
        ExcessWhiteSpaceScan.new(sentence)
        BrokenLinkScan.new(sentence)
        AdverbScan.new(sentence)
      end
      puts Results.new(sentences)
    end

    def find_sentence(text)
      @sentences.find {|sentence| sentence.text == text}
    end

    private

    def tokenize_text
      Tokenizer.new(input_text).tokenize
    end

    def split_into_sentences
      tokenizer = Punkt::SentenceTokenizer.new(input_text)
      tokenizer.sentences_from_text(input_text, :output => :sentences_text).map {|text| Sentence.new(text)}
    end

  end
end
