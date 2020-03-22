# Generate 25 patients

time = DateTime.strptime("21.03.2020 7:30", "%d.%m.%Y %H:%M")
time = DateTime.current()
time.change({ hour: 7, min: 30, sec: 0 })
order = 0

classifications = [Appointment.classifications[:covid19suspect], Appointment.classifications[:covid19], Appointment.classifications[:riskoflife], Appointment.classifications[:standard]]

p = Patient.create(:name => "DER WAR SCHON DRAN ", :birthday => DateTime.strptime("09/21/2009 8:00", "%m/%d/%Y %H:%M"), :timeToDoc => 5, :phone => "015111111", :email => "horsti"+ "@gmail.com")
p.appointments.create(:sortOrder => order, :datetime => time, :appointmentstatus => Appointment.appointmentstatuses[:done], :classification => Appointment.classifications[:covid19], :remarks => "Test schon dran")

for i in 1..20 do
  time = time + 30.minutes
  order += 1

  p = Patient.create(:name => "Horst " + i.to_s, :birthday => DateTime.strptime("09/" + i.to_s + "/2009 8:00", "%m/%d/%Y %H:%M"), :timeToDoc => i * 2, :phone => "015111111" + i.to_s, :email => "horst" + i.to_s + "@gmail.com")

  p.appointments.create(:sortOrder => order, :datetime => time, :appointmentstatus => Appointment.appointmentstatuses[:newappointment], :classification => classifications.at(i % 4), :remarks => "Test " + i.to_s)
end