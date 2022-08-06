class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'include both letters and numbers'}

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/, message: 'is full_width characters' } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'is full_width characters' } do
    validates :family_name_kana
    validates :first_name_kana
  end
  
  validates :birth_date, presence: true

  has_many :items
  #has_many :purchase_records

end
