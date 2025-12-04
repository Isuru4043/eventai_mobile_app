# Google Sign-In Setup Guide

## Overview
This guide will help you set up Google Sign-In functionality for the OurTown Event app.

## Prerequisites
- Firebase project (or Google Cloud Console project)
- iOS and/or Android development setup

## Setup Steps

### 1. Firebase Console Setup

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or select existing project
3. Add your iOS and Android apps to the Firebase project

### 2. Android Setup

#### Step 1: Get SHA-1 Certificate Fingerprint

Run this command in your project directory:

```bash
cd android
./gradlew signingReport
```

Copy the SHA-1 certificate fingerprint from the output.

#### Step 2: Configure Firebase

1. In Firebase Console, go to Project Settings
2. Add Android app with your package name (e.g., `com.example.event`)
3. Add the SHA-1 fingerprint
4. Download `google-services.json`
5. Place it in `android/app/` directory

#### Step 3: Update build.gradle files

`android/build.gradle.kts`:
```kotlin
buildscript {
    dependencies {
        classpath("com.google.gms:google-services:4.4.0")
    }
}
```

`android/app/build.gradle.kts`:
```kotlin
plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")  // Add this
}

dependencies {
    implementation("com.google.android.gms:play-services-auth:20.7.0")
}
```

### 3. iOS Setup

#### Step 1: Configure Firebase

1. In Firebase Console, add iOS app
2. Use your bundle identifier (found in `ios/Runner.xcodeproj`)
3. Download `GoogleService-Info.plist`
4. Place it in `ios/Runner/` directory (via Xcode)

#### Step 2: Update Info.plist

Add to `ios/Runner/Info.plist`:

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <!-- Replace with your REVERSED_CLIENT_ID from GoogleService-Info.plist -->
            <string>com.googleusercontent.apps.YOUR-CLIENT-ID</string>
        </array>
    </dict>
</array>
```

#### Step 3: Update Podfile

`ios/Podfile`:
```ruby
platform :ios, '12.0'

# Uncomment if needed
# use_frameworks!
```

Then run:
```bash
cd ios
pod install
```

### 4. Update Flutter Code

In your sign-in/sign-up screens, implement Google Sign-In:

```dart
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ['email', 'profile'],
);

Future<void> _handleGoogleSignIn() async {
  try {
    final GoogleSignInAccount? account = await _googleSignIn.signIn();
    
    if (account != null) {
      print('Signed in as: ${account.email}');
      print('Display name: ${account.displayName}');
      
      // Get authentication tokens
      final GoogleSignInAuthentication auth = await account.authentication;
      print('ID Token: ${auth.idToken}');
      print('Access Token: ${auth.accessToken}');
      
      // TODO: Send tokens to your backend for verification
      // TODO: Navigate to home screen
    }
  } catch (error) {
    print('Google Sign-In error: $error');
    // Show error to user
  }
}
```

### 5. Testing

#### Android
```bash
flutter run
```

Make sure you're using a debug or release build with the correct SHA-1 registered.

#### iOS
```bash
flutter run
```

Make sure you've configured the URL scheme correctly.

### 6. Common Issues & Solutions

#### Issue: "Sign in failed" on Android
**Solution**: 
- Verify SHA-1 fingerprint is correct
- Check `google-services.json` is in correct location
- Ensure package name matches Firebase configuration

#### Issue: "Sign in failed" on iOS
**Solution**:
- Verify `GoogleService-Info.plist` is added to Xcode project
- Check URL scheme matches REVERSED_CLIENT_ID
- Ensure bundle identifier matches Firebase configuration

#### Issue: "Developer Error" popup
**Solution**:
- Missing or incorrect SHA-1 fingerprint
- Package name mismatch
- OAuth consent screen not configured

### 7. Backend Integration (Optional)

If you have a backend API, verify the Google ID token:

```dart
Future<void> sendTokenToBackend(String idToken) async {
  final response = await http.post(
    Uri.parse('https://your-api.com/auth/google'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'idToken': idToken}),
  );
  
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    // Store user session
    // Navigate to home screen
  }
}
```

### 8. Additional Configuration

#### Enable Google Sign-In in Firebase Console
1. Go to Authentication → Sign-in method
2. Enable Google provider
3. Add support email

#### Configure OAuth Consent Screen
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Select your project
3. Navigate to APIs & Services → OAuth consent screen
4. Configure app name, support email, etc.

### 9. Production Checklist

- [ ] SHA-1 fingerprint for release keystore added to Firebase
- [ ] OAuth consent screen configured
- [ ] Privacy policy URL added
- [ ] Terms of service URL added
- [ ] App logo uploaded
- [ ] Support email configured
- [ ] Proper error handling implemented
- [ ] Loading states added to UI
- [ ] Token refresh logic implemented

## Resources

- [Google Sign-In Flutter Plugin](https://pub.dev/packages/google_sign_in)
- [Firebase Authentication](https://firebase.google.com/docs/auth)
- [Google Cloud Console](https://console.cloud.google.com/)
- [OAuth 2.0 Documentation](https://developers.google.com/identity/protocols/oauth2)

## Security Best Practices

1. **Never expose client secrets** in your app code
2. **Always verify tokens** on the backend
3. **Use HTTPS** for all API communications
4. **Implement token refresh** logic
5. **Handle token expiration** gracefully
6. **Store tokens securely** (use flutter_secure_storage)

## Need Help?

If you encounter issues:
1. Check the [official documentation](https://pub.dev/packages/google_sign_in)
2. Review Firebase setup in the console
3. Check Android/iOS configuration files
4. Enable debug logging to see detailed errors
