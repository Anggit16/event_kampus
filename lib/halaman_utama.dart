import 'package:flutter/material.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  List<bool> isNotificationActiveList = []; // List of booleans to track notification status for each event

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Event Kampus'),
        ),
        body: TabBarView(
          children: <Widget>[
            _buildEventTab(context),
            _buildMyEventTab(context),
            Center(
              child: Text("Akun"),
            ),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.calendar_month),
              text: "Event",
            ),
            Tab(
              icon: Icon(Icons.list),
              text: "My Event",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventTab(BuildContext context) {
    // Mock data for events
    List<Map<String, dynamic>> events = [
      {"title": "Event 1", "description": "Deskripsi event 1"},
      {"title": "Event 2", "description": "Deskripsi event 2"},
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Cari Berdasarkan Kategori',
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                  },
                  tooltip: 'Select Date',
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Daftar Event",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: events.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildEventCard(events[index]);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(Map<String, dynamic> eventData) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              eventData['title'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              eventData['description'],
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMyEventTab(BuildContext context) {
    List<Map<String, dynamic>> events = [
      {"title": "My Event 1", "description": "Deskripsi my event 1"},
      {"title": "My Event 2", "description": "Deskripsi my event 2"},
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "My Event",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: events.length,
              itemBuilder: (BuildContext context, int index) {
                // Initialize isNotificationActiveList with false for each event if it's not already initialized
                if (isNotificationActiveList.length <= index) {
                  isNotificationActiveList.add(false);
                }
                return _buildMyEventCard(events[index], index);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMyEventCard(Map<String, dynamic> eventData, int index) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventData['title'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    eventData['description'],
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  // Ketika lonceng diklik, ubah statusnya
                  isNotificationActiveList[index] = !isNotificationActiveList[index];
                });
              },
              child: Icon(
                isNotificationActiveList[index] ? Icons.notifications_active : Icons.notifications_off,
                color: isNotificationActiveList[index] ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HalamanUtama(),
  ));
}
