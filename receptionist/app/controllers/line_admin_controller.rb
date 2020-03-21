class LineAdminController < ApplicationController
  def index
    @appointments = Appointment.all
    @patients = Patient.all
  end
end
