module Style
  class Scanner 

    attr_reader :input_text, :sentences
    attr_accessor :finished_text

    def initialize(input)
      @input_text = input 
      @sentences = split_into_sentences
    end

    def scan 
      sentences.each do |sentence|
        [SentenceScans::UselessWord, SentenceScans::UglyWord,
          SentenceScans::Consecutively,RepeatedWord, SentenceScans::PassiveTense,
          SentenceScans::ExcessWhiteSpace, SentenceScans::BrokenLink, SentenceScans::RepeatedWord,
          SentenceScans::Adverb, SentenceScans::SpeakingInGeneralities].each do |scanner_type|
          scanner_type.scan(sentence)
          end
      end
      Results.user_friendly_readout(sentences)
    end

    def find_sentence(text)
      @sentences.find {|sentence| sentence.text == text}
    end

    private

    def split_into_sentences
      tokenizer = Punkt::SentenceTagger.new(input_text)
      tokenizer.sentences_from_text(input_text, :output => :sentences_text).map {|text| Sentence.new(text)}
    end

    def training_text
      File.read("#{File.dirname(__FILE__)}/english.pickle")
    end

  end
end
