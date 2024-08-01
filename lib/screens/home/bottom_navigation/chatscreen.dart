import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Favorites'),
              Tab(text: 'All'),
              Tab(text: 'Recent'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const SingleChildScrollView(
                  child: Column(
                    children: [
                      FavoriteItemContainer(
                        title: 'Unity DashBoard',
                        description: '9/20',
                        additionalInfo: 'Design.',
                        progressValue: 0.5,
                        progressColor: Colors.blue,
                      ),
                      FavoriteItemContainer(
                        title: 'Analytics Tool',
                        description: '24/30',
                        additionalInfo: 'Development.',
                        progressValue: 0.7,
                        progressColor: Colors.green,
                      ),
                      FavoriteItemContainer(
                        title: 'Project Management',
                        description: '20/25',
                        additionalInfo: 'Planning.',
                        progressValue: 0.8,
                        progressColor: Colors.red,
                      ),
                    ],
                  ),
                ),
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteItemContainer extends StatelessWidget {
  final String title;
  final String description;
  final String additionalInfo;
  final double progressValue;
  final Color progressColor;

  const FavoriteItemContainer({
    super.key,
    required this.title,
    required this.description,
    required this.additionalInfo,
    required this.progressValue,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              const Spacer(),
              Expanded(
                child: Text(
                  description,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            additionalInfo,
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildCircleAvatar('assets/avatar1.png'),
              const SizedBox(width: 8),
              _buildCircleAvatar('assets/avatar2.png'),
              const SizedBox(width: 8),
              _buildCircleAvatar('assets/avatar3.png'),
              const SizedBox(width: 8),
              Expanded(
                child: _buildLinearProgressIndicators(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircleAvatar(String imagePath) {
    return CircleAvatar(
      radius: 16.0,
      backgroundImage: AssetImage(imagePath),
    );
  }

  Widget _buildLinearProgressIndicators() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.circular(10),
            value: progressValue,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
          ),
        ),
      ],
    );
  }
}
