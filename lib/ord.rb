require 'sinatra/base'
require 'json'
require 'singleton'

require 'ord/engine'
require 'ord/app'
require 'ord/output'

module Ord
  
  Engine.instance.load_file('public/en.txt')  

  def self.engine
    Engine.instance
  end

  def self.app
    Ord::App
  end
end