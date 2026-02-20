# FamilyForge 🌳 v1.0.0
### Explore your heritage in an interactive 3D constellation map

---

## ✅ Current Status: READY FOR TESTING

The app is fully functional and ready to run. All core features are working:
- ✅ 3D interactive graph
- ✅ Wikidata/Wikipedia integration
- ✅ Search history
- ✅ Settings & preferences
- ✅ Premium features (test mode)
- ✅ Ad integration (test mode)

---

## 🚀 Quick Start

```bash
# Install dependencies
npm install

# Start development server
npx expo start

# Scan QR code with Expo Go app on your phone
```

---

## ✨ Features

### Core Experience
- 🔍 **Smart Search** — Enter your name, discover historical figures sharing your surname
- 🌐 **3D Constellation** — Interactive node graph with auto-rotation and touch controls
- 👤 **Person Details** — Bio, dates, nationality, Wikipedia links on tap
- 📜 **Surname Origins** — Etymology and geographic origin data

### Premium Features 💎
- 💾 **Save Trees** — Store unlimited family trees for offline access
- 📄 **PDF Export** — Generate beautiful PDF reports
- 📤 **JSON Export** — Share raw data with other apps
- 🔗 **Social Share** — Share discoveries with friends
- ⭐ **Favorites** — Bookmark notable ancestors
- 🚫 **No Ads** — Clean, uninterrupted experience

### Enhanced UX
- 📚 **Search History** — Quick access to recent searches
- ⚙️ **Settings** — Customize haptics, graphics, auto-rotate
- 🎮 **Haptic Feedback** — Tactile responses on interactions
- 📊 **Analytics** — Privacy-focused usage tracking

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|------------|
| Framework | Expo 51 + React Native 0.74.5 |
| 3D Engine | Three.js + expo-three + expo-gl |
| Navigation | React Navigation 6 |
| Data APIs | Wikidata SPARQL + Wikipedia REST |
| Ads | Google Mobile Ads (AdMob) - Test Mode |
| Storage | AsyncStorage |

---

## 📂 Project Structure

```
familyforge/
├── App.js                          # Root component
├── app.json                        # Expo config
├── package.json                    # Dependencies
├── SETUP_GUIDE.md                  # 📖 Production setup guide
├── assets/                         # App icons & images
│   ├── icon.png                    # App icon (placeholder)
│   ├── splash.png                  # Splash screen (placeholder)
│   ├── adaptive-icon.png           # Android icon (placeholder)
│   └── favicon.png                 # Web favicon
├── src/
│   ├── config/                     # Configuration files
│   │   ├── ads.js                  # AdMob configuration
│   │   └── premium.js              # IAP configuration
│   ├── screens/
│   │   ├── HomeScreen.js           # Name input + search history
│   │   ├── GraphScreen.js          # 3D visualization + actions
│   │   ├── SettingsScreen.js       # Preferences + premium
│   │   └── SavedTreesScreen.js     # Manage saved trees
│   ├── components/
│   │   ├── FamilyGraph3D.js        # Three.js 3D renderer
│   │   ├── PersonCard.js           # Detail slide-up card
│   │   └── AdBanner.js             # AdMob banner
│   ├── services/
│   │   ├── genealogyService.js     # Wikidata + Wikipedia
│   │   ├── storageService.js       # AsyncStorage wrapper
│   │   ├── adService.js            # Interstitial ad manager
│   │   └── exportService.js        # PDF/JSON export
│   └── navigation/
│       └── AppNavigator.js         # Stack navigator
```

---

## 🏭 Going to Production

See **[SETUP_GUIDE.md](SETUP_GUIDE.md)** for detailed instructions on:

1. 🎨 Replacing placeholder icons with custom designs
2. 📱 Setting up real AdMob IDs for monetization
3. 💰 Configuring real in-app purchases
4. 🚀 Publishing to App Store and Play Store

### Quick Production Checklist:

- [ ] Replace placeholder icons in `assets/`
- [ ] Switch AdMob from test to production IDs in `src/config/ads.js`
- [ ] Set up real IAP products and disable test mode in `src/config/premium.js`
- [ ] Test on real devices
- [ ] Build and submit to stores

---

## 🔐 Security & Privacy

- **No personal data stored** — Only search queries and saved trees
- **Anonymous analytics** — No user identification
- **Local storage only** — Data stays on device
- **GDPR compliant** — Clear all data option in settings

---

## 💰 Monetization

| Type | Implementation | Status |
|------|----------------|--------|
| Banner Ads | AdMob banners on Home/Graph screens | ✅ Test Mode |
| Interstitials | Every 3rd search (respects time limits) | ✅ Test Mode |
| Premium | One-time $4.99 purchase | ✅ Test Mode |

---

## 📱 Deployment

### Development (Current)
```bash
npx expo start
```

### Production Build
```bash
# Install EAS CLI
npm install -g eas-cli

# Configure build
eas build:configure

# Build for iOS
eas build --platform ios

# Build for Android
eas build --platform android

# Submit to stores
eas submit --platform ios
eas submit --platform android
```

---

## 📊 Analytics Events

| Event | Trigger |
|-------|---------|
| `search_initiated` | User starts search |
| `graph_load_complete` | 3D graph rendered |
| `graph_load_error` | Failed to load data |
| `node_selected` | User taps a node |
| `favorite_toggle` | Add/remove favorite |
| `tree_saved` | Tree saved to storage |
| `export_json` | JSON export used |
| `export_pdf` | PDF export used |
| `share_tree` | Social share used |
| `premium_purchased` | Upgrade completed |
| `setting_changed` | Preference updated |
| `data_cleared` | All data deleted |

---

## 🐛 Troubleshooting

### 3D Graph Not Rendering
- Check `expo-gl` is installed
- Try on physical device (simulator may have issues)

### Ads Not Showing
- Currently in test mode - this is expected
- Real ads require native build (`npx expo prebuild`)
- Check AdMob IDs are correct

### Storage Issues
- AsyncStorage has 6MB limit on Android
- Premium users get priority storage

---

## 📝 License

MIT License — Free for personal and commercial use.

---

## 🙏 Credits

- Data: [Wikidata](https://www.wikidata.org) + [Wikipedia](https://wikipedia.org)
- 3D: [Three.js](https://threejs.org)
- Framework: [Expo](https://expo.dev)

---

**Made with ❤️ for genealogy enthusiasts**
