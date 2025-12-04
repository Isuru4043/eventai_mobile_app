# OurTown Event App

A Flutter event management application with authentication screens.

## Features Implemented

### Authentication Screens
1. **Splash Screen**
   - App logo with loading indicator
   - Auto-navigates to Sign In screen after 3 seconds
   
2. **Sign In Screen**
   - Email and password input fields
   - Remember me checkbox
   - Forgot password link
   - Google Sign-In button
   - Link to Sign Up screen
   - Background with event crowd image overlay

3. **Sign Up Screen**
   - Full name input field
   - Email input field
   - Password input field
   - Confirm password input field
   - Password visibility toggle
   - Google Sign-Up button
   - Link to Sign In screen
   - Background with event crowd image overlay

## Design Features

- **Modern UI/UX**: Clean, modern interface matching the provided designs
- **Dark Theme**: Dark background with semi-transparent cards
- **Custom Widgets**: Reusable components for text fields and buttons
- **Responsive Layout**: Adapts to different screen sizes
- **Input Validation**: Password matching validation in Sign Up
- **Material Design 3**: Using latest Flutter Material Design guidelines

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── constants/
│   └── app_constants.dart   # Colors and text styles
├── screens/
│   ├── splash_screen.dart   # Splash screen
│   ├── sign_in_screen.dart  # Sign in screen
│   └── sign_up_screen.dart  # Sign up screen
└── widgets/
    ├── custom_button.dart   # Reusable button widget
    └── custom_text_field.dart # Reusable text field widget
```

## Dependencies

- `google_fonts`: Custom fonts (Inter)
- `font_awesome_flutter`: Google icon for social login
- `google_sign_in`: Google authentication integration

## Running the App

1. Ensure Flutter is installed and configured
2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Assets Setup (Optional)

### Adding Background Image
To add a custom background image for the auth screens:
1. Add your crowd/event image to `assets/images/`
2. Name it `crowd_background.jpg`
3. The app will automatically use it

### Adding Logo
To replace the default logo in the splash screen:
1. Add your logo image to `assets/images/`
2. Name it `logo.png`

## Color Scheme

- Primary Purple: `#8C30F5`
- Dark Background: `#1A1A1A`
- Card Background: `#2A2A2A`
- Primary Green: `#4CAF50`
- Input Background: `#F5F5F5`

## Next Steps

- Connect to authentication API
- Implement Google Sign-In functionality
- Add form validation with error messages
- Add loading states
- Create home screen after authentication

# OurTown Event App

A comprehensive Flutter event management application with complete authentication, event browsing, and management features.

## ✨ Features Implemented

### 🔐 Authentication Flow
- **Splash Screen** with app logo and loading animation
- **Sign In Screen** with email/password and Google Sign-In
- **Sign Up Screen** with full registration form
- **Forgot Password Flow** with email verification and password reset
- **Email Verification** with 6-digit OTP input
- **Create New Password** screen
- **Success Confirmation** screens

### 🏠 Main App Features
- **Bottom Navigation** with 4 tabs: For You, Search, Favourite, Profile
- **Home Screen** (For You):
  - Search bar with filters
  - Location selector
  - Add Event button
  - Category carousel
  - Featured event banner
  - "What's Coming Up" section
  - Trending Events section
  
- **Search Screen**:
  - Search functionality
  - Popular searches
  - Popular categories grid
  - Search results display
  
- **Favourite Screen**:
  - List of favorited events
  - Quick access to saved events
  
- **Profile Screen**:
  - User profile header
  - Personal section (Add Events, My Favourite, My Events)
  - About Us section (Help, Terms, Privacy)
  - Logout functionality

### 📅 Event Management
- **Event Detail Screen**:
  - Image carousel
  - Event title and description
  - Location, date, and time information
  - Interactive UI
  
- **Add Event Screen**:
  - Title and description inputs
  - Multi-image upload (max 10 images)
  - Date picker
  - Time picker
  - Location selector
  - Form validation
  
- **My Events Screen**:
  - List of user's created events
  - Event status (Pending, Approved, Rejected)
  - Edit and delete options
  - Status-based actions

## 🎨 Design Features

- Clean, modern UI/UX matching provided designs
- Consistent color scheme and typography
- Responsive layouts for all screen sizes
- Smooth navigation between screens
- Interactive elements with proper feedback
- Status indicators for events
- Material Design 3 components

## 📱 Screens Overview

### Authentication Screens (7)
1. Splash Screen
2. Sign In
3. Sign Up
4. Forgot Password
5. Email Verification
6. Create Password
7. Password Reset Success

### Main App Screens (8)
1. Home/For You
2. Search
3. Favourite
4. Profile
5. Event Detail
6. Add Event
7. My Events
8. Main Navigation (Bottom Tab Bar)

**Total: 15 Fully Functional Screens**

## 🔧 Technical Implementation

### Dependencies
```yaml
dependencies:
  flutter: sdk: flutter
  cupertino_icons: ^1.0.8
  google_fonts: ^6.2.1           # Custom fonts
  font_awesome_flutter: ^10.7.0   # Icons
  google_sign_in: ^6.2.1          # Google authentication
  intl: ^0.19.0                   # Date formatting
  image_picker: ^1.1.2            # Image selection
  file_picker: ^8.1.6             # File selection
  carousel_slider: ^5.0.0         # Image carousel
  table_calendar: ^3.1.2          # Calendar widget
```

