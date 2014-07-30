class Tema < ActiveRecord::Base
  extend FriendlyId
  friendly_id :titulo, use: :slugged

  has_many :temas_indicadors, :dependent => :destroy
  has_many :indicadors, :through => :temas_indicadors

  # accepts_nested_attributes_for :indicadors

  attr_accessible :titulo, :imagem

  has_attached_file :imagem, :styles => { :medium => "150x150>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :imagem, :content_type => /\Aimage\/.*\Z/
end
