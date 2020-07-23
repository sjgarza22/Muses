class MusesController < ApplicationController

    get '/muses' do
        @muses = Muse.all
        erb :'/muses/show'
    end

    get '/muses/new' do
        erb :'/muses/new'
    end

    post '/muses/new' do
        muse = Muse.create(name: params[:name])


    end

end