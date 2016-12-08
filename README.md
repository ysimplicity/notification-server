About
=====

This application was made to work with [Firebase Cloud Messaging for Web](https://firebase.google.com/docs/cloud-messaging/js/client).

**The main idea is:** Store your app users, [subscribe](https://firebase.google.com/docs/cloud-messaging/send-message#send_messages_to_topics) them to your topics, create Push Notification campaigns and send messages to your desired audience.

Another critical reason to create this project is: Unfortunately the [Firebase Notifications](https://firebase.google.com/docs/notifications/?hl=en) doesn't work with the Web platform.

What do you need to store an user?
----------------------------------

Send a post to the `/api/users` resource. e.g:
```sh
curl -X POST -H 'Content-Type: application/json' -d '{
  "user": {
    "uid": "SOME-USER-UID",
    "email": "someuser@email.com",
    "token": "SOME-USER-FCM-TOKEN"
  }
}' http://localhost:3000/api/users
```

**NOTE:** [Here](https://github.com/YSimplicity/try-turbolinks/blob/master/public/js/firebase-config.js#L41-L46), you can see a JS implementation.

What do you need to send a Push Notification/Message?
-----------------------------------------------------

Making a curl call like this:
```sh
curl -X POST -H "Authorization: key=YOUR-SERVER-KEY" -H "Content-Type: application/json" -d '{
  "notification": {
    "title": "Hello",
    "body": "World",
    "icon": "/an-image-from-your-app-receiver.png",
    "click_action": "https://your-app-receiver-host.com"
    },
    "to": "/topics/your-topic"
}' "https://fcm.googleapis.com/fcm/send"
```

**Notes:**

1. You can retrieve YOUR-SERVER-KEY using this [link](https://console.firebase.google.com/project/_/settings/cloudmessaging) and selecting your desired project.

2. the `to`param can receive an [user/device token](https://firebase.google.com/docs/cloud-messaging/send-message#send_messages_to_topics).

Or you can use this project! \o/

![image](https://github.com/YSimplicity/notification-server/blob/master/doc/images/campaigns.png)

Configuration:
--------------
* Ruby version: `2.3.2`
* Rails version: `5.0.0.1`
```
  # Create a Firebase app
  https://firebase.google.com/docs/web/setup

  # Create a `.env` file and set up your firebase app configurations.
  cp sample.env .env
```

Deployment instructions (Heroku):
---------------------------------
  0.  [Create](https://firebase.google.com/docs/web/setup) a Firebase App

  1. Clone this repo and create a Heroku app to it.
    1. `git clone https://github.com/YSimplicity/notification-server.git`
    2. `cd notification-server`
    3. `heroku create`

  2. Set all environment variables.
    
    `heroku config:set APPLICATION_CORS_ORIGINS='*' APPLICATION_AUTH_NAME='admin' APPLICATION_AUTH_PASSWORD='admin' WEB_APP_RECEIVER_HOST='http://localhost:5000' WEB_APP_RECEIVER_DEFAULT_ICON_PATH='/images/ysimplicity-logo-white-bg-black.png'  FIREBASE_SERVER_KEY='YOU-FIREBASE-SERVER-KEY' DEFAULT_TOPIC_SUBSCRIPTION='your-brand_or_general-topic'`

  3. Deploy to heroku:
  `git push heroku master`

  4. Open the application URL.
    You can see it using the command: `heroku info`
