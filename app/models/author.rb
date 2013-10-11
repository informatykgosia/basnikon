#encoding: UTF-8
class Author < ActiveRecord::Base
  has_and_belongs_to_many :stories
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  validates :first_name, :uniqueness => { :scope => :last_name}
  validates :first_name,  :presence => {:message => 'Musisz podać imię autora.'}
  validates :last_name,  :presence => {:message => 'Musisz podać nazwisko autora.'}
  mount_uploader :image, ImageUploader
end
