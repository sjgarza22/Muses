class PostsController < ApplicationController

    get '/posts' do
        @posts = Post.all
        erb :'/posts/show'
    end

    get '/post/new' do
        erb :'/posts/new'
    end

    post '/post/new' do
        post = Post.new
        post.title = params[:title] 
        post.content = params[:content]
        post.user_id = session[:user_id]
        post.muse_id = post.user.muses.find_by(name: params[:muse]).id
        if post.save
            redirect "/post/#{post.id}"
        end
    end

    get '/post/:id' do
        @post = Post.find_by(id: params[:id]) 
        erb :'/posts/single'
    end

    get '/post/edit/:id' do
       @post = Post.find_by(id: params[:id])
        if @post.user_id != session[:user_id]
            flash.next[:error] = "Oops! You're not supposed to be here."
            redirect "/dashboard"
        else
            erb :'/posts/edit'
        end
    end

    patch '/post/edit/:id' do
        post = Post.find_by(id: params[:id])
        if post.user_id != session[:user_id]
            flash.next[:error] = "What are you trying to do? This doesn't belong to you."
            redirect "/dashboard"
        else
            post.title = params[:title]
            post.content = params[:content]
            post.save
            redirect "/post/#{post.id}"
        end
    end

    delete '/post/:id' do
        post = Post.find_by_id(id: params[:id])
        if post.user_id != session[:user_id]
            flash.next[:error] = "Ah-ah-ah! You can't do that."
            redirect "/dashboard"
        else
            post.destroy
            redirect "/posts"
        end
    end
end