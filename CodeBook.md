# Code book


## Variable list and descriptions
Variable name    | Description
-----------------|------------
subject          | ID for each window sample. Range is from 1 to 30.
activity         | Activity name. Each row indicate the unique activity name
|* WALKING
|* WALKING_UPSTAIRS
|* WALKING_DOWNSTAIRS
|* SITTING
|* STANDING
|* LAYING
------------------------------
featDomain       | Feature: Time domain signal or frequency domain signal (Time or Freq)
featInstrument   | Feature: Measuring instrument (Accelerometer or Gyroscope)
featAcceleration | Feature: Acceleration signal (Body or Gravity)
featVariable     | Feature: Variable (Mean or SD)
featJerk         | Feature: Jerk signal
featMagnitude    | Feature: Magnitude of the signals calculated using the Euclidean norm
featAxis         | Feature: 3-axial signals in the X, Y and Z directions (X, Y, or Z)
featCount        | Feature: Count of data points used to compute `average`
featAverage      | Feature: Average of each variable for each activity and each subject

## subject:
  Each row identifies the subject who performed the activity for each window sample.
  Its range if frome 1 to 30

## acitvity:
  Each row indicate the unique activity name.
  the concrete activity names:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING
  
> timeBodyAccMean-X

> timeBodyAccMean-Y

> timeBodyAccMean-Z

> timeBodyAccStd-X

> timeBodyAccStd-Y

> timeBodyAccStd-Z

> timeGravityAccMean-X

> timeGravityAccMean-Y

> timeGravityAccMean-Z

> timeBodyAccJerkMean-X
> timeBodyAccJerkMean-Y
> timeBodyAccJerkMean-Z
> timeBodyAccJerkStd-X
> timeBodyAccJerkStd-Y
> timeBodyAccJerkStd-Z
> timeBodyGyroMean-X
> timeBodyGyroMean-Y
> timeBodyGyroMean-Z
> timeBodyGyroStd-X
> timeBodyGyroStd-Y
> timeBodyGyroStd-Z
> timeBodyGyroJerkMean-X
> timeBodyGyroJerkMean-Y
> timeBodyGyroJerkMean-Z
> timeBodyGyroStd-X
> timeBodyGyroStd-Y
> timeBodyGyroStd-Z
> timeBodyGyroJerkMean-X
> timeBodyGyroJerkMean-Y
> timeBodyGyroJerkMean-Z
> timeBodyGyroJerkStd-X
> timeBodyGyroJerkStd-Y
> timeBodyGyroJerkStd-Z
> timeBodyAccMagMean
> timeBodyAccMagStd
> timeGravityAccMagMean
> timeGravityAccMagStd
> timeBodyAccJerkMagMean
> timeBodyAccJerkMagStd
> timeBodyGyroMagMean
> timeBodyGyroMagStd
> timeBodyGyroJerkMagMean
> timeBodyGyroJerkMagStd
> frequenceBodyAccMean-X
> frequenceBodyAccMean-Y
> frequenceBodyAccMean-Z
> frequenceBodyAccStd-X
> frequenceBodyAccStd-Y
> frequenceBodyAccStd-Z
> frequenceBodyAccJerkMean-X
> frequenceBodyAccJerkMean-Y
> frequenceBodyAccJerkMean-Z
> frequenceBodyAccJerkStd-X
> frequenceBodyAccJerkStd-Y
> frequenceBodyAccJerkStd-Z
> frequenceBodyGyroMean-X
> frequenceBodyGyroMean-Y
> frequenceBodyGyroMean-Z
> frequenceBodyGyroStd-X
> frequenceBodyGyroStd-Y
> frequenceBodyGyroStd-Z
> frequenceBodyAccMagMean
> frequenceBodyAccMagStd
> frequenceBodyBodyAccJerkMagMean
> frequenceBodyBodyAccJerkMagStd
> frequenceBodyBodyGyroMagMean
> frequenceBodyBodyGyroMagStd
> frequenceBodyBodyGyroJerkMagMean
> frequenceBodyBodyGyroJerkMagStd


