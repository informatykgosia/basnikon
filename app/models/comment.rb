#encoding: UTF-8
class Comment < ActiveRecord::Base
  belongs_to :hero
  validates :body, 
    :length => {:minimum => 5, :too_short => 'Komentarz musi się składać z co najmniej 5 znaków.' }
end
