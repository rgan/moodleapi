require 'rspec'
ENV["RACK_ENV"] ||= 'test'
require 'sinatra'
require 'json'
require 'rack/test'
Dir[File.expand_path("models") + '/**/*.rb'].each {|f| require f}
Dir[File.expand_path("helpers") + '/**/*.rb'].each {|f| require f}
Dir[File.expand_path("controllers") + '/**/*.rb'].each {|f| require f}
Dir[File.expand_path("spec/factories") + '/*.rb'].each {|f| require f}
DataMapper.finalize
require File.expand_path("../../config", __FILE__)



