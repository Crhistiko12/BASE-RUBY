module ApplicationHelper
  def task_status_badge(status)
    case status
    when 'pending' then 'warning'
    when 'in_progress' then 'info'
    when 'completed' then 'success'
    else 'secondary'
    end
  end

  # AGREGA ESTE MÉTODO NUEVO:
  def task_priority_badge(priority)
    case priority
    when 'high' then 'danger'
    when 'medium' then 'warning'
    when 'low' then 'secondary'
    else 'secondary'
    end
  end
end