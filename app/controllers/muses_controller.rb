class MusesController < ApplicationController

    get '/muses' do
        @muses = Muse.all
        erb :'/muses/show'
    end

    get '/muses/new' do
        erb :'/muses/new'
    end

    post '/muses/new' do
        muse = Muse.new
        muse.name = params[:name]
        muse.about = params[:about]

        if muse.save
            redirect "/muses/#{post.id}"
        end        
    end

    get '/muses/:id' do
        @muse = Muse.find_by_id(params[:id])
        erb :'/muses/show'
    end
end