class VinylRecord < ActiveRecord::Base
    belongs_to :users

    validates :artist, presence: true
    validates :album, presence: true
    validates :genre, presence: true
    validates :year, presence:true
end