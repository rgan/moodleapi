get "/courses" do
  content_type 'application/json'
  Course.all.to_json
end

post "/courses" do
  handle_post(Course)
end
