module Style
  class Scanner 

    attr_reader :input_text, :tokenized_text, :sentences
    attr_accessor :finished_text

    def initialize(input_text)
      @input_text = input_text
      @sentences = split_into_sentences
      @tokenized_text = tokenize_text
    end

    def scan 
      sentences.each do |sentence|
        SentenceScans::UselessWord.scan(sentence)
        SentenceScans::UglyWord.scan(sentence)
        SentenceScans::RepeatedWord.scan(sentence)
        SentenceScans::ExcessWhiteSpace.scan(sentence)
        SentenceScans::BrokenLink.scan(sentence)
        SentenceScans::Adverb.scan(sentence)
      end
      puts Results.user_friendly_readout(sentences)
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

    def training_text
      File.read("#{File.dirname(__FILE__)}/english.pickle")
    end

  end
end
