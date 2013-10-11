#encoding: UTF-8
class Illustration < ActiveRecord::Base
	belongs_to :hero
	mount_uploader :illustration, IllustrationUploader
  validates :illustration,  :presence => {:message => 'Nie wybrano ilustracji.'}
end
