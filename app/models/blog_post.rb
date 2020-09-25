class BlogPost < ActiveRecord::Base
  searchkick
  include Impressionist::IsImpressionable
  is_impressionable
  
  include PublicActivity::Model
  tracked owner: :user, except: [:destroy]
  
  scope :published, (-> { where(published: true) })
  scope :unpublished, (-> { where(published: false) })
  
  belongs_to :user
  belongs_to :department
  belongs_to :sponsor
    
  has_many :blog_comments, (-> { published })
  has_many :activities, as: :trackable, class_name: "PublicActivity::Activity", dependent: :destroy

  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.

end
