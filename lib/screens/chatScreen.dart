import 'package:flutter/material.dart';

class Chatscreen extends StatelessWidget {
  const Chatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/cons.png'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Consumer Technology',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('126.7K members • 2.5K online',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Color(0xFF6B5B95),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.wechat_outlined,
                            color: Colors.white, size: 20),
                        Text('0.0', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8),
                buildTab('Event', isSelected: false),
                SizedBox(width: 8),
                buildTab('Request', isSelected: false),
                SizedBox(width: 8),
                buildTab('Opportunity', isSelected: false),
              ],
            ),
          ),
          Divider(height: 1),
          Text('16 new messages (in last 5 min)',
              style: TextStyle(fontSize: 18, color: Colors.grey)),
          Expanded(
            child: ListView(
              children: [
                PostWidget(
                    name: 'Jasmine Chopra',
                    description:
                        'Tech enthusiast always on the lookout to write about the next big innovation',
                    content:
                        'Hey everyone, have you heard about the new AI-powered virtual assistant that can understand regional languages? It\'s a game-changer!',
                    likes: 3,
                    replies: 4,
                    time: '8:36k 10:00 am'),
                PostWidget(
                    name: 'Amit Raidu',
                    description:
                        'Solo-preneur passionate about social impact and technology',
                    verified: true,
                    content:
                        'I\'m working on a social enterprise that uses technology to address the challenges of climate change. It\'s been a game-changer for their startup in reducing carbon footprint and get 30-45% waive in GST, CGST and compliance.\nIf you want to get benefits, let\'s talk.😊\n#',
                    likes: 12,
                    replies: 18,
                    time: '8:36k 10:00 am'),
                PostWidget(
                  name: 'Aditi Verma',
                  description: 'Startup founder building the next unicorn',
                  content:
                      'I\'m looking for feedback on our latest product idea. We\'re building a mobile app that helps users track their carbon',
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Aa',
                  prefixIcon: Icon(Icons.emoji_emotions_outlined),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize
                        .min, // Ensures Row takes only required space
                    children: [
                      IconButton(
                        icon: Icon(Icons.push_pin_outlined),
                        onPressed: () {}, // Add functionality if needed
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.mic_rounded,
                          color: Colors.deepPurple,
                        ),
                        onPressed: () {}, // Add functionality if needed
                      ),
                    ],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              )),
        ],
      ),
    );
  }

  Widget buildTab(String text, {bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final String name;
  final String description;
  final String? distance;
  final String content;
  final bool verified;
  final int? likes;
  final int? replies;
  final String? time;

  PostWidget({
    required this.name,
    required this.description,
    this.distance,
    required this.content,
    this.verified = false,
    this.likes,
    this.replies,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.shade300,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        if (verified)
                          Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Icon(Icons.verified,
                                size: 16, color: Colors.yellow),
                          ),
                      ],
                    ),
                    Text(description,
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),
              if (distance != null)
                Text(distance!,
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.only(left: 50),
            child: Column(
              children: [
                Text(content),
                if (likes != null && replies != null && time != null)
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Row(
                      children: [
                        Icon(Icons.thumb_up_rounded,
                            color: Colors.amberAccent, size: 16),
                        Icon(Icons.favorite, color: Colors.red, size: 16),
                        Text(' $likes'),
                        SizedBox(width: 8),
                        Text('$replies replies'),
                        Spacer(),
                        Icon(
                          Icons.remove_red_eye_rounded,
                          size: 16,
                        ),
                        Text(time!,
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
