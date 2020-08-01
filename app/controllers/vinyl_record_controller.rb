class VinylRecordController < ApplicationController

    get '/vinyl_records' do
        @user = current_user
        erb :'vinyl_records/index'
    end

    get '/vinyl_records/new' do
        erb :'vinyl_records/new'
    end

    post '/vinyl_records' do
        @vinyl_record = current_user.vinyl_records.create(params)

        if @vinyl_record.save
            redirect '/vinyl_records'
        else
            redirect '/vinyl_records/new'
        end 
    end

end