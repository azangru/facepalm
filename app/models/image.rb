class Image < ActiveRecord::Base
  attr_accessible :text, :url

  mount_uploader :url, ImageUploader
end
