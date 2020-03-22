class Appointment < ApplicationRecord
  belongs_to :patient

  enum appointmentstatus: [ :newappointment, :inwaitingroom, :intreatment, :done ]
  enum classification: [ :covid19, :covid19suspect, :riskoflife, :standard ]

  def estimatedWaitingTime
    appointments = Appointment.where(datetime: self.datetime.all_day).where(sortOrder: 0..self.sortOrder).where.not(appointmentstatus: :done).order(:sortOrder)
    waitingTime = 0
    appointments.each { |a| waitingTime+=a.estimatedTimeForTreatment }

    return waitingTime
  end

  # Calculates the estimated time for this treatment
  def estimatedTimeForTreatment
    if self.covid19?
      return 10
    elsif self.standard?
      return 10
    elsif self.covid19suspect?
      return 30
    elsif self.riskoflife?
      return 10
    else
      # any unknown classification?
      return 45
    end
  end


  def as_json(options = { })
    super((options || { }).merge({
      :methods => [:estimatedWaitingTime]
    }))
  end
end
