require 'sinatra'
require 'json'

require './config.rb'
Dir[File.expand_path("controllers") + '/*.rb'].each { |f| require f }
Dir[File.expand_path("models") + '/*.rb'].each { |f| require f }
DataMapper.finalize

