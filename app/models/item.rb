class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # has_one :purchase_record
  belongs_to :user
  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date

  has_one :order

  # active_storage
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :introduction
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :image

    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  # ジャンルの選択が「--」の時は保存不可
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :prefecture_id
    validates :shipping_date_id
  end
end
