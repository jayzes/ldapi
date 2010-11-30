class Ldapi::Application < Sinatra::Base

  get "/:uid.json" do
    content_type :json
    Ldapi::Backend.new.search(params[:uid]).to_json
  end
  
end