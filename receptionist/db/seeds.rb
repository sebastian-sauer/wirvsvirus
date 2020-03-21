# Generate 50 patients
for i in 1..25 do
    puts i
    Patient.create( :birthday => DateTime.strptime("09/"+i.to_s+"/2009 8:00", "%m/%d/%Y %H:%M"), :timeToDoc => i * 2, :phone => "015111111" + i.to_s, :email => "horst" + i.to_s + "@gmail.com")
end