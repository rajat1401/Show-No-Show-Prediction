# Show-No-Show-Prediction
A machine learning model that predicts whether a given patient is likely to show up at an appointment or not in-order to help save a wastage of a lot of time and resources. 

Variables used: Age, Gender, Alcoholism, Diabetes, Hypertension, Hour of the call, Day of scheduling the appointment, Day of the appointment, Lag between schDay and appDay, Handicap, and economic status of the person.

Prediction is the output variable. If it says "No", means person will show up and if it says "Yes" means the person is less likely to show up.

The csv file Names.csv must be made by the receptionist containing the Names of the patients and the day call was made(schDay) the call Hour, the appointment day(appDay) and Lag (appDay - schDay). 

The file by the name  "Patients.csv" is made by Patients themselves by filling out the forms contains all the other needed variable and info to make the predicitons. Also, I believe that before the appointment, such info can be very useful to the doctor for the diagnosis. eg: You may want to know if the person is Diabetic or has Hypertension before using a certain therapy on the patient. 
