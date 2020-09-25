module UsersHelper
  def full_name_helper(user = @user)
    "#{user.first_name} #{user.last_name}"
  end

	 def summary_line
     created_at = 'Member since #{distance_of_time_in_words_to_now(@user.created_at)}'
     last_sign_in_at = if @user.last_sign_in_at.nil?
                         ''
                       else
                         '- Last online #{distance_of_time_in_words_to_now(@user.last_sign_in_at)}'
                       end
     created_at + ' ' + last_sign_in_at
 	end
end
