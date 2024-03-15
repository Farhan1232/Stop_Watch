import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class stopwatch extends StatefulWidget {
  const stopwatch({super.key});

  @override
  State<stopwatch> createState() => _stopwatchState();
}

class _stopwatchState extends State<stopwatch> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _stopWatchTimer.dispose();
  }

  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _ishour = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Center(child: Text('Stop Watch'),),
    elevation: 0.0,backgroundColor: Colors.amber[200],
    ),backgroundColor: Colors.amber[200],
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
                stream: _stopWatchTimer.rawTime,
                initialData: 0,
                builder: (context, Snapshot) {
                  final value = Snapshot.data;
                  final displaytime =
                      StopWatchTimer.getDisplayTime(value!, hours: _ishour);
                  return Column(children: [
                          Text(displaytime,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 50,),
                  
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      ElevatedButton(
                          onPressed: () {
                            _stopWatchTimer.onStartTimer();
                          },
                          child: Text(
                            'Start',
                          )),SizedBox(width: 10,),
                      ElevatedButton(
                          onPressed: () {
                            _stopWatchTimer.onStopTimer();
                          },
                          child: Text(
                            'Stop',
                          )),SizedBox(width: 10,),
                      ElevatedButton(
                          onPressed: () {
                            _stopWatchTimer.onResetTimer();
                          },
                          child: Text(
                            'Reset',
                          )),
                    ],
                  )]);
                }),
          ],
        ),
      ),
    );
  }
}