### Project Structure
```
lib/
├── main.dart                           # App entry point
├── constants/
│   └── app_constants.dart             # Colors and text styles
├── models/
│   ├── event.dart                     # Event data model
│   ├── category.dart                  # Category data model
│   └── user_profile.dart              # User profile model
├── data/
│   └── mock_data.dart                 # Mock data for testing
├── screens/
│   ├── splash_screen.dart             # Splash screen
│   ├── sign_in_screen.dart            # Sign in
│   ├── sign_up_screen.dart            # Sign up
│   ├── forgot_password_screen.dart    # Forgot password
│   ├── email_verification_screen.dart # Email verification
│   ├── create_password_screen.dart    # Create new password
│   ├── password_reset_success_screen.dart # Success screen
│   ├── main_navigation_screen.dart    # Bottom navigation
│   ├── home_screen.dart               # Home/For You
│   ├── search_screen.dart             # Search
│   ├── favourite_screen.dart          # Favourites
│   ├── profile_screen.dart            # Profile
│   ├── event_detail_screen.dart       # Event details
│   ├── add_event_screen.dart          # Add event
│   └── my_events_screen.dart          # My events
└── widgets/
    ├── custom_button.dart             # Reusable button
    ├── custom_text_field.dart         # Reusable text field
    ├── event_card.dart                # Event card widget
    ├── event_list_item.dart           # Event list item
    └── category_item.dart             # Category item
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.9.2 or higher)
- Dart SDK
- iOS/Android development environment

### Installation

1. Clone the repository
```bash
git clone <repository-url>
cd event
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## 📊 App Navigation Flow

```
Splash Screen (3s auto-navigate)
    ↓
Sign In Screen
    ├→ Sign Up Screen → Main App
    ├→ Forgot Password → Email Verification → Create Password → Success → Sign In
    └→ Sign In Success → Main App

Main App (Bottom Navigation)
    ├→ For You (Home)
    │   ├→ Event Detail
    │   └→ Add Event
    ├→ Search
    │   └→ Event Detail
    ├→ Favourite
    │   └→ Event Detail
    └→ Profile
        ├→ Add Event
        ├→ My Favourite
        ├→ My Events → Event Detail
        ├→ Help
        ├→ Terms & Conditions
        ├→ Privacy Policy
        └→ Logout → Sign In
```

## 🎨 Color Scheme

| Color | Hex Code | Usage |
|-------|----------|-------|
| Primary Purple | #8C30F5 | Buttons, links, accents |
| Dark Background | #1A1A1A | Auth screens background |
| Card Background | #2A2A2A | Auth card overlay |
| Primary Green | #4CAF50 | Logo, free badges |
| Input Background | #F5F5F5 | Text fields |
| Text White | #FFFFFF | Primary text on dark |
| Text Grey | #9E9E9E | Secondary text |

## ✅ Completed Features

- [x] Complete authentication flow
- [x] Password reset functionality
- [x] Main app navigation
- [x] Home screen with categories and events
- [x] Search functionality
- [x] Favourites management
- [x] User profile
- [x] Event details view
- [x] Add event form
- [x] My events management
- [x] Event status tracking
- [x] Image carousel
- [x] Date/Time pickers
- [x] Form validation
- [x] Navigation between all screens
- [x] Responsive design
- [x] Mock data for testing

## 🔄 Next Steps (Backend Integration)

### To Complete the App:
1. **Backend API Integration**
   - Connect to authentication API
   - Implement event CRUD operations
   - Add user profile management
   - Implement search functionality

2. **Google Sign-In Setup**
   - Configure Firebase project
   - Add SHA-1 certificates
   - Set up OAuth consent screen
   - (See GOOGLE_SIGNIN_SETUP.md for details)

3. **Image Upload**
   - Implement cloud storage (Firebase Storage/AWS S3)
   - Add image compression
   - Handle upload progress

4. **State Management**
   - Add Provider/Riverpod/Bloc
   - Implement proper state management
   - Add caching

5. **Additional Features**
   - Push notifications
   - Event booking
   - Payment integration
   - Social sharing
   - Event recommendations

## 📝 Notes

- All screens are fully functional with navigation
- Mock data is used for testing purposes
- Forms include basic validation
- Google Sign-In requires additional setup (see GOOGLE_SIGNIN_SETUP.md)
- Images use placeholder assets (add your images to assets/images/)
- All TODO comments indicate where backend integration is needed

## 🐛 Known Issues

- Minor deprecation warnings for withOpacity (info level, not errors)
- Some unused imports flagged by analyzer (info level)
- Event images use placeholders - add real images to assets folder

## 📄 License

This project is created for educational/demo purposes.

## 🤝 Contributing

This is a demo project. For production use, implement:
- Proper error handling
- Loading states
- Offline support
- Analytics
- Crash reporting
- Security best practices

## 📞 Support

For issues or questions:
1. Check the documentation files
2. Review the code comments
3. See Flutter documentation at https://flutter.dev/docs

---

**Status**: ✅ All screens implemented and connected
**Last Updated**: November 19, 2025
**Flutter Version**: 3.9.2
**Dart Version**: 3.9.2

