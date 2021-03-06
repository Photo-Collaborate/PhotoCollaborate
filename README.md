
# Photo Collaborate

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
The users can upload photos to an album thats shared with selected contacts who can also upload photos of thier choosing. Any uploaded photos can be dowloaded by the added users.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:Photo App**
- **Mobile:Only iPhone mobile app**
- **Story:Allows users to upload their photos to a collaborative album where photos can be viewed/downloaded/uploaded by friends of thier choosing**
- **Market: Anyone who takes pictures at a group event. In addition, anyone who wasnt at the even but still wants to see/download the photos**
- **Habit: Anytime theres a group event where photots are being taken on multiple iPhones.**
- **Scope:**

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Login/Register 
* Contacts/Friends
* Access photos
* Upload/Download
* The photo album
* Search Users
* Album names

**Optional Nice-to-have Stories**

* Profile photos
* Activity log 
* Request to be added
* Comments

### 2. Screen Archetypes

* [Login/Signup]
   * [Register or Login]
   * ...
* [Stream]
   * [Display albums your in and hosting]
   * ...

* [Detail]
   * [All uploaded photos are shown]

* [Creation]
   * [You can create a new album to upload photos and add friends]

* [Profile]
   * [User can see/add their friends and maybe change thier profile picture ]

* [Setting]
   * [Authetication, notifications, account settings, privacy, payments]



### 3. Navigation

**Tab Navigation** (Tab to Screen)

* [Album/Home]
* [Profile]
* [Friends]

**Flow Navigation** (Screen to Screen)

* [Login/signUp]
   * [HomeScreen where albums are listed]

* [Homescreen]
   * [Open albums to show images and collaborators]
   * [Upload/Download images remove your uploaded photos]

* [Profile]
   * [Change profile photo ]
* [Friends]
   * [Add/remove friends]
## Wireframes
[Add picture of your hand sketched wireframes in this section]
<a href="https://ibb.co/x1NhY96"><img src="https://i.ibb.co/D9Z4YcQ/Capture1.png" alt="Capture1" border="0"></a>

### [BONUS] Digital Wireframes & Mockups
https://www.figma.com/file/DRKfSh8yHzcGpa7zPYoZG9/Photo-Collaborate?node-id=0%3A1

### [BONUS] Interactive Prototype

## Schema 

### Models

## Photo
| Property   |   Type          |   Description               |
|-----------|------------------|----------------------------|
|photoID    | String          | Unique id for the user post|
| author     | Pointer to user | Uploaded photo author|
|image      | File            | image in the album|
| uploadedAt | DateTime        | Date when photo was uploaded|
| takenOn    | DateTime        | Date when photo was taken|


## Album
| Property   |   Type          |   Description               |
|------------|-----------------|-----------------------------|
|albumID    | String          | Unique id for the album|
| author     | Pointer to user | Uploaded album author|
| members      | Pointer to Users            | users that belong to album|
|photos    |  List  | List of photo IDS that belong to album|
| createdAt | DateTime        | Date when album was created|
| updatedAt    | DateTime        | Date when album was updated|

## User
| Property   |   Type          |   Description               |
| -----------|-----------------|-----------------------------|
| userID    | String          | Unique id for the user|
| createdAt     | DateTime | Date of when user was created|
| profileImage      | File            | Profile image of user|
| username | String        | Username|
| email    | String        | Users email|
| password  | String    | Hashed users password|


### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://g.recordit.co/0Rzw2HJsFX.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

