class SalonEvent < ActiveRecord::Base
    searchkick
    
    include Impressionist::IsImpressionable    
    is_impressionable
  	include PublicActivity::Model
  	tracked except: [:destroy]
  	scope :published, (-> { where(published: true) })
    scope :unpublished, (-> { where(published: false) })

	   has_many :event_registrations
  	 has_many :activities, as: :trackable, class_name: "PublicActivity::Activity", dependent: :destroy
  	 has_many :questions, (-> { approved })

  	 belongs_to :sponsor
  	
  	 mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.

end
