get "/courses" do
  content_type 'application/json'
  Course.all.to_json
end

post "/courses" do
  course = Course.parse_json(request.body.read) rescue nil
  halt(401, "Invalid format") if course.nil?

  halt(401, course.errors) unless course.valid?
  halt(500, "Could not save") unless course.save

  response['Location'] = course.url
  response.status = 201
end
