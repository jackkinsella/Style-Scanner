module StyleScanner
  class Sentence 
    
    extend Forwardable
    def_delegators :copy_of_text, :gsub!, :match, :scan, :downcase, :sub!

    attr_reader :problems, :text
    
    def initialize(text)
      @text = text
      @problems = []
    end

    def find_problems_by_type(problem_type)
      @problems.select {|problem| problem.class == problem_type}
    end

    def tagged_words
      tagger.tagged_words
    end

    def adverbs
      part_of_speech("RB")
    end

    def contains?(word, options = {})
      options = {:strip_case=> true}.merge(options)
      text_to_scan = text
      text_to_scan = text_to_scan.downcase if options[:strip_case]
      text_to_scan = text_to_scan.stem_verbs if options[:stem_verbs]
      text_to_scan.match /\b#{word}\b/
    end

    def user_friendly_readout
       problems.flatten.map(&:user_friendly_readout) if with_problems?
    end

    def add_problem(problem)
      problems << problem
    end

    def with_problems?
      problems.any?
    end

    def to_s
      "Sentence Obj: text: #{text} problems: #{problems}"
    end

    private

    def part_of_speech(pos)
      tagged_words.select {|tagged_word| tagged_word.tag == pos }.map(&:word)
    end

    def tagger
      @tagger ||= Tagger.new(text)
    end

    # we don't want to modify the original text
    def copy_of_text
      text.dup
    end
  end
end
