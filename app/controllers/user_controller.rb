class UserController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect '/vinyl_records'
        end
        erb :'/users/new'
    end

    post '/signup' do
        @user = User.new(params)
        if @user.save
            session[:user_id] = @user[:id]
            redirect "/vinyl_records"
        else
            erb :'/users/new'
        end
    end

    get '/login' do
        if logged_in?
            redirect "/vinyl_records"
        end
        
        erb :'/users/login'
    end

    post '/login' do
        @user = User.find_by(:username => params[:username], :email => params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/vinyl_records'
        else
            erb :'/users/login'
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
        end
        redirect '/'
    end
end