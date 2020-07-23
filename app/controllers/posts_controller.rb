class PostsController < ApplicationController

    get '/posts' do
        @posts = Post.all
        erb :'/posts/show'
    end

    get '/posts/new' do
        erb :'/posts/new'
    end

    post '/posts/new' do
        post = Post.new
        post.title = params[:title]
        post.content = params[:content]
        post.user_id = session[:user_id]
        
        if post.save
            redirect "/posts/#{post.id}"
        end
    end

    get '/posts/:id' do
        @post = Post.find_by(id: params[:id])
        erb :'/posts/single'
    end

    get '/posts/edit/:id' do
        erb :'/posts/edit'
    end

    patch '/posts/edit/:id' do

    end

    delete '/posts/:id' do

    end
end