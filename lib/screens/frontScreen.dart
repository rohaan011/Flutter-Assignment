import 'package:flutter/material.dart';

class Frontscreen extends StatelessWidget {
  const Frontscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Mutual',
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Space',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' Bangalore',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search messages or people',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(5),
              ),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.public_outlined),
                        Text("Community")
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [Icon(Icons.lock_outline), Text("Private")],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [Icon(Icons.people_outline), Text("Geo-Room")],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Tile(
                  title: 'Consumer Technology',
                  subtitle: '543+ here...',
                  time: '9:41 Am',
                  count: '253',
                  icon: Icons.devices,
                  color: Colors.grey,
                ),
                Tile(
                  title: 'SaaS & Enterprise',
                  subtitle: '543+ here...',
                  time: '9:41 Am',
                  count: '39',
                  icon: Icons.business,
                  color: Colors.blue,
                ),
                Tile(
                  title: 'Travel & Vacation',
                  subtitle: '543+ here...',
                  time: '9:23  Am',
                  count: '2',
                  icon: Icons.flight,
                  color: Colors.green,
                  mark: '@',
                ),
                Tile(
                  title: 'Law & Legal',
                  subtitle: '543+ here...',
                  time: '9:23 Am',
                  count: '57',
                  icon: Icons.gavel,
                  color: Colors.brown,
                  mark: '@',
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text('Explore more'),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.rocket), label: 'Space'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget Tile({
    required String title,
    required String subtitle,
    required String time,
    String mark = '',
    required String count,
    required IconData icon,
    required Color color,
  }) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(icon, color: color),
      ),
      title: Text(title),
      subtitle: Row(
        children: [
          Icon(Icons.person, size: 16, color: Colors.grey),
          Icon(Icons.person, size: 16, color: Colors.grey),
          Icon(Icons.person, size: 16, color: Colors.grey),
          SizedBox(width: 4),
          Text(subtitle, style: TextStyle(color: Colors.grey)),
        ],
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min, // Aligns properly
        children: [
          Text(time),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (mark.isNotEmpty) SizedBox(width: 6),
              if (mark.isNotEmpty)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.purple, // You can change this color
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    mark,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    count,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
