require "cadmium_tokenizer"
require "cadmium_util"

module Cadmium
  abstract class Phonetics
    include Cadmium::Util::StopWords

    @@tokenizer = Cadmium::Aggressive.new

    def self.compare(word1, word2)
      process(word1) == process(word2)
    end

    def self.tokenize_and_phoneticize(word, keep_stops = false)
      phoneticized_tokens = [] of String
      @@tokenizer.tokenize(word).each do |token|
        if keep_stops || @@stop_words.includes?(token) == false
          phoneticized_tokens.push process(token)
        end
      end
      phoneticized_tokens
    end
  end
end
