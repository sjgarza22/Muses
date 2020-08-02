# Add check to make sure username is unique
class UsersController < ApplicationController
    get '/signup' do
        erb :'/users/signup'
    end

    post '/signup' do
        user = User.new(username: params[:username], email: params[:email], password: params[:password])

        if user.save
            session[:user_id] = user.id
            redirect '/dashboard'
        else   
            flash.next[:signup_error] = "One or more items in the form were left blank. Please try again."
            redirect '/signup'
        end
    end

    get '/login' do
        erb :'/users/login'
    end

    post '/login' do
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/dashboard'
        else
            flash.next[:login_error] = "One or more items were left blank. Please try again."
            redirect '/login'
        end
    end

    get '/users/:username' do
        erb :show
    end

    get '/users/:username/profile' do
        erb :'/users/profile'
    end

    get '/users/:username/settings' do
        erb :'/users/settings'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
end