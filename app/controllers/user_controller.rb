class UserController < ApplicationController

    get '/signup' do
        #if logged_in?
            #redirect '/vinyl_records'
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



end