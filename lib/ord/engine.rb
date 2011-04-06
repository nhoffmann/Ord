module Ord
  class Engine
    include Singleton    
        
    def load_string(string, delimiter)
      @word_list = []
      string.each(delimiter) do |word| 
        @word_list << word.strip
      end
    end      
    
    def load_file(file_path)
      @word_list = []
      file = File.open(file_path)
      file.each do |word|
        @word_list << word.strip
      end
      file.close
    end
        
    def word(query_string)
      result = false
      @word_list.each do |word|
        if word.eql?(query_string)
          result = true
          break
        end
      end
      result
    end
    
    def starts_with(query_string)
      result = []
      @word_list.each do |word|
        if compare_string_with_substring(word, query_string)
          result << word
        end
      end
      result
    end
    
    def ends_with(query_string)
      result = []
      @word_list.each do |word|
        if compare_string_with_substring(word.reverse, query_string.reverse)
          result << word
        end
      end
      result
    end
    
    def contains(query_string)
      result = []
      @word_list.each do |word|
        if word.include?(query_string)
          result << word
        end
      end
      result
    end
    
    def next(query_string)
      index = @word_list.index(query_string)
      return @word_list[index+1] if index  
    end

    def previous(query_string)
      index = @word_list.index(query_string)
      return @word_list[index-1] if index
    end
    
    def compare_string_with_substring(string, substring)
      string[0, substring.length].include?(substring)
    end
        
    def running? 
      @word_list.empty?
    end
    
    def size
      @word_list.size
    end
    
  end
end