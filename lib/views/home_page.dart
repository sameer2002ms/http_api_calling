import 'dart:math';

import 'package:api_calling/models/post.dart';
import 'package:api_calling/services/remote_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isloaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }
  getData() async{
    posts = await RemoteService().getPosts();
    if(posts != null){
      setState(() {
        isloaded = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: [
              Text(posts![index].title,
              maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(posts![index].body ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      }),
    );
  }
}
