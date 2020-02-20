import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll and Tabs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin{
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState(){
    _tabController = TabController(vsync: this, length: 2);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose(){
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled){
          return <Widget>[
            SliverAppBar(
              title: Text('Tab Controller Example'),
              pinned: true,
              floating: true,
              forceElevated: boxIsScrolled,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: 'Home Page',
                    icon: Icon(Icons.home),
                  ),
                  Tab(
                    text: 'Support Page',
                    icon: Icon(Icons.help),
                  ),
                ],
                controller: _tabController,
              ),
            )
          ];
        },
        body: TabBarView(
          children: <Widget>[
            PageOne(),
            PageTwo(),
          ],
          controller: _tabController,
        )
      ),
    );
  }
}

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Image.network('https://images.unsplash.com/photo-1430116267665-e7f6b3dafce3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80');
  }
}

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 250.0,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(10.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(
            5.0
          ),
          color: index % 2 == 0 ? Colors.cyan : Colors.deepOrange,
          child: Center(
            child: Text(
              index.toString()
            ),
          ),
        ),
      )
    );
  }
}



///Under here is the old one!
///This one is not as dynamic but good to have I guess
class MyHomePage2 extends StatefulWidget {
  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Example App'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Home',
                icon: Icon(Icons.home),
              ),
              Tab(
                text: 'Help',
                icon: Icon(Icons.help),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            PageHome(),
            PageHelp(),
          ],
        ),
      ),
    );
  }
}

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Center(
          child: Text(
            'Home',
            style: TextStyle(
              color: Colors.red,
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}

class PageHelp extends StatefulWidget {
  @override
  _PageHelpState createState() => _PageHelpState();
}

class _PageHelpState extends State<PageHelp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Support',
          style: TextStyle(
            color: Colors.red,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
