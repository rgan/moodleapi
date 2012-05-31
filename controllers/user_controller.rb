get "/users" do
  content_type 'application/json'
  User.all.to_json
end

post "/users" do
  handle_post(User)
end