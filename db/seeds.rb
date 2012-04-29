# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bill = Bill.create({name: "Basic Template"})

Revision.create({
  section: Section.create({
    bill_id: bill.id,
    title: "Title 1: Problems and Grievances"
  }),
  markup: "This title should explain the current situation and the problems"
})

Revision.create({
  section: Section.create({
    bill_id: bill.id,
    title: "Title 2: Glossary of Terms"
  }),
  markup: "This title should explain the domain language/definitions"
})

Revision.create({
  section: Section.create({
    bill_id: bill.id,
    title: "Title 3: Roles, Responsibilities and Expectations"
  }),
  markup: "This title should explain the Roles, Responsibilities and Expectations of each stakeholder in the document"
})

Revision.create({
  section: Section.create({
    bill_id: bill.id,
    title: "Title 4: Guiding Principles"
  }),
  markup: "This title should explain the principles that guide this document"
})

Revision.create({
  section: Section.create({
    bill_id: bill.id,
    title: "Title 5: Solutions"
  }),
  markup: "This title should explain the solutions. Each solution traces to one or more principles to alleviate or minimize one or more problem/grievance."
})