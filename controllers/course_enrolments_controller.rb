get "/courses/:id/enrolments" do
  course = Course.get(params[:id].to_i)
  halt(404, 'Not Found') if course.nil?
  content_type 'application/json'
  course.enrolled_users.to_json
end

post "/courses/:id/enrolments" do
  course = Course.get(params[:id].to_i)
  halt(404, 'Course not Found') if course.nil?
  enrolment = Enrolment.parse_json(request.body.read) rescue nil
  halt(401, 'Invalid data') if enrolment.nil?
  course.add_enrolment(enrolment)
  response['Location'] = enrolment.url
end