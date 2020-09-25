# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)
badge_id = 0
[{
  id: (badge_id = badge_id+1),
  name: 'resilience',
  description: "You've demonstrated that you won't let setbacks take away your mojo.  That's why you've earned the resilience badge.",
  custom_fields: { image: '/images/badges/resilience.png' }
}, {
  id: (badge_id = badge_id+1),
  name: 'mood',
  description: "You've demonstrated that you are cool as a cucumber, even under pressure.  That's why you've earned the mood badge.",
  custom_fields: { image: '/images/badges/mood.png' }
}, {
  id: (badge_id = badge_id+1),
  name: 'puzzle',
  description: "You've downloaded the SCI&U app and proved you're a braniac.  That's why you've earned the puzzle badge.",
  custom_fields: { image: '/images/badges/puzzle.png' }
}, {
  id: (badge_id = badge_id+1),
  name: 'attendance',
  description: "You've proven your commitment to the program and your coach by coming to sessions.  That's why you've earned the attendance badge.",
  custom_fields: { image: '/images/badges/puzzle.png' }
}].each do |attrs|
  Merit::Badge.create! attrs
end
