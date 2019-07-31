import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  //   AlertDialog dialog = new AlertDialog(
  //   content: new Text("Dialog is up..", style: new TextStyle(fontSize: 30.0)),
  //   title: new Text('Hello'),
  // );

  // int current_step=1;
  // List<Step> my_steps = [
  //           new Step(
  //             title: new Text("Step 1"),
  //             content: Text("Some content 1"),
  //             isActive: true
  //           ),
  //           new Step(
  //             title: new Text("Step 2"),
  //             content: Text("Some content 2"),
  //             isActive: true
  //           ),
  //           new Step(
  //             title: new Text("Step 3"),
  //             content: Text("Some content 3"),
  //             isActive: true
  //           ),];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text('UtilsApp'),
        bottom: new TabBar(
          
          controller: tabController,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.favorite),
            ),
            new Tab(
              icon: new Icon(Icons.email),
            )
          ],
        ),
      ),
      body: new TabBarView(
        children: <Widget>[new NewPage("First"), new NewPage("Second")],
        controller: tabController,
      ),
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>print("Pressed"),
        backgroundColor: Colors.tealAccent,
      ),
      // body:new Container(
      //   child: new Stepper(
      //     steps: my_steps,
      //     currentStep: this.current_step,
      //     type: StepperType.horizontal,

      //   ),
      // ) ,

      //   body: new Container(
      //   child: new Center(
      //     child: new RaisedButton(
      //       child: new Text(
      //         'press me',
      //         style: new TextStyle(color: Colors.white),
      //       ),
      //       color: Colors.greenAccent,
      //       // onPressed: () => Scaffold.of(context).showSnackBar(new SnackBar(
      //       //   content: new Text('I am Pressed'),
      //       //   duration: new Duration(seconds: 3),
      //       // )),
      //       onPressed: () => showDialog(
      //         context: context,
      //         child: dialog
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class NewPage extends StatelessWidget {
  final String title;
  NewPage(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Text(title),
      ),
    );
  }
}
