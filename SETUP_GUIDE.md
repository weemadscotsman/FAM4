# FamilyForge - Production Setup Guide

## ✅ What's Already Done

1. **App Icons** - Generated placeholder icons (replace with custom design before release)
2. **AdMob Config** - Set up with test IDs (switch to production IDs when ready)
3. **In-App Purchases** - Framework ready (implement real IAP when publishing)

---

## 🎨 1. Replace App Icons

### Current Status
- Placeholder icons are in `assets/` folder
- They work for testing but look generic

### To Replace:
1. Create custom icons (use a tool like Canva, Figma, or hire a designer)
2. Required sizes:
   - `icon.png` - 1024x1024 (main app icon)
   - `adaptive-icon.png` - 1024x1024 (Android adaptive icon)
   - `splash.png` - 1242x2436 (iPhone splash screen)
   - `favicon.png` - 64x64 (web favicon)
3. Replace files in `assets/` folder

### Design Tips:
- Use the dark blue color: `#0a0a1a`
- Use the purple accent: `#6644ff`
- Include a tree emoji 🌳 or family icon
- Keep it simple and recognizable

---

## 📱 2. Set Up Real AdMob IDs

### Current Status
- Using Google test IDs (safe, no real money)
- Shows "TEST ADS" label in app

### To Get Real IDs:

1. **Create AdMob Account:**
   - Go to https://admob.google.com
   - Sign up with your Google account
   - Complete tax and payment info

2. **Create App in AdMob:**
   - Click "Apps" → "Add App"
   - Select iOS or Android
   - Enter app name: "FamilyForge"
   - Get your App ID

3. **Create Ad Units:**
   - Click "Ad units" → "Add Ad Unit"
   - Create "Banner" ad unit → Copy ID
   - Create "Interstitial" ad unit → Copy ID

4. **Update Config:**
   Open `src/config/ads.js` and replace:
   ```javascript
   production: {
     ios: {
       banner: 'ca-app-pub-XXXXXXXXXXXXXXXX/XXXXXXXXXX',  // YOUR BANNER ID
       interstitial: 'ca-app-pub-XXXXXXXXXXXXXXXX/XXXXXXXXXX',  // YOUR INTERSTITIAL ID
       appId: 'ca-app-pub-XXXXXXXXXXXXXXXX~XXXXXXXXXX'  // YOUR APP ID
     },
     android: {
       banner: 'ca-app-pub-XXXXXXXXXXXXXXXX/XXXXXXXXXX',  // YOUR BANNER ID
       interstitial: 'ca-app-pub-XXXXXXXXXXXXXXXX/XXXXXXXXXX',  // YOUR INTERSTITIAL ID
       appId: 'ca-app-pub-XXXXXXXXXXXXXXXX~XXXXXXXXXX'  // YOUR APP ID
     }
   }
   ```

5. **Switch to Production:**
   ```javascript
   export const USE_TEST_ADS = false;  // Change from true to false
   ```

---

## 💰 3. Set Up Real In-App Purchases

### Current Status
- Test mode enabled (mock purchases, no real money)
- Shows "TEST MODE" badge in app

### iOS App Store:

1. **Create App in App Store Connect:**
   - Go to https://appstoreconnect.apple.com
   - Create new app
   - Fill in app details

2. **Set Up IAP:**
   - Go to "Features" → "In-App Purchases"
   - Click "+" to create new IAP
   - Type: Non-Consumable (one-time purchase)
   - Reference Name: "Premium"
   - Product ID: `com.familyforge.premium`
   - Price: $4.99
   - Display Name: "FamilyForge Premium"
   - Description: "Unlock all premium features"

3. **Update Config:**
   Open `src/config/premium.js`:
   ```javascript
   testMode: false,  // Change from true to false
   
   products: {
     ios: {
       premium: 'com.familyforge.premium',  // YOUR PRODUCT ID
     },
     // ...
   }
   ```

4. **Implement Real IAP Code:**
   Install IAP library:
   ```bash
   npx expo install expo-in-app-purchases
   ```
   
   Update `src/screens/SettingsScreen.js` handleUpgrade function with real purchase flow

### Android Play Store:

1. **Create App in Play Console:**
   - Go to https://play.google.com/console
   - Create new app
   - Set up store listing

2. **Set Up IAP:**
   - Go to "Monetize" → "Products" → "In-app products"
   - Click "Create product"
   - Product ID: `com.familyforge.premium`
   - Name: "FamilyForge Premium"
   - Description: "Unlock all premium features"
   - Price: $4.99

3. **Update Config:**
   ```javascript
   products: {
     android: {
       premium: 'com.familyforge.premium',  // YOUR PRODUCT ID
     }
   }
   ```

---

## 🚀 Publishing Checklist

### Before Submitting:

- [ ] Replace placeholder icons with custom design
- [ ] Switch AdMob to production IDs
- [ ] Set up real in-app purchases
- [ ] Test on real devices (iOS and Android)
- [ ] Update app name if needed
- [ ] Write app store description
- [ ] Create screenshots for store listing
- [ ] Set up privacy policy
- [ ] Configure app category (Lifestyle or Reference)

### Build Commands:

```bash
# Install dependencies
npm install

# Build for iOS
npx expo prebuild
npx expo run:ios --configuration Release

# Build for Android
npx expo prebuild
npx expo run:android --variant release

# Or use EAS Build (recommended)
npm install -g eas-cli
eas build:configure
eas build --platform ios
eas build --platform android
```

---

## 📞 Need Help?

- **Expo Docs:** https://docs.expo.dev
- **AdMob Help:** https://support.google.com/admob
- **App Store Help:** https://developer.apple.com/support
- **Play Store Help:** https://support.google.com/googleplay/android-developer

---

## 💡 Pro Tips

1. **Test thoroughly** with test IDs before switching to production
2. **Start with iOS** - usually easier approval process
3. **Prepare screenshots** showing the 3D graph - it's the app's main feature
4. **Write a good description** mentioning Wikidata/Wikipedia integration
5. **Set up analytics** to track user engagement

Good luck with your launch! 🌳✨
