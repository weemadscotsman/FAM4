# Build FamilyForge APK - 2 Options

## OPTION 1: Quick Test (No Build, 30 seconds)

Just want to see the app working?

1. **Double-click `JUST-RUN.bat`**
2. **Install "Expo Go"** on your phone (free from App Store/Play Store)
3. **Scan the QR code** that appears
4. **Done!** App runs instantly

---

## OPTION 2: Build APK (Needs Android Studio)

Want a real APK file to install on any phone?

### Prerequisites:
1. **Install Android Studio**: https://developer.android.com/studio
2. **Open Android Studio once** - let it download the SDK (automatic)
3. **That's it!**

### Build:
1. **Double-click `BUILD-APK-SIMPLE.bat`**
2. **Wait 5-10 minutes** (first build takes time)
3. **Get your APK** in `output/FamilyForge.apk`

---

## OPTION 3: Cloud Build (Needs Expo Account)

Don't want to install Android Studio?

1. **Create free account**: https://expo.dev/signup
2. **Open CMD and run**:
   ```
   npx eas-cli login
   npx eas-cli build --platform android --profile preview
   ```
3. **Wait 10 minutes**, download APK from the link

---

## Troubleshooting

### "JAVA_HOME not set"
Install JDK: https://adoptium.net/

### "Android SDK not found"
Open Android Studio → More Actions → SDK Manager → Install any missing SDKs

### "Gradle build failed"
Delete `android` folder and run BUILD-APK-SIMPLE.bat again

---

**RECOMMENDED**: Start with OPTION 1 (JUST-RUN.bat) to test the app first!
