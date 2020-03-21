class LineAdminController < ApplicationController
  def index
    date = params["date"]
    puts date

    if date.present?
      dt = Date.strptime(date, "%Y%m%d")
    else
      dt = DateTime.current()
    end

    @date = dt.strftime("%Y-%m-%d")
    @nextday = dt.next_day.strftime("%Y%m%d")
    @previousday = dt.prev_day.strftime("%Y%m%d")
    
    @appointments = Appointment.where(datetime: dt.all_day).order(:datetime)
  end
end
