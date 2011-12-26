module Style
  include Errors
    class Tokenizer
        attr_reader :input_text, :tokenized_text

        def initialize(input_text)
            @input_text = input_text
        end

        def tokenize
            res = eval(%x{python #{File.dirname(__FILE__)}/tokenizer.py "#{input_text}"})
            if res == nil || res == "" 
                raise TokenizerNotWorking, "Result of script: #{res}" 
            else
                res
            end
        end

    end
end
