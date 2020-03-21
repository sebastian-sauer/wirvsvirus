class Appointment < ApplicationRecord
  belongs_to :patient

  def estimatedWaitingTime
    return 200
  end

end
