module Style
  class Scanner 
  include Errors
  include Alerts

    WORD_SUBSTITUTIONS = [[:utilize, :use]]
    USELESS_WORDS = ["very"]
    REPEATED_WORD_REGEX = /\b(\w+)\b\s+\1/
    #  http://flanders.co.nz/2009/11/08/a-good-url-regular-expression-repost/
    URL_REGEX = /(?#Protocol)(?:(?:ht|f)tp(?:s?)\:\/\/|~\/|\/)?(?#Username:Password)(?:\w+:\w+@)?(?#Subdomains)(?:(?:[-\w]+\.)+(?#TopLevel Domains)(?:com|org|net|gov|mil|biz|info|mobi|name|aero|jobs|museum|travel|[a-z]{2}))(?#Port)(?::[\d]{1,5})?(?#Directories)(?:(?:(?:\/(?:[-\w~!$+|.,=]|%[a-f\d]{2})+)+|\/)+|\?|#)?(?#Query)(?:(?:\?(?:[-\w~!$+|.,*:]|%[a-f\d{2}])+=?(?:[-\w~!$+|.,*:=]|%[a-f\d]{2})*)(?:&(?:[-\w~!$+|.,*:]|%[a-f\d{2}])+=?(?:[-\w~!$+|.,*:=]|%[a-f\d]{2})*)*)*(?#Anchor)(?:#(?:[-\w~!$+|.,*:=]|%[a-f\d]{2})*)?/

    attr_reader :input_text, :tokenized_text, :sentences
    attr_accessor :finished_text

    def initialize(input_text)
      @input_text = input_text
      @finished_text = input_text
      @sentences = split_into_sentences
      @tokenized_text = tokenize_text
      @alerts = []
    end

    def scan 
      useless_words
      substitute_words
      adverbs_presence
      consecutively_repeated_words
      excess_white_spacing
      broken_links
      finished_text
    end

    def find_sentence(text)
      @sentences.find {|sentence| sentence.text == text}
    end

    private

    def broken_links
      links = input_text.scan(URL_REGEX)
      links.each do |url|
        begin
        Net::HTTP.get_response(URI.parse(url))
        # socket error occurs if link is bad
        rescue SocketError
          add_alert(BrokenLink, "Url #{url} does not work")
        end
      end
    end

    def add_alert(alert_type, corrected_sentence)
      @alerts << alert_type.new(corrected_sentence)
    end

    def remove(old_word)
      sub(old_word, "")
    end

    def sub(old_word, new_word)
      @finished_text.gsub!(/\b#{old_word}\b/, new_word)
    end

    def consecutively_repeated_words
      consecutively_repeated_words = input_text.downcase.scan(REPEATED_WORD_REGEX).flatten
      # we need capitalization permutations, ordered by most likely
      consecutively_repeated_words.each do |word|
        # d word
        suggested_sentence = @finished_text.sub!(/\b#{word}\b\s+\b#{word}\b/, "#{word}") ||
          @finished_text.sub!(/\b#{word.capitalize}\b\s+\b#{word.capitalize}\b/, "#{word}") ||
          @finished_text.sub!(/\b#{word.capitalize}\b\s+\b#{word}\b/, "#{word}") ||
          @finished_text.sub!(/\b#{word}\b\s+\b#{word.capitalize}\b/, "#{word}")
        add_alert RepeatedWord, suggested_sentence
      end 
    end

    def adverbs_presence 
      part_of_speech("RB").each do |word|
        suggested_sentence = remove(word)
        add_alert Adverb, suggested_sentence
      end
    end

    def part_of_speech(code)
      tokenized_text.select {|k,v| v== code}.map &:first
    end

    def tokenize_text
      res = eval(%x{python #{File.dirname(__FILE__)}/tokenizer.py "#{input_text}"})
      if res == nil || res == "" 
        raise TokenizerNotWorking, "Result of script: #{res}" 
      else
        res
      end
    end

    def excess_white_spacing
      suggested_sentence = @finished_text.gsub!(/\s+/, " ")
      add_alert ExcessWhiteSpace, suggested_sentence
    end

    def useless_words
      USELESS_WORDS.each do |useless_word|
         suggested_sentence = remove(useless_word)
         # don't add an alert is nothing found
         add_alert(UselessWord, suggested_sentence) if suggested_sentence
      end
    end

    def split_into_sentences
      tokenizer = Punkt::SentenceTokenizer.new(input_text)
      tokenizer.sentences_from_text(input_text, :output => :sentences_text).map {|text| Sentence.new(text)}
    end

    def substitute_words
      WORD_SUBSTITUTIONS.each do |offender, replacement|
        suggested_sentence = sub(offender.to_s, replacement.to_s)
         add_alert(UglyWord, suggested_sentence) if suggested_sentence
      end
    end

  end
end
