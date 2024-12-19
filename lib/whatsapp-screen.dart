import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Column(
        children: [

          const SizedBox(height: 10),
          AppBar(
            centerTitle: false,
            elevation: 0,
            backgroundColor: const Color(0xFF121212),
            foregroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: const Text(
              "WhatsApp",
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.camera_alt),
                onPressed: () {},
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ],
          ),
          Divider(
            color: Colors.grey[200],
            thickness: 0.1,
            height: 1,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatsData.length,
              itemBuilder: (context, index) => ChatCard(
                chat: chatsData[index],
                press: () {},
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor:  Colors.white,
        child: const Icon(
          Icons.add_comment,
          color: Colors.black,

        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF121212),






        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: SizedBox(height:32 , child: Icon(Icons.chat)),

            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(height:32 ,child: Icon(Icons.call)),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(height:32,child: Icon(Icons.update_sharp),),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(height:32,child: Icon(Icons.store_mall_directory_outlined)),
            label: 'Tools',
          ),
        ],
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.chat,
    required this.press,
  });

  final Chat chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            CircleAvatarWithActiveIndicator(
              image: chat.image,
              isActive: chat.isActive,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white, // White text
                      ),
                    ),
                    const SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        chat.lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white70), // Grey text
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.64,
              child: Text(
                chat.time,
                style: const TextStyle(color: Colors.white70), // Grey text
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleAvatarWithActiveIndicator extends StatelessWidget {
  const CircleAvatarWithActiveIndicator({
    super.key,
    this.image,
    this.radius = 24,
    this.isActive,
  });

  final String? image;
  final double? radius;
  final bool? isActive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage(image!),
        ),
        if (isActive!)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                color: const Color(0xFF00BF6D), // Active green indicator
                shape: BoxShape.circle,
                border: Border.all(
                    color: const Color(0xFF121212), // Dark border
                    width: 3),
              ),
            ),
          )
      ],
    );
  }
}

class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  Chat(
    name: "85 - AppDev (Females)",
    lastMessage: "Momna: Okay Sir ..",
    image: "assets/appdev.jpeg",
    time: "3m ago",
  ),
  Chat(
    name: "Baba",
    lastMessage: "Missed voice call...",
    image: "assets/img.jpg",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Aisha Sis",
    lastMessage: "AsalamoAlikum",
    image: "assets/bg3.jpg",
    time: "43m ago",
    isActive: true,
  ),
  Chat(
    name: "Hina",
    lastMessage: "Acha thik hai",
    image: "assets/bg7.jpg",
    time: "1h ago",
    isActive: true,
  ),
  Chat(
    name: "Codic Solution Community",
    lastMessage: "You are now community admin",
    image: "assets/codic.jpg",
    time: "10:30 PM",
  ),
  Chat(
    name: "MLSA YE EVENTS",
    lastMessage: "Sara joined using this group's invite link",
    image: "assets/mlsa.jpg",
    time: "12/1/24",
  ),
  Chat(
    name: "Own Group",
    lastMessage: "You: Photo",
    image: "assets/bg4.jpg",
    time: "12/3/24",
  ),
  Chat(
    name: "Azka Uni",
    lastMessage: "Do you have any update...",
    image: "assets/bg2.jpg",
    time: "5d ago",
    isActive: true,
  ),
];
