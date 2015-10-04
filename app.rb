require "sinatra"
require "mandrill"

m = Mandrill::API.new

get "/home" do
	erb :contactus 
end

post '/confirm' do 
  puts params.inspect
  message = params["message"]
  mandrill = Mandrill::API.new ENV['rlt8fbn1ZKzqbfNeRkumow']
    message = {
              :subject=> "Reservation Confirmation for VRNYC",
              :to=> [{
                      :email=> "talamgir@law.gwu.edu",
                      :name=> "VRNYC Experience",
                    }],
              :from_email=> "talamgir@law.gwu.edu",
              :html=> "<html>#{params[:user_name]}," + "you are confirmed for your reservation, your comments were " + "#{params[:user_message]}</html>"
              # :message=> "#{params[:user_name]}," + "you are confirmed for your reservation, your comments were " + "#{params[:user_message]}"
            }
            
  sending = m.messages.send(message)
  puts sending
  redirect to('/confirm')
end