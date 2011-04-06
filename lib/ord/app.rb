module Ord
  class App < Sinatra::Application
    
    set :static, true
    
    def resp(query_string, word_in_list, content = '')
      {
        'query_string' => query_string,
        'word_in_list' => word_in_list,
        'content'      => content
      }
    end
    
    before do
      content_type :json
    end
    
    get '/?' do
      content_type :html
      haml :home
    end
    
    get %r{/word/(.*)} do | query_string |
      result = Ord.engine.word(query_string)
      sibblings = {}
      if result
        sibblings['previous'] = Ord.engine.previous(query_string)
        sibblings['next'] = Ord.engine.next(query_string)
      end    
      body resp(query_string, result, sibblings).to_json
    end
    
    get %r{/starts-with/(.*)} do | query_string |
      result = Ord.engine.starts_with(query_string)
      
      body resp(query_string, !result.empty?, result).to_json
    end
    
    get %r{/ends-with/(.*)} do | query_string |
     result = Ord.engine.ends_with(query_string)
      
     body resp(query_string, !result.empty?, result).to_json
    end
    
    get %r{/contains/(.*)} do | query_string |
     result = Ord.engine.contains(query_string)
      
     body resp(query_string, !result.empty?, result).to_json
    end

  end
end