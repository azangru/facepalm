class Image < ActiveRecord::Base
  attr_accessible :text, :url, :coordinates

  attr_accessor :user_text, :coordinates

  mount_uploader :url, ImageUploader

  # def self.recreate_versions!
  #   Image.find_in_batches do |batch|
  #     batch.each do |photo|
  #       photo.url.recreate_versions! if photo.url?
  #     end
  #   end
  # end

  def instance_recreate_versions!
    url.recreate_versions!
  end

  def set_coordinates(coords)
    @coordinates = coords
  end

  def get_coordinates
    @coordinates
  end

end
