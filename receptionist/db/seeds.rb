# Generate 25 patients
for i in 1..5 do
  p = Patient.create(:name => "Horst " + i.to_s, :birthday => DateTime.strptime("09/" + i.to_s + "/2009 8:00", "%m/%d/%Y %H:%M"), :timeToDoc => i * 2, :phone => "015111111" + i.to_s, :email => "horst" + i.to_s + "@gmail.com")
  # rails generate model Appointment  datetime:datetime status:string classification:string remarks:text
  for j in 1..3 do
    p.appointments.create(:datetime => DateTime.strptime("03/23/2020 8:0" + j.to_s, "%m/%d/%Y %H:%M"), :status => "new", :classification => "corona-verdacht", :remarks => "Test " + j.to_s)
  end
end