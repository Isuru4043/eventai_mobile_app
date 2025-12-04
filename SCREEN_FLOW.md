# Screen Flow Documentation

## App Navigation Flow

```
┌─────────────────────────────────────────┐
│         SPLASH SCREEN                   │
│  ┌───────────────────────────────┐     │
│  │                               │     │
│  │     OurTown Event Logo        │     │
│  │     (Location Pin + Rays)     │     │
│  │                               │     │
│  │    Ourtownevent.com           │     │
│  │         Event                 │     │
│  │                               │     │
│  │    [Loading Progress Bar]     │     │
│  │                               │     │
│  └───────────────────────────────┘     │
│                                         │
│  Auto-navigate after 3 seconds          │
└─────────────────┬───────────────────────┘
                  ↓
┌─────────────────────────────────────────┐
│         SIGN IN SCREEN                  │
│  ┌───────────────────────────────┐     │
│  │ ← [Back]                      │     │
│  │                               │     │
│  │  [Dark Background Image]      │     │
│  │                               │     │
│  │  ╔═══════════════════════╗    │     │
│  │  ║                       ║    │     │
│  │  ║ Hey, Welcome Back!    ║    │     │
│  │  ║ Enter your Credentials║    │     │
│  │  ║                       ║    │     │
│  │  ║ Email                 ║    │     │
│  │  ║ [_______________]     ║    │     │
│  │  ║                       ║    │     │
│  │  ║ Password              ║    │     │
│  │  ║ [_______________] 👁  ║    │     │
│  │  ║                       ║    │     │
│  │  ║ ☑ Remember me         ║    │     │
│  │  ║         Forgot Password? │    │     │
│  │  ║                       ║    │     │
│  │  ║   [  Sign In  ]       ║    │     │
│  │  ║                       ║    │     │
│  │  ║ Don't have account?   ║    │     │
│  │  ║      Sign Up          ║    │ ───┐
│  │  ║                       ║    │     │
│  │  ║ ─── Or Sign in with ──║    │     │
│  │  ║                       ║    │     │
│  │  ║ [G Continue with      ║    │     │
│  │  ║     Google        ]   ║    │     │
│  │  ║                       ║    │     │
│  │  ╚═══════════════════════╝    │     │
│  └───────────────────────────────┘     │
└─────────────────┬───────────────────────┘
                  │                        │
                  │                        │
                  ↓                        │
┌─────────────────────────────────────────┐│
│         SIGN UP SCREEN                  ││
│  ┌───────────────────────────────┐     ││
│  │ ← [Back]                      │     ││
│  │                               │     ││
│  │  [Dark Background Image]      │     ││
│  │                               │     ││
│  │  ╔═══════════════════════╗    │     ││
│  │  ║                       ║    │     ││
│  │  ║ Create your Account   ║    │     ││
│  │  ║ Enter all required    ║    │     ││
│  │  ║ information...        ║    │     ││
│  │  ║                       ║    │     ││
│  │  ║ Full Name             ║    │     ││
│  │  ║ [_______________]     ║    │     ││
│  │  ║                       ║    │     ││
│  │  ║ Email                 ║    │     ││
│  │  ║ [_______________]     ║    │     ││
│  │  ║                       ║    │     ││
│  │  ║ Password              ║    │     ││
│  │  ║ [_______________] 👁  ║    │     ││
│  │  ║                       ║    │     ││
│  │  ║ Confirm Password      ║    │     ││
│  │  ║ [_______________] 👁  ║    │     ││
│  │  ║                       ║    │     ││
│  │  ║   [  Sign Up  ]       ║    │     ││
│  │  ║                       ║    │     ││
│  │  ║ Already have account? ║    │     ││
│  │  ║      Sign In          ║    │ ←───┘
│  │  ║                       ║    │
│  │  ║ ─── Or Sign up with ──║    │
│  │  ║                       ║    │
│  │  ║ [G Continue with      ║    │
│  │  ║     Google        ]   ║    │
│  │  ║                       ║    │
│  │  ╚═══════════════════════╝    │
│  └───────────────────────────────┘
└─────────────────────────────────────────┘
```

## Screen Details

### 1. Splash Screen
**Purpose**: Brand introduction and initial loading

**Components**:
- Logo with location pin icon
- App name: "OurTown"
- Subtitle: "Ourtownevent.com Event"
- Linear progress indicator
- White background

**Behavior**:
- Displays for 3 seconds
- Auto-navigates to Sign In screen
- No user interaction required

---

### 2. Sign In Screen
**Purpose**: User authentication entry point

**Components**:
- Back button (top-left)
- Background image with dark overlay
- Semi-transparent card container
- Title: "Hey, Welcome Back!"
- Subtitle: "Enter your Credentials to access your Account"
- Email input field
- Password input field with visibility toggle
- "Remember me" checkbox
- "Forgot Password?" link
- Purple "Sign In" button
- "Don't have an account?" with "Sign Up" link
- Divider with "Or Sign in with" text
- Google Sign-In button with Google icon

