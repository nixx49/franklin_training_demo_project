import 'package:demo_project/rest_api_service.dart';
import 'package:demo_project/user.dart';
import 'package:demo_project/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final apiService = RestAPIService();
  List<User> userList = [];
  List<bool> favouriteStatusList = [];
  List<User> favouriteUserList = [];

  late Icon favouriteIcon;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiService.getUsers().then((value) {
      if (value.isNotEmpty) {
        for (User user in value) {
          favouriteStatusList.add(false);
        }
      }

      // setState(() {
      //   userList = value;
      // });
    });

    favouriteIcon = const Icon(
      Icons.favorite_border,
      color: Colors.red,
    );

    //this is the main thread, after background thread is completed, it will work.
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
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserScreen(
                                        user: snapShot.data![index],
                                      )));
                        },
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
                            leading: ClipOval(
                              child: Image.network(
                                snapShot.data![index].image,
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            trailing: IconButton(
                              icon: getFavouriteIcon(index),
                              onPressed: () {
                                setState(() {
                                  favouriteStatusList[index] =
                                      !favouriteStatusList[index];
                                  // if(favouriteStatusList[index]){
                                  //   favouriteStatusList[index] = false;
                                  // }
                                  if (favouriteUserList
                                      .contains(snapShot.data![index])) {
                                    favouriteUserList
                                        .remove(snapShot.data![index]);
                                  } else {
                                    favouriteUserList
                                        .add(snapShot.data![index]);
                                  }
                                });

                                // for(var item in favouriteUserList){
                                //   print(item.name);
                                // }
                              },
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
                        child: SpinKitCircle(
                      color: Colors.cyan,
                    )),
                  );
                }
              },
            )),
          ],
        ),
      ),
    );
  }

  Icon getFavouriteIcon(int index) {
    if (favouriteStatusList[index]) {
      return const Icon(
        Icons.favorite,
        color: Colors.red,
      );
    } else {
      return const Icon(
        Icons.favorite_border_outlined,
        color: Colors.red,
      );
    }
  }
}
