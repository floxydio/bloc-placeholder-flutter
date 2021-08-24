import 'package:blocApi/Bloc/ListJson/TodoEvent.dart';
import 'package:blocApi/Bloc/ListJson/TodoState.dart';
import 'package:blocApi/Models/User_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/ListJson/TodoBloc.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TodoBloc todoModels = TodoBloc();
  List<UserModel> listUser = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoModels.add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1.2,
          child: Column(
            children: [
              Container(
                child: SafeArea(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 100,
                        right: 100,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://randomuser.me/api/portraits/men/3.jpg",
                              ),
                            ),
                            SizedBox(height: 10),
                            Column(
                              children: [
                                MyText(
                                  valueText: "Dio Okta Rovelino",
                                ),
                                SizedBox(height: 5),
                                Container(
                                  child: Text("10 Blocked Number",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white54)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 7,
                          left: 10,
                          child: Column(
                            children: [
                              Text(
                                "Spam Call",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                width: 50,
                                height: 3,
                                child: Container(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )),
                      Positioned(
                          bottom: 7,
                          left: 120,
                          child: Column(
                            children: [
                              Text(
                                "Spam Message",
                                style: TextStyle(
                                    fontSize: 15, 
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                width: 50,
                                height: 3,
                                child: Container(),
                              )
                            ],
                          )),
                      Positioned(
                          bottom: 7,
                          right: 60,
                          child: Column(
                            children: [
                              Text(
                                "Setting",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                width: 50,
                                height: 3,
                                child: Container(),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ], color: Colors.blueAccent),
              ),
              SizedBox(height: 20),
              Image.network(
                "https://i1.wp.com/karyapemuda.com/wp-content/uploads/2018/02/contoh-iklan-barang.jpg?w=743&ssl=1",
                height: 150,
              ),
              SizedBox(height: 5),
              Text("ADSENSE CERITANYA :v", style: TextStyle(fontSize: 12)),
              SizedBox(height: 30),
              Container(
                  padding: EdgeInsets.only(left: 10.0),
                  alignment: Alignment.topLeft,
                  child: Text("Daftar Kontak",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18))),
              BlocConsumer<TodoBloc, TodoState>(
                  cubit: todoModels,
                  builder: (context, state) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.all(8.0),
                            leading: Icon(Icons.person),
                            title: Text(listUser[index].email),
                            subtitle: Text(listUser[index].name),
                            trailing: Icon(Icons.phone, color: Colors.green),
                          );
                        });
                  },
                  listener: (context, state) {
                    if (state is TodoLoaded) {
                      print("Loaded");
                      listUser.clear();
                      listUser.addAll(state.userList);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  final String valueText;
  const MyText({
    @required this.valueText,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(valueText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          )),
    );
  }
}
