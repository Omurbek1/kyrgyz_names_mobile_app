import 'package:flutter/material.dart';
import 'api_service.dart';
import 'name_details_page.dart';
import 'name_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Name>> futureNames;

  @override
  void initState() {
    super.initState();
    futureNames = ApiService().fetchNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kyrgyz Names')),
      body: FutureBuilder<List<Name>>(
        future: futureNames,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Name> names = snapshot.data!;
            return ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(names[index].name),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NameDetailsPage(name: names[index]),
                  )),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
