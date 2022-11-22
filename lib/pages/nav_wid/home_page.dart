import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:like_button/like_button.dart';

import '../../model/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            )),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: Text('Post #1'),
                  subtitle: Text('Здесь должен быть пост № 1'),
                  trailing: SizedBox(
                    width: 40,
                    height: 40,
                    child: LikeButton(
                      size: 30,
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Post #2'),
                  subtitle: Text('Здесь должен быть пост № 2'),
                  trailing: SizedBox(
                    width: 40,
                    height: 40,
                    child: LikeButton(
                      size: 30,
                    ),
                  ),
                ),
              ),Card(
                child: ListTile(
                  title: Text('Post #3'),
                  subtitle: Text('Здесь должен быть пост № 3'),
                  trailing: SizedBox(
                    width: 40,
                    height: 40,
                    child: LikeButton(
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}