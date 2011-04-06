$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))

use Rack::Static, :urls => ['/stylesheets', '/javascripts'], :root => 'public'

require 'ord'
run Ord.app