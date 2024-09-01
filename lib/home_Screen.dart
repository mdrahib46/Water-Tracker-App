import 'package:flutter/material.dart';
import 'package:watertrackerapp/water_track.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final TextEditingController _glassNumberTEController = TextEditingController();
List<WaterTracker> waterTrackerList = [];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        centerTitle: true,
        title: const Text(
          'Water Tracker App',
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
      body: Column(
        children: [
          _buildWaterTrackerCounter(context),
          const SizedBox(
            height: 20,
          ),
          _buildWaterTrackerListView(),
        ],
      ),
    );
  }

  Widget _buildWaterTrackerCounter(BuildContext context) {
    return Column(
      children: [
        Text(
          getTotalGlassCount().toString(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'Glass\'s',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: TextFormField(
                controller: _glassNumberTEController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              height: 50,
              width: 100,
              child: ElevatedButton(
                onPressed: ()=> _onTapAddWaterTrack(),
                child: const Text(
                  'ADD',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 0.7,
                      color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWaterTrackerListView() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return _buildWaterTrackListTile(index);
        },
        itemCount: waterTrackerList.length,
      ),
    );
  }

  Widget _buildWaterTrackListTile(int index) {

    WaterTracker waterTracker = waterTrackerList[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: ListTile(
        tileColor: Colors.blue.shade100,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        title: Text(
          '${waterTracker.dateTime.hour}:${waterTracker.dateTime.minute}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Text(
          '${waterTracker.dateTime.day}/${waterTracker.dateTime.month}/${waterTracker.dateTime.year}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        leading: CircleAvatar(
            backgroundColor: Colors.blue.shade100,
            child:Text('${waterTracker.numberOfGlass}')),
        trailing: IconButton(
            color: Colors.red.shade300,
            onPressed: () {
              _buildOnTapShowAlertDialog(index);
              setState(() {});
            },
            icon: const Icon(Icons.delete)),
      ),
    );
  }

  int getTotalGlassCount() {
    int counter = 0;
    for (WaterTracker t in waterTrackerList) {
      counter += t.numberOfGlass;
    }
    return counter;
  }

  void _onTapAddWaterTrack() {
    if (_glassNumberTEController.text.isEmpty) {
      _glassNumberTEController.text = '1';
    }
    final int numberOfGlass = int.tryParse(_glassNumberTEController.text) ?? 1;
    WaterTracker waterTracker =
        WaterTracker(numberOfGlass: numberOfGlass, dateTime: DateTime.now());
    waterTrackerList.add(waterTracker);
    setState(() {});
  }

  void _onTapDeleteWaterTrack(int index) {
    waterTrackerList.removeAt(index);
    setState(() {});
  }

  void _buildOnTapShowAlertDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blue.shade100,
          contentPadding: EdgeInsets.zero,
          icon: Icon(Icons.error_outline_rounded, size: 70,color: Colors.redAccent.shade100, weight:0.2,),
          title: const Text(
            'Are You Sure ?',
            style: TextStyle(color: Colors.blue),
            textAlign: TextAlign.center,
          ),
          content: const Text(
            'Do you really want to delete this records',
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _onTapDeleteWaterTrack(index);
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

