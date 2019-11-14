Employee.find_or_create_by({ name: "sin asignar"})

20.times do
  Employee.find_or_create_by({ name: Faker::Superhero.name})
end
