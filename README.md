# TaskIt Documentation

------

***TaskIt*** is a mobile application made to help students keep track of their assignments and improve on their time-management skills over time.

#### Screenshots

![Screenshot_1596163364](/home/dnov/Desktop/CS 487/study-habit-tracker/screenshots/Screenshot_1596163364.png)

![Screenshot_1596148017](/home/dnov/Desktop/CS 487/study-habit-tracker/screenshots/Screenshot_1596148017.png)

![Screenshot_1596165017](/home/dnov/Desktop/CS 487/study-habit-tracker/screenshots/Screenshot_1596165017.png)

#### Installation guide

##### Android Studio

1. Download and install Android studio from <https://developer.android.com/studio>
2. Start Android Studio, complete the Android Setup wizard and install the latest Android SDK Tools.

**Setting up emulator**

1. Start Android Studio
2. Go to **Tools > Android > AVD Manager** and **Create a virtual Device**.
3. Select any device of your choosing with software firmware **Android 10+**
4. Enable **Hardware acceleration** and select **Finish**.

##### Flutter

Follow the installation guide found at <https://flutter.dev/docs/get-started/install>

#### Running Project

Make sure you have [git](https://git-scm.com/) installed on your computer and run


```
//clone the repository
git clone https://github.com/dnov09/study-habit-tracker.git

// move into the project directory
cd study-habit-tracker

// enter this to find any issues
flutter doctor

// run application
flutter run
```

##### Creating apk

If you would like to test the application on your android device, enter the following:

```txt
cd study-habit-tracker

flutter build apk --release
```