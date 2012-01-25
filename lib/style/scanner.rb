module Style
  class Scanner 

    attr_reader :input_text, :sentences, :options
    attr_accessor :finished_text

    def initialize(input, options)
      # remove html
      @options = options
      @input_text = Sanitize.clean(input)
      @sentences = split_into_sentences
    end

    def scan 
      sentences.each do |sentence|
        desired_scans.each do |scanner_type|
          scanner_type.scan(sentence)
        end
         puts sentence.user_friendly_readout 
      end
    end

    def find_sentence(text)
      @sentences.find {|sentence| sentence.text == text}
    end

    private

    def desired_scans 
      desired_optional_scans + default_scans
    end

    def desired_optional_scans
      optional_scans.find_all do |scan_name|
        switched_on = options.select {|k,v| v == true }
        ! switched_on.grep(scan_name).empty?
      end
    end

    def split_into_sentences
      tokenizer = Punkt::SentenceTokenizer.new(input_text)
      tokenizer.sentences_from_text(input_text, :output => :sentences_text).map {|text| Sentence.new(text)}
    end

    def training_text
      File.read("#{File.dirname(__FILE__)}/english.pickle")
    end

    def optional_scans
      [SentenceScans::Adverb]
    end

    def default_scans 
      [SentenceScans::UselessWord, SentenceScans::UglyWord, SentenceScans::Spelling, SentenceScans::ConsecutivelyRepeatedWord,
      SentenceScans::ExcessWhiteSpace, SentenceScans::BrokenLink, SentenceScans::UsedWordAlreadyInSentence,
      SentenceScans::SpeakingInGeneralities, SentenceScans::Cliche, SentenceScans::PassiveTense]
    end

  end
end
