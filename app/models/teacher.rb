class Teacher < ApplicationRecord
  has_many :folders
  has_many :document_editors
  has_many :documents, through: :document_editors
  has_one_attached :avatar
  validate :acceptable_image

  has _many_attached :id_cards
  validate :acceptable_document
  def acceptable_image
  return unless avatar.attached?

  unless avatar.blob.byte_size <= 1.megabyte
    errors.add(avatar, "is too big")
  end

  acceptable_types = ["image/jpeg", "image/png"]
  unless acceptable_types.include?(avatar.content_type)
    errors.add(:avatar, "must be a JPEG or PNG")
  end
end
  def full_name
    "#{first_name} #{last_name}"
  end

end
