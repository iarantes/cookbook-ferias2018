class Recipe < ApplicationRecord
  belongs_to :cuisine
  belongs_to :recipe_type

  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  validates :title, :recipe_type, :difficulty, :cook_time, :ingredients, :cook_method, presence: { message: 'Você deve informar todos os dados da receita' }
end
