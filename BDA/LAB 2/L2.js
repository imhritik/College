use Company
db.createCollection("Employee")
db.createCollection("Department")
show collections
db.Employee.insert({_id: 1,name: "Hritik", age: 25, salary: 120000, position: "CEO"})
db.Employee.update({_id: 2,name: "Saransh", age: 26, salary: 580000},{$set:{position: "CFO"}},{upsert:true})
db.Employee.save({_id: 3,name: "Rahul", age: 30, salary: 500000, position: "Junior Associate"})
db.Employee.find()
db.Department.insert({_id:1,Name:"IT",NoOfEmp:200,HOD:"Parth"})
db.Department.update({_id:2,Name:"HR",NoOfEmp:100},{$set:{HOD:"Jatin"}},{upsert:true})
db.Department.save({_id:3,Name:"Customer Division",NoOfEmp:300,HOD:"Akashdeep"})
db.Department.find()

db.Employee.update({_id: 1},{$set:{department: 1002}})
db.Employee.update({_id: 2},{$set:{department: 1003}})
db.Employee.update({_id: 3},{$set:{department: 1008}})
db.Employee.find()
db.Employee.update({_id: 2},{$unset:{age: 26}})

db.Employee.find({name:/^A/}).pretty()

db.Employee.find({department: {$gt : 1000, $lt : 1006}}).pretty() 

db.Employee.find({age : {$gt : 30}}).pretty()