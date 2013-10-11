#encoding: utf-8
class Hero < ActiveRecord::Base
  belongs_to :story
  belongs_to :user
  has_many :comments
  has_many :illustrations
  acts_as_taggable
  acts_as_taggable_on :tags
scope :by_letter,
	lambda { |letter| {
	:conditions => ["heros.name LIKE ?", "#{letter}%"]
}}
  def story_title
    story.title if story
  end
  def story_title=(title)
    self.story = Story.find_or_create_by_title(title) unless title.blank?
  end
  validates :name,  :presence => {:message => 'Musisz podać nazwę lub imię postaci.'}
  validates :name, :uniqueness => { :scope => :story_id, :message =>'Taka postać już została opisana w obrębie tej baśni.' }

  validates :description, 
    :length => {:minimum => 150, :too_short => 'Opis postaci musi zawierać minimum 150 znaków - jedno dobre zdanie.' }
  tag_format = /^\s*[A-Za-z0-9\sąĄćĆĘęńŃóÓŚśżŻźŹłŁ]+(\s*,\s*[A-Za-z0-9\sąĄćĆŃńęĘóśŚÓłŁżŻźŹ]+)*\s*$/i

  validates :tag_list, 
    :format =>{:with => tag_format, :message => "Poszczególne tagi odzielaj przecinkami. Dozwolone znaki dla tagów to litery, cyfry oraz spacje."} 

  validates :story_id,  :presence => {:message => 'Musisz wybrać baśń.'}
  mount_uploader :picture, PictureUploader
end
