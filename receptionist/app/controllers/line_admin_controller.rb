class LineAdminController < ApplicationController
  def index
    @appointments = Appointment.all

  end
end
