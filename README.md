# PitchDay
This is the companion app for the Novus Club web portal. It allows judges to sign into the application, view student submissions, and assign both comments and scores as they are reviewing student submissions.

## ⚠️ Warnings ⚠️
This app has not been fully built and currently has the following issues:
- User registration <i>always</i> sends a failure alert, whether or not it has been successful
- Access to student entires is given to anyone with an account, should be based on access-level (e.g. admin, educator)
- Scoring screends have not been implemented

## Text Validation 🔎

Email Match | Email Regex | Password Match | Password Regex
:--:|:--:|:--:|:--:
<img src="/Demo/emailMatch.png" width="122.22" height="252.63"/> | <img src="/Demo/emailRegex.png" width="122.22" height="252.63"/> | <img src="/Demo/passwordMatch.png" width="122.22" height="252.63"/> | <img src="/Demo/passwordRegex.png" width="122.22" height="252.63"/>

## Firebase Authentication 📡

Password Reset | Email Sign-in
:--:|:--:
<img src="/Demo/resetPassword.gif" width="183.33" height="378.945"/> | <img src="/Demo/signin.gif" width="183.33" height="378.945"/>