class LineAdminController < ApplicationController

  def index
    date = params["date"]
    puts date

    if date.present?
      dt = DateTime.strptime(date, "%Y%m%d")
    else
      dt = DateTime.current()
    end

    if dt.today?
      @date = 'Heute, ' + dt.to_s(:ger_format)
    else
      @date = I18n.l(dt, format: :ger_with_weekday, locale: "de")
    end

    @nextday = dt.next_day.to_s(:year_month_day)
    @previousday = dt.prev_day.to_s(:year_month_day)
    # to be done: check if free appointments are available for today.
    @freeAppointmentsAvailable = true

    @appointmentsScheduled = Appointment.where(datetime: dt.all_day).where.not(appointmentstatus: :done).order(:sortOrder)
    
    # only if there are no free appointments search for appointments to be triaged.
    # otherwise just use an empty list
    if @freeAppointmentsAvailable
      @appointmentsWaitingList = []
    else 
      @appointmentsWaitingList = Appointment.where(datetime: dt.all_day).where.not(appointmentstatus: :done).where(appointmentstatus: :newappointment).order(:sortOrder)
    end
  end

  # Apply a new sort to our entries in our frontend
  def sort
    newOrderedList = params[:list].split(",").map(&:to_i)
    puts "clients new order is: " + newOrderedList.to_s
    # get all appointments for this day
    appointments = Appointment.where(id: newOrderedList)

    # and recalculate the order
    for appointment in appointments do
      appointment.sortOrder = newOrderedList.index(appointment.id)
      appointment.save
    end
    render json: appointments.sort_by(&:sortOrder)
  end

  # Create a new appointment
  def createappointment
    puts "Create appointment called"
    @appointment = Appointment.new
  end
end
