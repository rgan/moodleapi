before do
  content_type 'application/json'
end

get "/courses" do
  Course.all.to_json
end

get "/courses/:id/enrolments" do
  Course.get(params[:id].to_i).enrolments.to_json
end
