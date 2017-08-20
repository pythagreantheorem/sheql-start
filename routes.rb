get '/' do
  if no_authentication?
    erb :"home"
  else
    "Hi, #{session[:name]}.  <img style='width:60px; border-radius:50%;' src='#{session[:picture]}' >"
  end
end

get '/signup' do
  @user = User.new(username: params["username"].to_s, password: params["password"].to_s, age: params["age"].to_i)
  erb :"files/signup"
end


post '/signup' do
  @user = User.new(username: params["username"].to_s, password: params["password"].to_s, age: params["age"].to_i)
  
  if @user.save
    redirect to("my-works/#{@user.id}")
  else
    erb :"files/signup"
  end
end


get '/log-in' do
  "Log-In Sheet Coming!"
end

get '/work-edit/:user_id' do
  @id = params[:user_id].to_i
  @work = Work.new()
  erb :"works/create"
end


post '/work-edit/:user_id' do
  @work = Work.new()
  
  if @work.save
    redirect to("work-view/#{@work.id}")
  else
    erb :"works/create"
  end
end

get '/works' do
  @works = Work.all
  erb :"works/index"
end


get '/work-view/:id' do
  id = params[:id].to_i
  @work = Work.find(id)
  @user = User.find(@work.user_id)
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
