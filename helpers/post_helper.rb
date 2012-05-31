require 'sinatra/base'

module Sinatra
  module PostHelper
    def handle_post(modelClass)
      model = modelClass.parse_json(request.body.read) rescue nil
      halt(401, "Invalid format") if model.nil?

      halt(401, model.errors) unless model.valid?
      halt(500, "Could not save") unless model.save

      response['Location'] = model.url
      response.status = 201
    end
  end

  helpers PostHelper
end