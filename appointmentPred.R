namesandinfo <- read.csv('/home/iamawesome/Downloads/Names.csv')
patientdetails <- read.csv('/home/iamawesome/Downloads/Patients.csv')

colnames(patientdetails) <- c('Timestamp', 'Names', 'Age', 'Gender', 'Alcoholism', 'Hipertension', 'Diabetes', 'Handcap', 'Scholarship', 'SMS_received')
colnames(namesandinfo) <- c('Names', 'schDay', 'callHour', 'appDay', 'Lag')
patientdetails$Timestamp <- NULL
patientdetails$Names <- toupper(patientdetails$Names)
namesandinfo$Names  <- toupper(namesandinfo$Names)
result <- merge(namesandinfo, patientdetails, by= 'Names')

result$Age <- result$Age/100
result$Gender <- as.numeric(result$Gender) - 1
#table(result$Gender)
result$Alcoholism <- as.numeric(result$Alcoholism) - 1
#table(result$Alcoholism)
result$Hipertension <- as.numeric(result$Hipertension) - 1 
result$Diabetes <- as.numeric(result$Diabetes) - 1
result$Handcap <- as.numeric(result$Handcap) - 1
#table(result$Handcap)
result$Scholarship <- as.numeric(result$Scholarship) - 1
result$SMS_received <- as.numeric(result$SMS_received) - 1
result$callHour <- result$callHour/100
result$schDay <- result$schDay/10
result$appDay <- result$appDay/10
#table(result$appDay)


for (i in 1:nrow(result)){
  if(result[i, 'Gender']!= 0 & result[i, 'Gender']!= 1){
    a= runif(1)
    if(a<= 0.5){
      result[i, 'Gender']= 0
    }else{
      result[i, 'Gender']= 1
    }
  }
}

#load the model
load('model3.rda')
modelpred <- predict(M3, result)
result$Prediction <- modelpred
write.csv(result, 'Results.csv')
