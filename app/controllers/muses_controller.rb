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
        muse.user_id = session[:user_id]

        if muse.save
            redirect "/muses/#{muse.id}"
        else
            redirect "/muses/new"
        end        
    end

    get '/muses/:id' do
        @muse = Muse.find_by_id(params[:id])
        erb :'/muses/single'
    end

    get '/muses/edit/:id' do
        @muse = Muse.find_by_id(params[:id])
        if @muse.user_id == session[:user_id]
            erb :'/muses/edit'
        else
            flash.next[:error] = "I'm sorry, but you aren't allowed here."
            redirect "/dashboard"
        end
    end

    patch '/muses/edit/:id' do
        muse = Muse.find_by_id(params[:id])
        if muse.user_id == session[:user_id]
            muse.name = params[:name]
            muse.about = params[:about]
            redirect "/muse/#{muse.id}"
        else
            flash.next[:error] = "I'm sorry, but you aren't allowed here."
            redirect "/dashboard"
        end
    end

    delete '/muses/:id' do
        muse = Muse.find_by_id(params[:id])
        if muse.user_id == session[:user_id]
            muse.destory
        else
            flash.next[:error] = "I'm sorry, but you aren't allowed here."
        end

        redirect "/dashboard"
    end
end