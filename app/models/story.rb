class Story < ActiveRecord::Base
  
  include Impressionist::IsImpressionable
  is_impressionable
  searchkick
  include PublicActivity::Model
  tracked except: [:destroy]
  scope :published, (-> { where(published: true) })
  scope :unpublished, (-> { where(published: false) })
  scope :next, lambda {|id| where("id > ?",id).order("id ASC") } # this is the default ordering for AR
  scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }  
  
  belongs_to :department
  belongs_to :sponsor  
     
  has_many :activities, as: :trackable, class_name: "PublicActivity::Activity", dependent: :destroy

  mount_uploader :attachment, AttachmentUploader	

  # NEXT / PREVIOUS FUNCTIONALITY
  def previous_post
    self.class.first(:conditions => ["title < ?", title], :order => "title desc")
  end

  def next_post
  	self.class.first(:conditions => ["title > ?", title], :order => "title asc")
  end


end
