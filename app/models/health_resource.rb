class HealthResource < ActiveRecord::Base
  #searchkick
  include PublicActivity::Model
  tracked owner: :user, except: [:create, :destroy]
  scope :published, (-> { where(published: true) })
  scope :unpublished, (-> { where(published: false) })
  include Impressionist::IsImpressionable
  is_impressionable

  AUDIENCES = [
    "General Audiences",
    "Persons in Wheelchairs",
    "Persons with SCI",
    "Persons with Chronic Conditions other than SCI"
  ].freeze

  TOOL_TYPES = [
    "Basic Information",
    "Health Tracker/Monitoring Tool",
    "Tool for Peer or HCP Interaction: Chat Room, Forum or Social Network",
    "Tool for Peer or HCP Interaction: Community Reviews",
    "Tool for Peer or HCP Interaction: Messaging or Expert Advice",
    "Tool for Peer/HCP Interaction: Crowdsourcing tool",
    "Tool for Peer/HCP Interaction: Crowdsourcing tool"
  ].freeze

  FORMATS = [
    "Mobile and Desktop Accessible",
    "Desktop Accessible",
    "Mobile Accessible",
    "Accessible In-Person",
    "PDF Resource",
    "Video Resource"
  ].freeze

  has_many :reviews, (-> { published })

  has_many :activities, as: :trackable, class_name: "PublicActivity::Activity", dependent: :destroy

  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.

  belongs_to :department
  belongs_to :problem
  belongs_to :solution_category
  belongs_to :sponsor

  belongs_to :user
  has_many :favorites 
  has_many :favorited_by, through: :favorites, source: :user # the actual users favoriting a recipe

  validates :title, presence: true
  validates :description, presence: true

  validates :audience, inclusion: { in: AUDIENCES }, allow_blank: true
  validates :tool_type, inclusion: { in: TOOL_TYPES }, allow_blank: true
  validates :format, inclusion: { in: FORMATS }, allow_blank: true

  before_validation :format_url

  def search_data
    {
      title: title,
      description: description,      
      department_name: department.name,
    }
  end    

  private

  def format_url
    # For people who forget to preface urls with http or https schema
    self.url = "http://#{url}" if url.present? && url !~ /https?:\/\//
  end
end
