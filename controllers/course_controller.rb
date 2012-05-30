get "/courses" do
  content_type 'application/json'
  Course.all.to_json
end

get "/courses/:id/enrolments" do
  course = Course.get(params[:id].to_i)
  halt(404, 'Not Found') if course.nil?
  content_type 'application/json'
  course.enrolments.to_json
end

post "/courses" do
  course = Course.parse_json(request.body.read) rescue nil
  halt(401, "Invalid format") if course.nil?

  halt(401, course.errors) if !course.valid?
  halt(500, "Could not save") unless course.save

  response['Location'] = course.url
  response.status = 201
end
