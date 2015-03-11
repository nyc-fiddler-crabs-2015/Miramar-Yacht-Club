# get '/login' do
#   @error = params[:error]
#   @error = @error.tr!('_', ' ') if @error
#   redirect "users/#{current_user.id}" if current_user
#   erb :'auth/login'
# end


# post '/login' do 
#   user = User.find_by_username(params[:username])
#   if user && user.authenticate( params[:password] )
#     session[:user_id] = user.id
#     redirect "/users/#{user.id}"
#   else
#     redirect "/login?error=The_username_or_password_is_incorrect"
#   end
# end


post '/login_ajax' do
  content_type :json
  user = User.find_by_username(params[:username])
  if user && user.authenticate( params[:password] )
    session[:user_id] = user.id
    {avatar: user.avatar, user_id: user.id, username: user.username}.to_json
  else
    401
  end
end


get '/logout' do
  session[:user_id] = nil
  redirect '/'
end



get '/signup' do
  @error = params[:error]
  @error = @error.tr!('_', ' ') if @error
  erb :'auth/signup'
end


post '/signup' do
  user = User.new(params)

  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    redirect "/signup?error=You_need_to_fill_out_all_the_fields"

  end

end

