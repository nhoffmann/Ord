module Ord
  class App < Sinatra::Application
    
    before do
      content_type :json
    end
    
    get '/?' do
      #haml :home
    end
    
    get %r{/word/(.*)} do | query_string |
      result = Ord.engine.word(query_string)
      
      halt 404 unless result
      
      status 200 
    end
    
    get %r{/starts-with/(.*)} do | query_string |
      result = Ord.engine.starts_with(query_string)
      
      halt 404 if result.empty?
      
      status 200
      body result.to_json
    end
    
    get %r{/ends-with/(.*)} do | query_string |
      result = Ord.engine.ends_with(query_string)
      
      halt 404 if result.empty?
      
      status 200
      body result.to_json
    end
    
    get %r{/contains/(.*)} do | query_string |
      result = Ord.engine.contains(query_string)
      
      halt 404 if result.empty?
      
      status 200
      body result.to_json
    end

  end
end