class Document < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true, length: {minimum: 20}
  validates :pdf, presence: true

  has_attached_file :pdf
  validates_attachment :pdf, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end
