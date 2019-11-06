module ApplicationHelper
  def is_event_admin?(admin)
    current_user.id == admin.id
  end
end
