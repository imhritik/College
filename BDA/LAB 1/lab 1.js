use myDB
db.createCollection("Student");
db.createCollection("Faculty");
db.createCollection("COE");
db.createCollection("Library"); 
db.createCollection("Admission");
db.createCollection("CollegeFestival");
db.COE.insert({id:"1",Name:"GuruPrasad",Phone:"9191",Address:"Address1",Salary:"80000",DOB:"02/02/75"});
db.COE.insert({id:"1",Name:"Hammu",Phone:"9601",Address:"Address2",Salary:"82000",DOB:"12/12/70"});
db.COE.insert({id:"1",Name:"Taimur",Phone:"9821",Address:"Address3",Salary:"80000",DOB:"20/08/66"});
db.COE.insert({id:"1",Name:"Laxmi",Phone:"8601",Address:"Address4",Salary:"75000",DOB:"01/02/76"});
db.Library.insert({id:"1",Name:"Priya",Phone:"9190",Address:"Address5",Salary:"60000",DOB:"15/08/77"});
db.Library.insert({id:"2",Name:"Ram",Phone:"8901",Address:"Address6",Salary:"61000",DOB:"25/02/70"});
db.Library.insert({id:"3",Name:"Anthony",Phone:"9912",Address:"Address6",Salary:"65000",DOB:"15/06/71"});
db.Library.insert({id:"4",Name:"Jesus",Phone:"9201",Address:"Address6",Salary:"60000",DOB:"25/08/80"});
db.Admission.insert({id:1,Student_Name: "Jatin Gandhi",USN:"1BM17CS032",Gender:"Male",Age:20,Dept:"CSE"})
db.Admission.insert({id:2,Student_Name: "Hritik Shankar",USN:"1BM17CS031",Gender:"Male",Age:20,Dept:"CSE"})
db.Admission.insert({id:3,Student_Name: "Aditya Kumar",USN:"1BM17CS010",Gender:"Male",Age:20,Dept:"CSE"})
db.Admission.insert({id:4,Student_Name: "Aakashdeep Sil",USN:"1BM17CS001",Gender:"Male",Age:20,Dept:"CSE"})
db.CollegeFestival.insert({id:56001,Event_Name: "Code Jam",Entry_Fee:50,Date:"16-10-2020",Prize_Money:1000,Contact:"9097861234"})
db.CollegeFestival.insert({id:56002,Event_Name: "Tresure Hunt",Entry_Fee:150,Date:"16-10-2020",Prize_Money:2000,Contact:"9097861232"})
db.CollegeFestival.insert({id:56003,Event_Name: "Hackathon",Entry_Fee:100,Date:"17-10-2020",Prize_Money:1500,Contact:"9097861287"})
db.CollegeFestival.insert({id:56004,Event_Name: "Mock Interview",Entry_Fee:50,Date:"17-10-2020",Prize_Money:1200,Contact:"9097861298"})
db.Faculty.insert({Name:"Pallavi", Department:"CSE", Position:"Professor", Subject:"BDA"})
db.Faculty.insert({Name:"Nandini", Department:"CSE", Position:"Professor", Subject:"MMC"})
db.Faculty.insert({Name:"Umadevi", Department:"CSE", Position:"Professor", Subject:"COA"})
db.Faculty.insert({Name:"Vikrant", Department:"CSE", Position:"Professor", Subject:"DSR"})
db.Student.insert({USN:"1BM17CS010", Name:"Aditya", Dept:"CSE", Email:"aditya@bmsce.ac.in", Mobile:"9988778899", Hobbies:"Chess"})
db.Student.insert({USN:"1BM17CS031", Name:"Hritik", Dept:"CSE", Email:"hritik@bmsce.ac.in", Mobile:"9988778899", Hobbies:"Among US"})
db.Student.insert({USN:"1BM17CS032", Name:"Jatin", Dept:"CSE", Email:"jatin@bmsce.ac.in", Mobile:"9988778899", Hobbies:"IPL"})
db.Student.insert({USN:"1BM17CS001", Name:"Aakash", Dept:"CSE", Email:"aakash@bmsce.ac.in", Mobile:"9988778899", Hobbies:"CSGO"})