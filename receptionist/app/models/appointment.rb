class Appointment < ApplicationRecord
  belongs_to :patient
  def estimatedWaitingTime
    appointments = Appointment.where(datetime: self.datetime.all_day).where(sortOrder: 0..self.sortOrder).where.not(status: "done").order(:sortOrder)
    return appointments.length() * 30
  end

  def as_json(options = { })
    super((options || { }).merge({
      :methods => [:estimatedWaitingTime]
    }))
  end
end
