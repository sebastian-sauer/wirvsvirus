class Appointment < ApplicationRecord
  belongs_to :patient

  enum appointmentstatus: [ :newappointment, :inwaitingroom, :intreatment, :done ]
  enum classification: [ :covid19, :covid19suspect, :riskoflife, :standard ]

  def estimatedWaitingTime
    appointments = Appointment.where(datetime: self.datetime.all_day).where(sortOrder: 0..self.sortOrder).where.not(appointmentstatus: :done).order(:sortOrder)
    return appointments.length() * 30
  end

  def as_json(options = { })
    super((options || { }).merge({
      :methods => [:estimatedWaitingTime]
    }))
  end
end
