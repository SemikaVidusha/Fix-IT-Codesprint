import 'package:codesprint_app/message.dart';
import 'package:flutter/material.dart';
import 'package:codesprint_app/bottom_nav.dart';

class RequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Requests'),
          backgroundColor: const Color.fromARGB(218, 32, 32, 117),
          foregroundColor: Colors.white,
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: const Color.fromARGB(179, 214, 209, 209),
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'New Tasks'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(currentIndex: 1),
        body: TabBarView(
          children: [
            NewTasksTab(),
            CompletedTasksTab(),
          ],
        ),
      ),
    );
  }
}

class NewTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Water leak fix help!'),
          subtitle: Text('Service Gainer: @Sajani'),
          trailing: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AcceptTask()),
              );
            },
            child: Text('Accept'),
          ),
        ),
        ListTile(
          title: Text('Electric short fix. - Emergency Request!'),
          subtitle: Text('Service Gainer: @Nethmi'),
          tileColor: Colors.redAccent,
          textColor: Colors.black,
          trailing: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AcceptTask()),
              );
            },
            child: Text('Accept'),
          ),
        ),
      ],
    );
  }
}

class CompletedTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Water Filter Installation'),
          subtitle: Text('Completed for: @Sajani'),
          trailing: Icon(Icons.check_circle, color: Colors.green),
        ),
      ],
    );
  }
}

class AcceptTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Accepted')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.thumb_up_alt_rounded, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text(
              'Task accepted successfully!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>MessagesPage()));},child: const Text('Chat with client'),)
          ],
        ),
      ),
    );
  }
}

