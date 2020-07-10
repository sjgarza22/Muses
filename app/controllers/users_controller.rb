class UsersController < ApplicationController
    get '/users/signup' do
        erb :'/users/signup'
    end

    post '/users/signup' do
        user = User.new(username: params[:username], email: params[:email], password: params[:password])

        if user.save
            redirect '/users/login'
        else
            redirect '/users/signup'
        end
    end

    get '/users/login' do
        erb :'/users/login'
    end

    post '/users/login' do
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            redirect '/dashboard'
        else
            redirect '/users/login'
        end
    end

    # get '/users/:username' do
    #     erb :'/users/profile'
    # end

    # get '/users/settings' do
    #     erb :'/users/settings'
    # end
end