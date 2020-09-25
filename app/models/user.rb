class User < ActiveRecord::Base
  has_merit

  # Include default devise modules.
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable
  #devise :registerable, :confirmable, :database_authenticatable

  after_create :send_confirmation_email
  
  include DeviseTokenAuth::Concerns::User
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image
  mount_uploader :profile_image, UserImageUploader

  include Impressionist::IsImpressionable
  is_impressionable

  def crop_image
    profile_image.recreate_versions! if crop_x.present?
  end

  def self.find_for_database_authentication(conditions={})
    find_by(login: conditions[:email]) || find_by(email: conditions[:email])
  end

  has_many :health_resources
  has_many :favorites
  has_many :favorite_resources, through: :favorites, source: :health_resource # the actual health_resources a user favorites

  has_many :reviews, (-> { published })
  has_many :blog_posts
  has_many :blog_comments, (-> { published })
  has_many :event_registrations
  has_many :sponsors
  has_many :questions, (-> { approved })
  has_many :scripts_and_tips
  has_many :survey_scores

  has_one :mars_rating 

  EMAIL_REGULAR_EXPRESSION = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :email, presence: true, format: { with: EMAIL_REGULAR_EXPRESSION }, uniqueness: true
  validates :login, presence: true, uniqueness: true, length: { minimum: 4 }

  enum role: [:admin, :expert, :coach, :registered, :cagmember]
  enum program_status: [:current, :waitlist, :pending, :alum, :other]

  YES = [
    "Yes",
    "No"
  ].freeze

  HOW = [
    "Rehabilitation Sciences (U of T)",
    "SCI-Ontario",
    "SCI-BC",
    "Rick Hansen Institute",
    "Word Of Mouth",
    "Other"
  ].freeze

  GENDER = [
    "Male",
    "Female",
    "Non-binary/Third Gender",
    "Prefer to Self-Describe",
    "Prefer Not to Say"
  ].freeze

  INJURY_LEVEL = [
    "None",
    "C1",
    "C2",
    "C3",
    "C4",
    "C5",
    "C6",
    "C7",
    "C8",
    "T1",
    "T2",
    "T3",
    "T4",
    "T5",
    "T6",
    "T7",
    "T8",
    "T9",
    "T10",
    "T11",
    "T12",
    "L1",
    "L2",
    "L3",
    "L4",
    "L5",
    "S1",
    "S2",
    "S3",
    "S4-5",
    "I don't know"
  ].freeze

  PROVINCE = [
    "",
    "Alberta",
    "British Columbia",
    "Manitoba",
    "New Brunswick",
    "Newfoundland and Labrador",
    "Northwest Territories",
    "Nova Scotia",
    "Nunavut",
    "Ontario",
    "Prince Edward Island",
    "Quebec",
    "Saskatchewan",
    "Yukon"
  ].freeze

  def send_confirmation_email
    p 'inside after_create callback func.'
    MyDeviseMailer.confirmation_instructions(self, self.confirmation_token).deliver
  end

#  def active_for_authentication?
#    super 
#  end

#  def active_for_authentication?
#    super && approved?
#  end

#  def inactive_message
#    if !approved?
#      :not_approved
#    else
#      super # Use whatever other message
#    end
#  end

#  def self.send_reset_password_instructions(attributes = {})
#    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
#    #if !recoverable.approved?
#    #  recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
#    if recoverable.persisted?
#      recoverable.send_reset_password_instructions
#    end
#    recoverable
#  end

end