**Interactions**:
- Toggle password visibility
- Check/uncheck remember me
- Navigate to Sign Up screen
- Navigate to Forgot Password (not implemented)
- Sign in with email/password
- Sign in with Google

---

### 3. Sign Up Screen
**Purpose**: New user registration

**Components**:
- Back button (top-left)
- Background image with dark overlay
- Semi-transparent card container
- Title: "Create your Account"
- Subtitle: "Enter all required information to discover more"
- Full Name input field
- Email input field
- Password input field with visibility toggle
- Confirm Password input field with visibility toggle
- Purple "Sign Up" button
- "Already have an account?" with "Sign In" link
- Divider with "Or Sign up with" text
- Google Sign-Up button with Google icon

**Interactions**:
- Toggle password visibility for both fields
- Navigate to Sign In screen
- Sign up with email/password
- Sign up with Google
- Password matching validation

---

## Component Specifications

### Custom Text Field
```
┌─────────────────────────────┐
│ Label Text                  │
│ ┌─────────────────────────┐ │
│ │ Placeholder text      [👁]│ │
│ └─────────────────────────┘ │
└─────────────────────────────┘
```

**Features**:
- White background (#F5F5F5)
- Rounded corners (12px)
- Optional suffix icon (e.g., visibility toggle)
- Dark text on light background
- Label above input
- Focus state with purple border

### Custom Button
```
┌─────────────────────────────┐
│      Button Text            │
└─────────────────────────────┘
```

**Features**:
- Purple background (#8C30F5)
- White text
- Full width
- Height: 56px
- Rounded corners (28px)
- No elevation/shadow

### Google Sign-In Button
```
┌─────────────────────────────┐
│  [G]  Continue with Google  │
└─────────────────────────────┘
```

**Features**:
- White background
- Black text
- Google "G" icon
- Full width
- Height: 56px
- Rounded corners (28px)
- White border

---

## Design System

### Colors
| Element | Color | Hex Code |
|---------|-------|----------|
| Primary Button | Purple | #8C30F5 |
| Background | Dark Gray | #1A1A1A |
| Card Background | Medium Gray | #2A2A2A |
| Input Background | Light Gray | #F5F5F5 |
| Primary Text | White | #FFFFFF |
| Secondary Text | Gray | #9E9E9E |
| Brand Green | Green | #4CAF50 |

### Typography
| Element | Size | Weight | Color |
|---------|------|--------|-------|
| Heading 1 | 28px | Bold | White |
| Heading 2 | 16px | Regular | Gray |
| Button Text | 18px | Semi-Bold | White |
| Input Label | 16px | Medium | White |
| Link Text | 14px | Medium | Purple |
| Input Text | 16px | Regular | Black |

### Spacing
| Element | Size |
|---------|------|
| Screen Padding | 24px |
| Card Padding | 24px |
| Vertical Spacing (Large) | 32px |
| Vertical Spacing (Medium) | 20px |
| Vertical Spacing (Small) | 16px |
| Vertical Spacing (Tiny) | 8px |

### Border Radius
| Element | Radius |
|---------|--------|
| Input Fields | 12px |
| Buttons | 28px |
| Cards | 24px |

---

## User Journey

### First-Time User
1. Opens app → Sees Splash Screen (3s)
2. Lands on Sign In Screen
3. Clicks "Sign Up"
4. Fills in registration form
5. Clicks "Sign Up" or "Continue with Google"
6. → [Next: Home Screen]

### Returning User
1. Opens app → Sees Splash Screen (3s)
2. Lands on Sign In Screen
3. Enters credentials (or clicks "Continue with Google")
4. Clicks "Sign In"
5. → [Next: Home Screen]

---

## Accessibility Features

- ✅ Proper contrast ratios for readability
- ✅ Touch targets meet minimum size (56px height)
- ✅ Password visibility toggle for accessibility
- ✅ Clear labels for all input fields
- ✅ Semantic widget structure
- ✅ Back button for navigation
- ✅ Keyboard-friendly input fields

---

## Responsive Behavior

### Phone Portrait
- Single column layout
- Full-width inputs and buttons
- Scrollable content
- Card takes most of screen width

### Phone Landscape
- Scrollable content
- Maintains readable card width
- Proper spacing maintained

### Tablet
- Centered card with max-width
- Larger touch targets
- More whitespace
- Same vertical flow

---

## State Management

### Sign In Screen States
- Initial: Empty form
- Typing: Form being filled
- Remember Me: Checked/Unchecked
- Password Visible: Hidden/Shown
- Loading: (To be implemented)
- Error: (To be implemented)
- Success: Navigate away

### Sign Up Screen States
- Initial: Empty form
- Typing: Form being filled
- Password Visible: Hidden/Shown (both fields)
- Password Match: Valid/Invalid
- Loading: (To be implemented)
- Error: Display validation message
- Success: Navigate away

---

## Error Handling

### Current Implementation
- Password mismatch: Shows SnackBar

### To Be Implemented
- Network errors
- Invalid email format
- Weak password
- Email already exists
- Google Sign-In cancellation
- Server errors
