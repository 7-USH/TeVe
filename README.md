![](TeVe.png)

# 📺 **TeVe** ![license](https://img.shields.io/github/license/7-USH/Heart-Rate-Monitor)

A cross platform **IPTv player** developed for Android/IOS.

## **Screenshots**
Login | SignUp
---|---
<img src="ss/ss_1.png" style="margin-right: 20px" alt="drawing" width="200"/> | <img src="ss/ss_3.png" style="margin-right: 20px" alt="drawing" width="200"/>
<br />

Home |
---|
<img src="ss/ss_4.png" style="margin-right: 20px" alt="drawing" width="420"/> 
| <img src="ss/ss_6.png" style="margin-right: 20px" alt="drawing" width="420"/>  
<br />

Favorite's Page |
---|
<img src="ss/ss_7.png" style="margin-right: 20px" alt="drawing" width="420"/>
<br />

Channel Page |
---|
<img src="ss/ss_2.png" style="margin-right: 20px" alt="drawing" width="420"/>

## **Requirements**
- Any Operating System (i.e. MacOS X, Linux, Window)
- Any IDE with Flutter SDK installed (i.e. IntelliJ, Android Studio, VSCode etc)
- Knowledge about Dart and Flutter

## **Features**

- [x] Login
- [x] Sign Up
- [x] View Live Stream
- [x] Add to Favorites
- [x] Sort by Country

## **API Reference**

> API used : https://iptv-org.github.io

#### Get all channels

```http
  GET /iptv/channels.json
```

| Parameter | Type   | Response           |
| :-------- | :----- | :----------------- |
| `none`    | `none` | `List of Channels` |

## **Backend**

Backend was developed using fast API and Sqlite

> API used : https://web-7-ush.cloud.okteto.net

Check following repository to know more about [**Teve-Backend**](https://github.com/7-USH/Teve-Backend).

## **Credits**

- [IPTVify App Ui Design](https://dribbble.com/shots/14754204-IPTVify-App-Ui-Design)
- [IPTV Github Repository](https://github.com/iptv-org/iptv)