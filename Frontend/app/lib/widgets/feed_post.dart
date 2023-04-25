// ignore_for_file: prefer_const_constructors, prefer_const_declarations, avoid_function_literals_in_foreach_calls

/*
The code in this file is used to build a widget for the page that performs the functionality of feed post
 using cloud firestore in REAL TIME. It is serverless and not using any API
*/

import 'package:app/widgets/feed_input_widget.dart';
import 'package:app/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewFeed extends StatefulWidget {
  const ViewFeed({super.key});

  @override
  State<ViewFeed> createState() => _ViewFeedState();
}

class _ViewFeedState extends State<ViewFeed> {
  List<Map<String, dynamic>> posts = [];

  void getPosts() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference postsRef = firestore.collection('posts');

    postsRef.orderBy('timestamp', descending: true).snapshots().listen((snapshot) {
      print('Snapshot Recieved');
      List<Map<String, dynamic>> newposts = [];
      snapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        newposts.add(data);
      });
      setState(() {
        posts = newposts;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "FEED",
            style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SliverToBoxAdapter(child: Divider()),
        SliverToBoxAdapter(child: FeedInput()),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              Map<String, dynamic> post = posts[index];
              return PostCard(
                text: post['text'],
                email: post['email'],
              );
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}
