class Task < ApplicationRecord
  belongs_to :user

  # ENUMS CORREGIDOS - nueva sintaxis
  enum :status, { pending: 0, in_progress: 1, completed: 2 }
  enum :priority, { low: 0, medium: 1, high: 2 }

  validates :title, presence: true
  validates :due_date, presence: true

  # Scopes para consultas comunes
  scope :overdue, -> { where('due_date < ? AND status != ?', Time.current, 2) }
  scope :due_today, -> { where(due_date: Time.current.all_day) }
  scope :by_priority, -> { order(priority: :desc) }

  # Método de instancia
  def overdue?
    due_date < Time.current && status != 'completed'
  end
end