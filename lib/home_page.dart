import 'package:demo_project/rest_api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final apiService = RestAPIService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiService.getUsers();
    //this is the main thread
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder(
              future: apiService.getUsers(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return ListView.builder(
                    itemCount: snapShot.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1,
                                spreadRadius: 1,
                                color: Colors.grey.withOpacity(0.4),
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: ListTile(
                            title: Text(
                              snapShot.data![index].name ?? '',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),
                            ),
                            subtitle: Text(
                              snapShot.data![index].city ?? '',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ),
                      );
                      //Container(margin: EdgeInsets.all(10),height:50, width: 200, color: Colors.blue,);
                    },
                  );
                } else {
                  return Container(
                    child: const Center(
                      child: Text(
                        'Loading...',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  );
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
