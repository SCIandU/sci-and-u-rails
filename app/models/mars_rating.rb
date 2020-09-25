class MarsRating < ActiveRecord::Base
	belongs_to :user	

	validates :consent_form, acceptance: true, if: ->(o) { o.current_step == "intro" }
	validates :engagement1, presence: true, if: ->(o) { o.current_step == "engagement" } 
	validates :engagement2, presence: true, if: ->(o) { o.current_step == "engagement" }
	validates :engagement3, presence: true, if: ->(o) { o.current_step == "engagement" }
	validates :engagement4, presence: true, if: ->(o) { o.current_step == "engagement" }
	validates :engagement5, presence: true, if: ->(o) { o.current_step == "engagement" }
	validates :functionality1, presence: true, if: ->(o) { o.current_step == "functionality" }
	validates :functionality2, presence: true, if: ->(o) { o.current_step == "functionality" }
	validates :functionality3, presence: true, if: ->(o) { o.current_step == "functionality" }
	validates :functionality4, presence: true, if: ->(o) { o.current_step == "functionality" }
	validates :aesthetics1, presence: true, if: ->(o) { o.current_step == "aesthetics" }
	validates :aesthetics2, presence: true, if: ->(o) { o.current_step == "aesthetics" }
	validates :aesthetics3, presence: true, if: ->(o) { o.current_step == "aesthetics" }
	validates :information1, presence: true, if: ->(o) { o.current_step == "information" }
	validates :information2, presence: true, if: ->(o) { o.current_step == "information" }
	validates :information3, presence: true, if: ->(o) { o.current_step == "information" }
	validates :information4, presence: true, if: ->(o) { o.current_step == "information" }
	validates :information5, presence: true, if: ->(o) { o.current_step == "information" }
	validates :information6, presence: true, if: ->(o) { o.current_step == "information" }
	validates :information7, presence: true, if: ->(o) { o.current_step == "information" }
	validates :subjective1, presence: true, if: ->(o) { o.current_step == "other" }
	validates :subjective2, presence: true, if: ->(o) { o.current_step == "other" }
	validates :subjective3, presence: true, if: ->(o) { o.current_step == "other" }
	validates :subjective4, presence: true, if: ->(o) { o.current_step == "other" }
	validates :appspecific1, presence: true, if: ->(o) { o.current_step == "tailored" }
	validates :appspecific2, presence: true, if: ->(o) { o.current_step == "tailored" }
	validates :appspecific3, presence: true, if: ->(o) { o.current_step == "tailored" }
	validates :appspecific4, presence: true, if: ->(o) { o.current_step == "tailored" }
	validates :appspecific5, presence: true, if: ->(o) { o.current_step == "tailored" }
	validates :appspecific6, presence: true, if: ->(o) { o.current_step == "tailored" }

  	include Impressionist::IsImpressionable
  	is_impressionable

	attr_writer :current_step
	attr_accessor :consent_form
	attr_accessor :technical_help

	def current_step
	  @current_step || steps.first
	end

	def steps
	  %w[intro engagement functionality aesthetics information other tailored]
	end

	def next_step
	  self.current_step = steps[steps.index(current_step) + 1]
	end

	def previous_step
	  self.current_step = steps[steps.index(current_step) - 1]
	end

	def first_step?
	  current_step == steps.first
	end

	def last_step?
	  current_step == steps.last
	end

	def all_valid?
	  steps.all? do |step|
	    self.current_step = step
	    valid?
	  end
	end

end
