module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = 'Forum'
    if page_title.empty?
      base_title
    else
      base_title + ' | ' + page_title
    end
  end

  def check_role?(roles)
    if user_signed_in?
      roles.each do |role|
        return true if current_user.has_role? role
      end
    end
    false
  end

end
