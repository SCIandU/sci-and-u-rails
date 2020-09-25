class IntakeForm < ActiveRecord::Base
  belongs_to :user

  MARITAL_STATUS = [
    "Single",
    "Common Law",
    "Married",
    "Divorced",
    "Widowed"
  ].freeze

  EDUCATION = [
    "High School",
    "College",
    "University",
    "Post Graduate",
    "Other"
  ].freeze

  ETHNICITY = [
  	 "",
    "White",
    "Native Canadian",
    "Black",
    "Asian",
    "Other"	 	
  ].freeze

  HOW = [
    "Rehabilitation Sciences (U of T)",
    "SCI-Ontario",
    "SCI-BC",
    "Rick Hansen Institute",
    "Word Of Mouth",    
    "Other"         
  ].freeze
  
  SEX = [
    "Male",
    "Female"
  ].freeze  

 GENDER = [
    "",
    "Male",
    "Female",
    "Non-binary/Third Gender",
    "Prefer to Self-Describe",
    "Prefer Not to Say"         
  ].freeze
  
  INJURY_DESCRIPTION = [
  	 "",
    "No feeling or movement below the level of my injury.",
    "Feeling all the way down to my rectum/bum but no use of my muscles.",
    "Limited movement or muscle contractions below level of my injury, but these serve no useful function.",
    "Function, but not necessarily full use of at least half of the muscle groups below the level of my injury.",
    "Feeling and movement is normal below level of my injury."
  ].freeze  

  MOBILITY_METHOD = [
  	 "",
    "Manual wheelchair",
    "Power wheelchair",
    "Walker",
    "Braces",
    "Cane",
    "I Walk Independently"    
  ].freeze  

  PROVINCE = [    
    "Ontario",
    "Quebec",
    "Alberta",
    "British Columbia",
    "Saskatchewan",
    "Manitoba",    
    "Newfoundland and Labrador",
    "New Brunswick",
    "Nova Scotia",    
    "Northwest Territories",  	
    "Nunavut",
    "Yukon",
    "Prince Edward Island"   
  ].freeze  

  INJURY_LEVEL = [
    "",
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
  
end
