require 'faker'

# Create 3 fake incidents
3.times do
  Incident.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    severity: ['sev0', 'sev1', 'sev2'].sample,
    creator: Faker::Name.name
  )
end
