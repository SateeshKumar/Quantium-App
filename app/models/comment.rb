class Comment < ActiveRecord::Base
  attr_accessible :comment, :movie_id, :name
end
