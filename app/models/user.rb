class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :movements
  has_many :items, through: :movements
  # me trae un array de todas las compras del usuario
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end
