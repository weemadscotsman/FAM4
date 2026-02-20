# FamilyForge - Quick Start Guide

## 🚀 GET RUNNING IN 5 MINUTES

### Option 1: Local Development (Fastest for Testing)

1. **Double-click `START.bat`**
   - This installs dependencies and starts the dev server
   - Scan the QR code with **Expo Go** app on your phone
   - Or press `a` to open Android emulator

2. **That's it!** The app is running!

---

### Option 2: Build APK (Standalone App)

#### Method A: Cloud Build (Easiest - No Android Studio)
1. **Create free account at** https://expo.dev/signup
2. **Double-click `BUILD-APK.bat`**
3. **Choose option 1** (Build APK)
4. **Wait 5-10 minutes** - you'll get a download link
5. **Install APK** on any Android device

#### Method B: Local Build (Requires Android Studio)
1. **Install Android Studio** + Android SDK
2. **Set environment variables:**
   - `ANDROID_HOME` = your Android SDK path
   - `JAVA_HOME` = your JDK path
3. **Double-click `LOCAL-BUILD.bat`**
4. **Find APK in** `output/FamilyForge-debug.apk`

---

## 📱 App Features

- **Search** - Enter any last name to explore heritage
- **3D Visualization** - Interactive constellation of historical figures
- **Surname Origins** - Learn where your name comes from
- **Save Trees** - Premium: Save family trees for later
- **Export** - Share trees as JSON or PDF (premium)

---

## 🔧 Troubleshooting

### "Module not found" errors
```bash
npm install
npx expo start --clear
```

### Expo Go won't connect
- Make sure phone and computer are on **same WiFi**
- Try using **tunnel mode**: `npx expo start --tunnel`

### Build fails
- Make sure you're logged in: `eas login`
- Check build status: https://expo.dev/builds

---

## 📦 Project Structure

```
familyforge/
├── App.js                 # App entry
├── src/
│   ├── screens/           # Home, Graph, Settings, SavedTrees
│   ├── components/        # 3D Graph, PersonCard, AdBanner
│   ├── services/          # API, Storage, Export, Ads
│   ├── config/            # Ads, Premium config
│   └── navigation/        # Stack navigator
├── assets/                # Icons, splash screen
├── START.bat             # Quick dev start
├── BUILD-APK.bat         # Cloud APK builder
└── LOCAL-BUILD.bat       # Local APK builder
```

---

## 🎨 Customization

### Change App Name/Bundle ID
Edit `app.json`:
```json
{
  "name": "YourAppName",
  "android": {
    "package": "com.yourcompany.app"
  }
}
```

### Add Real Ads (Optional)
1. Create AdMob account: https://admob.google.com
2. Get App ID and Ad Unit IDs
3. Edit `src/config/ads.js` - replace test IDs with real ones
4. Set `USE_TEST_ADS = false`

### Enable Real IAP (Optional)
1. Set up in App Store / Play Store
2. Edit `src/config/premium.js` - add real product IDs
3. Set `testMode: false`

---

## 🆘 Need Help?

- **Expo docs**: https://docs.expo.dev
- **React Native docs**: https://reactnative.dev
- **Build issues**: Check https://expo.dev/builds

---

## ✅ Pre-Launch Checklist

Before publishing to stores:

- [ ] Update `app.json` with your bundle ID
- [ ] Replace AdMob test IDs with real ones
- [ ] Add real IAP product IDs
- [ ] Update app icon in `assets/`
- [ ] Update splash screen in `assets/`
- [ ] Test on physical device
- [ ] Test premium features (test purchase)
- [ ] Test offline behavior
- [ ] Update privacy policy URL

---

**Ready to go!** Start with `START.bat` and explore your heritage! 🌳
