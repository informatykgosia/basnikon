#encoding: UTF-8
class Story < ActiveRecord::Base
  has_many :heros,:order =>'name ASC' , :dependent => :destroy
  has_and_belongs_to_many :authors
 
  validates :title, :uniqueness => { :message => 'Jest już taka baśń' }
  validates :title,  :presence => {:message => 'Musisz podać tytuł.'}
  validates :authors,  :presence => {:message => 'Musisz podać autora.'}
  #validates :author_id,  :presence => {:message => 'Musisz podać autora.'}





end
