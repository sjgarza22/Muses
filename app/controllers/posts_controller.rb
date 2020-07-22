class PostsController < ApplicationController

    get '/posts' do
        @posts = Post.all
        erb :'/posts/show'
    end

    get '/posts/new' do
        erb :'/posts/new'
    end

    post '/posts/new' do
        post = Post.create(title: param(:title), content: param(:content))
        
    end

    get '/posts/edit/:id' do
        erb :'/posts/edit'
    end

    patch '/posts/edit' do

    end
end