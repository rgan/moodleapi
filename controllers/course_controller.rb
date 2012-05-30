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