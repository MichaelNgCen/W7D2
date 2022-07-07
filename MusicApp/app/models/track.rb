class Track < ApplicationRecord
    validates :title, presence: true
    validates :ord, presence: true

    belongs_to :album,
        foreign_key: :album_id,
        class_name: :Album

    
end
