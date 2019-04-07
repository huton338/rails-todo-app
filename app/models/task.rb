class Task < ApplicationRecord

  #ransackで検索を行える対象を絞っている
  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at]
  end

  #TODO:ここ調べる
  def self.ransackable_associations(auth_object = nil)
    []
  end

  validates :name, presence: true
  validates :name, length: { maximum: 30 }

  belongs_to :user
end
