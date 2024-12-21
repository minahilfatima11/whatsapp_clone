import 'package:flutter/material.dart';
import 'package:whatsapp_clone/whatsapp-screen.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Calls',
          style: TextStyle(
            fontSize: 19,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(

        color: Colors.black,
        child: ListView(

          children: [
            Padding(
              padding: const EdgeInsets.only(top:  7.0, bottom: 10),
              child: const Divider(
                color: Colors.grey,
                thickness: 0.2,
                height: 1,
              ),
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.favorite, color: Colors.black),
              ),
              title: Text(
                'Add favorite',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Text(
                'Recent',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Divider inside ListView

            // Call items
            CallItem(
              name: "Aisha Sis",
              callType: "outgoing",
              dateTime: "December 15, 12:01 PM",
              callCount: "",
              isVideo: true,
              imagePath: 'assets/bg2.jpg', // Example image
            ),
            CallItem(
              name: "Aisha Sis",
              callType: "incoming",
              dateTime: "December 15, 9:43 AM",
              callCount: "(2)",
              isVideo: true,
              isMissed: true,
              imagePath: 'assets/bg2.jpg',
            ),
            CallItem(
              name: "Hajra",
              callType: "outgoing",
              dateTime: "December 7, 6:04 PM",
              callCount: "",
              isVideo: false,
              imagePath: 'assets/bg3.jpg',
            ),
            CallItem(
              name: "Baba",
              callType: "incoming",
              dateTime: "December 7, 12:38 PM",
              callCount: "",
              isVideo: false,
              isMissed: true,
              imagePath: 'assets/img.jpg',
            ),
            CallItem(
              name: "Momna",
              callType: "outgoing",
              dateTime: "December 7, 9:54 AM",
              callCount: "(2)",
              isVideo: false,
              imagePath: 'assets/avatar4.jpg',
            ),
            CallItem(
              name: "Baba",
              callType: "outgoing",
              dateTime: "December 6, 6:04 PM",
              callCount: "",
              isVideo: true,
              imagePath: 'assets/img.jpg',
            ),
            CallItem(
              name: "Mamu",
              callType: "incoming",
              dateTime: "December 6, 10:44 PM",
              callCount: "(3)",
              isVideo: false,
              isMissed: true,
              imagePath: 'assets/bg3.jpg',
            ),
            CallItem(
              name: "Baba",
              callType: "outgoing",
              dateTime: "December 5, 12:00 PM",
              callCount: "",
              isVideo: false,
              imagePath: 'assets/img.jpg',
            ),
            CallItem(
              name: "Bestie",
              callType: "incoming",
              dateTime: "December 4, 1:24 AM",
              callCount: "(4)",
              isVideo: true,
              isMissed: true,
              imagePath: 'assets/avatar5.jpg',
            ),
            CallItem(
              name: "Sadaf",
              callType: "incoming",
              dateTime: "December 3, 3:54 PM",
              callCount: "",
              isVideo: false,
              imagePath: 'assets/bg8.jpg',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: const Icon(Icons.add_call, color: Colors.black),
      ),

      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [

          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(Icons.chat),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ChatsScreen()));
              },
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(Icons.call),
              onPressed: () {

              },
            ),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(Icons.update_sharp),
              onPressed: () {},
            ),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(Icons.store_mall_directory_outlined),
              onPressed: () {},
            ),
            label: 'Tools',
          ),
        ],
      ),


    );
  }
}

class CallItem extends StatelessWidget {
  final String name;
  final String callType;
  final String dateTime;
  final String callCount;
  final bool isVideo;
  final bool isMissed;
  final String imagePath;

  const CallItem({
    super.key,
    required this.name,
    required this.callType,
    required this.dateTime,
    required this.callCount,
    required this.isVideo,
    this.isMissed = false,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(
        "$name $callCount",
        style: TextStyle(
          color: isMissed ? Colors.red : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Row(
        children: [
          Icon(
            callType == "outgoing"
                ? Icons.call_made
                : Icons.call_received,
            color: isMissed ? Colors.red : Colors.green,
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            dateTime,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
      trailing: Icon(
        isVideo ? Icons.videocam : Icons.call,
        color: Colors.white,
      ),
    );
  }
}
