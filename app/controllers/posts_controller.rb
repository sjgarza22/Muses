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
       @post = Post.find_by(id: params[:id])
        if @post.user_id != session[:user_id]
            flash.next[:error] = "Oops! You're not supposed to be here."
            redirect "/dashboard"
        else
            erb :'/posts/edit'
        end
    end

    patch '/posts/edit/:id' do
        post = Post.find_by(id: params[:id])
        if post.user_id != session[:user_id]
            flash.next[:error] = "What are you trying to do? This doesn't belong to you."
            redirect "/dashboard"
        else
            post.update
        end
    end

    delete '/posts/:id' do
        post = Post.find_by_id(id: params[:id])
        if post.user_id == session[:user_id]
            post.destroy
            redirect "/posts"
        else
            flash.next[:error] = "Ah-ah-ah! You can't do that."
            redirect "/dashboard"
        end
    end
end