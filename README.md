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


# Robin's Opun Challenge

## Summary

This was a challenging yet exciting project to work on.  Basically every page was re-designed and built.  This part of the ReadMe will explain all the changes and additions.

## SignIn Page

This page was added to the app because of the task involving Cloud Firestore.  The task was to make the save button, on the settings page, functional in that the name of the business would not only<br>
populate on the home page, but would also be saved to Cloud Firestore.  Such a feature did not sound like something that every user could share.  Therefore it was decided that all data,<br>
pertaining to the business, should be specific its user.  

## Welcome Page

The task here was to design this page.  The idea behind this business was to put out the message of social distancing.  Therefore, the message had to be conveyed through the image that was so clear,<br>
no words were needed.  Pictures of small amounts of people, walking through a building, was considered but then you will wonder, what exactly is the message here?  But an image of a crowded area,<br>
where everyone is wearing a mask, would definitely bring the idea of, or rather the need for social distancing to mind.  

## Settings Page

This page started out with a simple form with two spaces for the user's name for the business and its maximum capacity along with a back button and a save button.  The back button was done away with and <br>
an app bar was added as it came with its own back button.  The form was redone so that it matched the SignIn page complete with validation and OnSave features.  The save button was given a submit functionality.<br>
Once the button is pressed, the name of the business will appear on the home page and the data will be saved to Cloud Firestore.

**Important Note**<br>
If this is a new account, nothing will appear on the home page except the app bar.  Once the data is entered in the settings page, all of the UI will populate on the homepage.  

## MyHomePage and Issues to be Solved

This page was a challenge to build and is still a work in progress.  The database was completed and attached to this page via the Provider Package.  Unfortunately, this caused quite a few bugs to surface. <br>
Now, when you press the 'continue' button on the welcome page, this will take you to a red screen with the error message "Cannot access provider package."  A **temporary fix** for this is a hot restart and then <br>
the home page will appear.  The logout button will take you back to the signIn page but the page will have a back button on the app bar.  Pressing the back button will give you the actual signIn page<br>
<br>
The NumberWheel widgets were replaced with the wheel from flutter_spinning_wheel package.  The size of the wheel image now needs to be adjusted in order to make room for the other wheel.  The start button and <br>
and the reader needs to be moved outside of the container and placed where the capacity counter is located.  Another issue, to solve, is the position of the arrow on the wheel.  The number read from the wheel<br>
doesn't match what the arrow is pointing to.  The color animation also needs to be implemented.  If time allows, the approach to this will be to add a ternary statement for the background color of the <br>
container.  The statement will say that if the capacity is less than or equal to the max capacity, then apply _greenColorAnimation, else: apply _redColorAnimation.  These color animations will be wrapped in an opacity animation
with the animation controller set to repeat to give it a blinking effect. This addition can only be implemented once a solution is found to fix the bugs pertaining to the spinning wheel.































