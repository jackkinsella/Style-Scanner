module Style
  class Scanner 

    attr_reader :input_text, :sentences
    attr_accessor :finished_text

    def initialize(input)
      # remove html
      @input_text = Sanitize.clean(input)
      @sentences = split_into_sentences
    end

    def scan 
      sentences.each do |sentence|
        all_possible_scans.each do |scanner_type|
          scanner_type.scan(sentence)
        end
         puts sentence.user_friendly_readout 
      end
    end

    def find_sentence(text)
      @sentences.find {|sentence| sentence.text == text}
    end

    private

    def split_into_sentences
      tokenizer = Punkt::SentenceTokenizer.new(input_text)
      tokenizer.sentences_from_text(input_text, :output => :sentences_text).map {|text| Sentence.new(text)}
    end

    def training_text
      File.read("#{File.dirname(__FILE__)}/english.pickle")
    end

    def all_possible_scans 
      [SentenceScans::UselessWord, SentenceScans::UglyWord, SentenceScans::Spelling,
      SentenceScans::ConsecutivelyRepeatedWord,
      SentenceScans::ExcessWhiteSpace, SentenceScans::BrokenLink, SentenceScans::UsedWordAlreadyInSentence,
      SentenceScans::SpeakingInGeneralities, SentenceScans::Cliche, SentenceScans::Adverb, SentenceScans::PassiveTense]
    end

  end
end
