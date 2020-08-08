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

    get '/vinyl_records/:id' do
        @vinyl_record = VinylRecord.find_by_id(params[:id])
            if @vinyl_record == nil
                redirect '/vinyl_records'
            end

        erb :'vinyl_records/show'
    end

    get '/vinyl_records/:id/edit' do
        @vinyl_record = VinylRecord.find_by_id(params[:id])

        erb :'vinyl_records/edit'
    end

    patch '/vinyl_records/:id' do
        @vinyl_record = VinylRecord.find_by_id(params[:id])

        @vinyl_record.update(artist: params[:artist], album: params[:album], genre: params[:genre], year: params[:year])

        redirect '/vinyl_records'
    end

    delete '/vinyl_records/:id' do
        if !logged_in?
            redirect '/login'
        end
        VinylRecord.delete(params[:id])

        redirect '/vinyl_records'
    end


end