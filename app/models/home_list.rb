class HomeList < ActiveRecord::Base
  belongs_to :film_id
  belongs_to :user_id
end
