module ApplicationHelper
  def task_status_badge(status)
    case status
    when 'pendiente' then 'warning'
    when 'en_progreso' then 'info'
    when 'completado' then 'success'
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

  def spanish_priority_label(priority)
    case priority
    when 'high' then 'Alta'
    when 'medium' then 'Media'
    when 'low' then 'Baja'
    else priority.to_s
    end
  end
end