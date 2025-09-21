# Ssquad Ventures - Travel App

A Flutter-based mobile application that connects users with service providers through a bidding system. Users can browse various service categories, specify their requirements, and submit bids to receive tailored offers from vendors.

## Features

- **Service Categories**: Browse and search through multiple service categories including:
  - Travel & Stay
  - Banquets & Venues
  - Retail
  - Food & Catering
  - Photography

- **Bidding System**: 
  - Users start with a set number of bids
  - Submit detailed requirements for services
  - Receive competitive offers from vendors
  - Fast response option available (costs 2 bids vs 1 for standard)

- **Venue Booking** (Currently Implemented):
  - Specify event type (Wedding, Anniversary, Corporate event, etc.)
  - Select location (Country, State, City)
  - Choose event dates
  - Define guest count and catering preferences
  - Select cuisine options
  - Set budget and response time expectations

- **User Experience**:
  - Intuitive search functionality
  - Clean, modern UI with deep purple theme
  - Real-time form validation
  - Custom snackbar notifications
  - Responsive design

## How It Works

1. **Browse Categories**: Users land on the home page with a curated list of service categories
2. **Search & Filter**: Use the search bar to quickly find relevant services
3. **Submit Requirements**: For available services like Banquets & Venues, fill out a detailed form with your specific needs
4. **Place Bid**: Submit your bid (standard or fast response)
5. **Receive Offers**: Vendors review your requirements and send tailored offers
6. **Track Bids**: Monitor your remaining bid count in the plan section

**Note**: The backend is deployed on a serverless platform (Render), so the first API request may take longer due to cold start times. Subsequent requests will be faster.

## Project Structure

```
front_end/
├── lib/
│   ├── Pages/
│   │   ├── home_page.dart          # Main home screen with categories
│   │   └── banq_and_venues.dart    # Venue bidding form page
│   ├── service/
│   │   └── banquet_and_venues/
│   │       └── post_bid.dart       # API service for venue bids
│   ├── utils/
│   │   └── routes.dart             # App routing configuration
│   └── widgets/                    # Reusable UI components
│       ├── category_card.dart
│       ├── catering_options.dart
│       ├── cuisine_selector.dart
│       ├── event_dates_selector.dart
│       ├── event_type_dropdown.dart
│       ├── plan_section_home.dart
│       ├── response_time_selector.dart
│       ├── search_bar.dart
│       ├── snack_bar.dart
│       ├── user_header.dart
│       └── themes.dart
├── assets/
│   ├── images/                     # Service category images
│   └── files/
│       └── categories.json         # Service categories data
├── android/                        # Android platform code
├── ios/                           # iOS platform code
├── web/                           # Web platform code
├── windows/                       # Windows platform code
├── linux/                         # Linux platform code
├── macos/                         # macOS platform code
├── test/                          # Unit tests
└── pubspec.yaml                   # Flutter dependencies
```

## Installation

1. **Prerequisites**:
   - Flutter SDK (^3.9.2)
   - Dart SDK
   - Android Studio or VS Code with Flutter extensions

2. **Clone the repository**:
   ```bash
   git clone https://github.com/ShashankUmarVaishy/flutter_travel_app.git
   cd front_end
   ```

3. **Install dependencies**:
   ```bash
   flutter pub get
   ```

4. **Set up environment variables**:
   - You don't need an env file as all necessary configurations are included within the project.

5. **Run the app**:
   ```bash
   flutter run
   ```

## Dependencies

- **flutter**: Core Flutter framework
- **google_fonts**: Custom typography
- **flutter_dotenv**: Environment variable management
- **http**: HTTP client for API calls

## API Integration

The app communicates with a REST API hosted on Render:
- Base URL: `https://flutter-travel-app-backend.onrender.com/api/v1/banq_and_ven`
- Endpoints:
  - `POST /bid`: Submit venue booking bid