get '/' do
  if no_authentication?
    erb :"home"
  else
    "Hi, #{session[:name]}.  <img style='width:60px; border-radius:50%;' src='#{session[:picture]}' >"
  end
end

get '/sign-up' do
  "Sign-Up Sheet Coming!"
end


get '/log-in' do
  "Log-In Sheet Coming!"
end


get '/welcome/:id' do
  id = params[:id].to_i
  @user = User.find(id)
  "This is your page, #{@user.username}."
end


get '/work-edit/id' do
  "Need to Work on ID stuff also where to edit work"
end


get '/works' do
  @works = Work.all
  erb :"works/index"
end


get '/work-view/:id' do
  id = params[:id].to_i
  @work = Work.find(id)
  @user = User.find(work.user_id)
  erb :"works/view"
end


get '/my-works/:id' do
   id = params[:id].to_i
   @user = User.find(id)
   @works = Work.where({ user_id: id})
   erb :"users/show"
end


get '/users' do
  @users = User.all
  erb :"users/index"
end

get '/graduation' do
    erb :"graduation/post", layout: :"graduation/layout"
  # Page where user can log in
end

get '/check' do 
  "#{Work.all}"
end