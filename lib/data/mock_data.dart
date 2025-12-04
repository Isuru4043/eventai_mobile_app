import '../models/event.dart';
import '../models/category.dart';
import '../models/user_profile.dart';

class MockData {
  static final List<Category> categories = [
    Category(
      id: '1',
      name: 'Music Events',
      imageUrl: 'assets/images/music.jpg',
    ),
    Category(id: '2', name: 'Technology', imageUrl: 'assets/images/tech.jpg'),
    Category(id: '3', name: 'Concerts', imageUrl: 'assets/images/concerts.jpg'),
    Category(
      id: '4',
      name: 'Art Exhibitions',
      imageUrl: 'assets/images/art.jpg',
    ),
    Category(
      id: '5',
      name: 'Film Screenings',
      imageUrl: 'assets/images/film.jpg',
    ),
    Category(
      id: '6',
      name: 'Theatre & Performing Arts',
      imageUrl: 'assets/images/theatre.jpg',
    ),
    Category(id: '7', name: 'Dance Shows', imageUrl: 'assets/images/dance.jpg'),
    Category(
      id: '8',
      name: 'Conferences & Symposia',
      imageUrl: 'assets/images/conference.jpg',
    ),
    Category(
      id: '9',
      name: 'Workshops & Training',
      imageUrl: 'assets/images/workshop.jpg',
    ),
    Category(id: '10', name: 'Webinars', imageUrl: 'assets/images/webinar.jpg'),
    Category(
      id: '11',
      name: 'Business & Startup Pitches',
      imageUrl: 'assets/images/business.jpg',
    ),
    Category(
      id: '12',
      name: 'Trade Shows & Expos',
      imageUrl: 'assets/images/trade.jpg',
    ),
    Category(
      id: '13',
      name: 'Food & Drink Festivals',
      imageUrl: 'assets/images/food.jpg',
    ),
    Category(
      id: '14',
      name: 'Sports Events',
      imageUrl: 'assets/images/sports.jpg',
    ),
    Category(id: '15', name: 'Comedy', imageUrl: 'assets/images/comedy.jpg'),
  ];

  static final List<Event> events = [
    Event(
      id: '1',
      title: 'Miami Marlins Dj Night',
      description:
          'Join us for an amazing night of music and entertainment at the Miami Marlins Dj Night. Experience the best DJs spinning the latest tracks.',
      imageUrls: [
        'assets/images/event1.jpg',
        'assets/images/event2.jpg',
        'assets/images/event3.jpg',
      ],
      location: 'Miami',
      locationDetail: 'Miami Central Park Zoo, 511 E 38th Street',
      date: DateTime(2025, 12, 13),
      time: '08:00 AM',
      category: 'Music Events',
      price: 16.95,
      isFavorite: false,
    ),
    Event(
      id: '2',
      title:
          'Miami Marlins Central Park Zoo Total Experience: When Baseball Meets Wildlife',
      description:
          'A unique experience combining baseball excitement with wildlife exploration. Perfect for families and sports enthusiasts.',
      imageUrls: [
        'assets/images/zoo1.jpg',
        'assets/images/zoo2.jpg',
        'assets/images/zoo3.jpg',
      ],
      location: 'Miami Central Park Zoo',
      locationDetail: 'Miami Central Park Zoo, 511 E 38th Street',
      date: DateTime(2025, 11, 17),
      time: '08:00 AM',
      category: 'Sports Events',
      price: 16.95,
      isFavorite: true,
    ),
    Event(
      id: '3',
      title: 'Summer Music Festival',
      description:
          'The biggest music festival of the year featuring top artists from around the world.',
      imageUrls: ['assets/images/festival1.jpg', 'assets/images/festival2.jpg'],
      location: 'London, UK',
      locationDetail: 'Hyde Park, London',
      date: DateTime(2026, 1, 15),
      time: '06:00 PM',
      category: 'Concerts',
      isFavorite: false,
    ),
    Event(
      id: '4',
      title: 'Tech Conference 2026',
      description:
          'Join industry leaders and innovators at the premier technology conference.',
      imageUrls: ['assets/images/tech1.jpg'],
      location: 'London, UK',
      locationDetail: 'ExCeL London',
      date: DateTime(2026, 1, 20),
      time: '09:00 AM',
      category: 'Technology',
      price: 299.00,
      isFavorite: false,
    ),
    Event(
      id: '5',
      title: 'Comedy Night Live',
      description:
          'Laugh out loud with the best stand-up comedians in the city.',
      imageUrls: ['assets/images/comedy1.jpg'],
      location: 'Miami',
      locationDetail: 'Comedy Club Miami',
      date: DateTime(2025, 12, 13),
      time: '08:00 PM',
      category: 'Comedy',
      price: 25.00,
      isFavorite: true,
    ),
  ];

  static final UserProfile currentUser = UserProfile(
    id: '1',
    name: 'Maximilien Alexander',
    email: 'max.alexander@example.com',
    photoUrl: 'assets/images/profile.jpg',
  );

  static List<String> popularSearches = [
    'Zoo',
    'Concert',
    'Festival',
    'DJ Night',
    'Comedy Show',
  ];

  static List<Event> getMyEvents() {
    return [
      Event(
        id: 'm1',
        title: 'Miami Marlins Central Park Zoo Total Experience...',
        description: 'Event description',
        imageUrls: ['assets/images/my_event1.jpg'],
        location: 'Miami Central Park Zoo',
        locationDetail: 'Miami Central Park Zoo',
        date: DateTime(2025, 12, 13),
        time: '08:00 AM',
        category: 'Sports Events',
        status: 'Pending',
        isFavorite: false,
      ),
      Event(
        id: 'm2',
        title: 'Miami Marlins Central Park I Total Experience...',
        description: 'Event description',
        imageUrls: ['assets/images/my_event2.jpg'],
        location: 'Miami Central Park Zoo',
        locationDetail: 'Miami Central Park Zoo',
        date: DateTime(2025, 12, 13),
        time: '08:00 AM',
        category: 'Sports Events',
        status: 'Approved',
        isFavorite: false,
      ),
      Event(
        id: 'm3',
        title: 'Miami Marlins Central Park I Total Experience...',
        description: 'Event description',
        imageUrls: ['assets/images/my_event3.jpg'],
        location: 'Miami Central Park Zoo',
        locationDetail: 'Miami Central Park Zoo',
        date: DateTime(2025, 12, 13),
        time: '08:00 AM',
        category: 'Sports Events',
        status: 'Rejected',
        isFavorite: false,
      ),
      Event(
        id: 'm4',
        title: 'Miami Marlins Central Park Zoo Total Experience...',
        description: 'Event description',
        imageUrls: ['assets/images/my_event4.jpg'],
        location: 'Miami Central Park Zoo',
        locationDetail: 'Miami Central Park Zoo',
        date: DateTime(2025, 12, 13),
        time: '08:00 AM',
        category: 'Sports Events',
        price: 16.95,
        isFavorite: false,
      ),
      Event(
        id: 'm5',
        title: 'Miami Marlins Central Park Zoo Total Experience...',
        description: 'Event description',
        imageUrls: ['assets/images/my_event5.jpg'],
        location: 'Miami Central Park Zoo',
        locationDetail: 'Miami Central Park Zoo',
        date: DateTime(2025, 12, 13),
        time: '08:00 AM',
        category: 'Sports Events',
        price: 16.95,
        isFavorite: false,
      ),
    ];
  }

  static List<Event> getFavoriteEvents() {
    return events.where((event) => event.isFavorite).toList();
  }
}
