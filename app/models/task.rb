class Task < ApplicationRecord
  belongs_to :user

  # ENUMS CORREGIDOS - nueva sintaxis
  # Status values should match the form values exactly
  enum :status, { 'pendiente' => 0, 'en_progreso' => 1, 'completado' => 2 }
  # Using string values to match form values
  enum :priority, { 'baja' => 0, 'media' => 1, 'alta' => 2 }

  validates :title, presence: true
  validates :due_date, presence: true

  # Scopes para consultas comunes
  scope :overdue, -> { where('due_date < ? AND status != ?', Time.current, 2) }
  scope :due_today, -> { where(due_date: Time.current.all_day) }
  scope :by_priority, -> { order(priority: :desc) }

  # Métodos de instancia
  def overdue?
    due_date < Time.current && status != 'completado'
  end
  
  def completed?
    status == 'completado'
  end
end