import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white), // Set title color to white
        ),
        shadowColor: Colors.transparent,
        backgroundColor: const Color.fromARGB(255, 16, 76, 179), // Background color of the AppBar
        iconTheme: const IconThemeData(color: Colors.white), // Set back button color to white
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateSection('Today', [
              _buildNotificationCard(
                'New skincare tips available!',
                'Check out the latest tips on skincare routines.',
                '12:30 PM',
              ),
              _buildNotificationCard(
                'Reminder: Time for your skincare routine!',
                'Don’t forget to apply your products.',
                '1:00 PM',
              ),
            ]),
            _buildDateSection('Yesterday', [
              _buildNotificationCard(
                'Product restock alert!',
                'Your favorite moisturizer is back in stock!',
                '10:15 AM',
              ),
              _buildNotificationCard(
                'Exclusive offer just for you!',
                'Get 20% off your next purchase.',
                '11:00 AM',
              ),
            ]),
            _buildDateSection('2 days ago', [
              _buildNotificationCard(
                'New blog post: Winter Skincare',
                'Learn how to keep your skin hydrated this winter.',
                '9:30 AM',
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSection(String dateLabel, List<Widget> notifications) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dateLabel,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black), // Date label style
        ),
        const SizedBox(height: 8), // Space between the date label and notifications
        ...notifications, // Spread the notification cards here
        const SizedBox(height: 16), // Space after the notification cards
      ],
    );
  }

  Widget _buildNotificationCard(String title, String message, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.transparent, // Make the background color transparent
        border: Border.all(color: Colors.grey, width: 1), // Stroke color and width
        borderRadius: BorderRadius.circular(8.0), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 100, // Fixed height for uniformity
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black), // Title color
              ),
              const SizedBox(height: 4),
              Text(
                message,
                style: const TextStyle(fontSize: 14, color: Colors.black), // Message color
              ),
              const Spacer(), // Take up remaining space to push the timestamp to the bottom
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  time,
                  style: const TextStyle(fontSize: 12, color: Colors.grey), // Timestamp color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
