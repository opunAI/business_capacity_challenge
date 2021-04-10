# opun_challenge

This exercise is to create is a capacity counter a business might use to keep track of the number of people currently in their store.
<br><br>

The starting project has three screens: 
<br><br>

(1) a welcome screen
<br>
(2) a home screen with the capacity counter and animation
<br>
(3) a settings screen

<br><br>

To complete the project:
<br><br>

(1) Come up with a design for the welcome screen and implement it
<br>

(2) Make the capacity counter animation represent the count of the business by animating the rotation of the number wheels. The first wheel represents the 10's digit and the second wheel represents the 1's digit. 
<br>

(3) Save the app's settings for business name and maximum capacity in firestore
<br>

(4) Set or animate the color on the home screen to red if maximum capacity is reached
<br>

(5) Capacity should not be able to go below zero or above the maximum capacity specified in the settings
<br>

(6) Show business name in the welcome screen and in the home screen if it has been saved
<br><br>

Good to keep in mind:

<br><br>

You can ask questions if you get stuck or want more clarification.
<br>

Feel free to re-factor, add to, or improve on the app any way you see fit. 
<br>

You can use any libraries you can find in pub.dev or anywhere else.

<br>
You have been added to the Opun-Exercise firebase project. In the console's 'Project Overview' page, create a new app and follow the documentation / instructions to connect 
the flutter project to firestore (https://firebase.google.com/docs/flutter/setup). Save the business name, maximum capacity, and current count in firestore. Try to stream these values so that the UI is updated in real time if they change. 
<br>
