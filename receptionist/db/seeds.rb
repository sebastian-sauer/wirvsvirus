# Generate 25 patients

time = DateTime.strptime("21.03.2020 7:30", "%d.%m.%Y %H:%M")

for i in 1..5 do
  time = time + 30.minutes

  p = Patient.create(:name => "Horst " + i.to_s, :birthday => DateTime.strptime("09/" + i.to_s + "/2009 8:00", "%m/%d/%Y %H:%M"), :timeToDoc => i * 2, :phone => "015111111" + i.to_s, :email => "horst" + i.to_s + "@gmail.com")

  p.appointments.create(:datetime => time, :status => "new", :classification => "corona-verdacht", :remarks => "Test " + i.to_s)


end