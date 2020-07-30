class VinylRecordController < ApplicationController

    get '/vinyl_records' do
        erb :'vinyl_records/vinyl_records'
    end

end