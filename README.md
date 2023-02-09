# Student Manager

## Web Interface for Taeguek Taekwondo

This is a web interface that was developed with Flutter that works along with the Attendance app. What this app does is
that is reads the data that the Attendance app sends. This app and the Attendance app work together. As the Attendance
app collects data and sends it to Firestore, this app fetches the data and displays it for the user. This app is setup
using Firebase authentication, state management using Riverpod with the MVVM design pattern and stream builders to display 
the data from Firestore.

Below are some screenshots of the app




The user is presented with a login screen. This is where the credentials are entered and authenticates the user, taking them
to the next page.


![screenshot 1](https://user-images.githubusercontent.com/99619761/217786155-961a9661-8b19-44d2-8043-f8806b7d05cd.png)


This is the error message when a user's credentials are not valid. The error message is generated from Firestore and the 
app presents that data from Firebase to the dialog message that appears when invalid credentials are entered.


![screenshot 3](https://user-images.githubusercontent.com/99619761/217786165-fb95a2f0-7023-4cce-9c0e-055427f029c3.png)


This is how the data is presented. There is a screen for each location which is how the data is collected from the 
Attendance app. This shows the list of students and the attendance. Test data was used for this screenshot.


![screenshot 2](https://user-images.githubusercontent.com/99619761/217786947-926395e2-8bcf-4144-a47b-f97628617ea5.png)


