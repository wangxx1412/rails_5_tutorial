class Image < ApplicationRecord
  belongs_to :article
  mount_uploader :picture, PictureUploader
  validate :picture_size

  private

  def picture_size
    if picture.size > 3.megabytes
      errors.add(:picture, "should be less than 3MB")
    end
  end
end
