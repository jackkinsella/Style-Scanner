module Style
  class Scanner 

    attr_reader :input_text, :sentences, :options
    attr_accessor :finished_text

    def initialize(input, options={})
      # remove html
      @options = options
      @input_text = convert_to_txt(input) 
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

    def convert_to_txt(input)
      if options[:html] 
        remove_html(input)
      elsif options[:textile]
        textile_to_txt(input)
      else
        input
      end
    end

    def textile_to_txt(input)
      remove_html(RedCloth.new(input).to_html)
    end

    def remove_html(input)
      Sanitize.clean(input)
    end

    def desired_scans 
      desired_optional_scans + default_scans
    end

    def desired_optional_scans
      result = []
      result << SentenceScans::Adverb if options[:adverb]
      result
    end

    def split_into_sentences
      tokenizer = Punkt::SentenceTokenizer.new(input_text)
      tokenizer.sentences_from_text(input_text, :output => :sentences_text).map {|text| Sentence.new(text)}
    end

    def training_text
      File.read("#{File.dirname(__FILE__)}/english.pickle")
    end

    def default_scans 
      [SentenceScans::UselessWord, SentenceScans::UglyWord, SentenceScans::Spelling, SentenceScans::ConsecutivelyRepeatedWord,
      SentenceScans::ExcessWhiteSpace, SentenceScans::BrokenLink, SentenceScans::UsedWordAlreadyInSentence,
      SentenceScans::SpeakingInGeneralities, SentenceScans::Cliche, SentenceScans::PassiveTense]
    end

  end
end
