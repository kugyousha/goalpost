class Page < ActiveRecord::Base
  belongs_to :user
  has_many :lists, dependent: :destroy
end
