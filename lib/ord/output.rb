module Ord
  class Output
    def result
      @result ||= [""]
    end
  
    def puts(message)
      result << message
    end
  end
end