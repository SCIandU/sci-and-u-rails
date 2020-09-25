class Review < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: :user, except: [:create, :destroy]

  scope :published, (-> { where(published: true) })
  scope :unpublished, (-> { where(published: false) })

  belongs_to :health_resource
  belongs_to :user
  has_many :activities, as: :trackable, class_name: "PublicActivity::Activity", dependent: :destroy
end
