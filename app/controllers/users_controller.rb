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

    # post '/users/login' do

    #     # redirect 'index'
    # end

    # get '/users/:username' do
    #     erb :'/users/profile'
    # end

    # get '/users/settings' do
    #     erb :'/users/settings'
    # end
end