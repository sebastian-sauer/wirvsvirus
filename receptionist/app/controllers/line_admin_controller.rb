class LineAdminController < ApplicationController
  def index
    @appointments = Appointment.all
    @patients = Patient.all

    dt = DateTime.strptime("02.03.2020 8:00", "%d.%m.%Y %H:%M")
    @times = Appointment.where(datetime: dt.all_day)
  end
end
