class PreviousFilm < ActiveRecord::Base
  belongs_to :user
  belongs_to :film
end