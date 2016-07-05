class Document < ActiveRecord::Base
  belongs_to :user

  validates :title,
          :presence => {:message => "El titulo no puede estar en blanco" },
          :length => { :in => 20..100, :message => "El titulo debe estar entre 20 a 100 caracteres"}

  validates :description,
          :presence => {:message => "La descripcion no puede estar en blanco" },
          :length => { :minimum => 20, :message => "La descripcion debe tener mas de 20 caracteres"}

  validates :pdf,
          :presence => {:message => "No hay ningun archivo para subir" }

  has_attached_file :pdf
  validates_attachment :pdf, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end
