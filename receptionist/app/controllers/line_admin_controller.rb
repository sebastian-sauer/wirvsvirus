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
    # to be done: check if free appointments are available for today.
    @freeAppointmentsAvailable = true

    @appointmentsScheduled = Appointment.where(datetime: dt.all_day).where.not(status: "to-be-triaged").order(:datetime)
    
    # only if there are no free appointments search for appointments to be triaged.
    # otherwise just use an empty list
    if @freeAppointmentsAvailable
      @appointmentsWaitingList = []
    else 
      @appointmentsWaitingList = Appointment.where(datetime: dt.all_day).where(status: "to-be-triaged").order(:datetime)
    end
  end

  # Apply a new sort to our entries in our frontend
  def sort
    puts params.inspect
    puts params[:list].inspect
    puts "FLAVOR FLAVS"


  end
end
