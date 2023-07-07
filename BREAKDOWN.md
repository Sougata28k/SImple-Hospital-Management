# Simple-Hospital-Management-System
Simple Hospital Management System using jsp
there is a home page where it includes a 'add patient' and ' view patient' options. To create this I used the homePage.html folder where I add HTML code and to style this page I created a css file named homePageCss.
after clicking to the add patient option it will redirect to a page where there are multiple parameters to add named 'Name', 'Age' and 'Contact'. 
to add this html page I used a anchor tag to the homePage.html file so that after clicking on that add patient it will show the addPatient.html page where patient name age and contact will be fetched. 
I used a javascript for not allowing to empty the parameters such as nam age and contact I used validate.js file for this. If anyone try to submit the form without giving any values it will alert on that page.
to fetch the data I used jsp file. I connect the addPatient.html file to the JSP page to fetch the patient details and named the file 'NewFile. jpg.
I connect the jsp page to the database with the help pf JDBC to store the value which I get from the NewFile.jsp. In mysql I had to create a table consisting name age and contact and id which auto increaments.
Now i have to fetch the data from my database and show in the view patient page. to get that I create another jsp file named viewPatient.jsp where I fetched the data from MySQL and showing in this page. the data are shown in tabular format for that I used HTML and css also added a delete function with js which is included in the viewPatient.jsp file itself to delete the table data.
to delete the data permanently from the table I created another jsp file named delete.jsp where I have written the mysql query and also create a database connection.
