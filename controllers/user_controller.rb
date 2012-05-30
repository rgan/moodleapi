get "/users" do
  content_type 'application/json'
  User.all.to_json
end

post "/users" do
  user = User.parse_json(request.body.read) rescue nil
  halt(401, "Invalid format") if user.nil?

  halt(401, course.errors) unless user.valid?
  halt(500, "Could not save") unless user.save

  response['Location'] = user.url
  response.status = 201
end