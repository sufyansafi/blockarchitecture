import 'dart:html';

import 'package:blockarchitecture/Block/internetblock.dart';
import 'package:blockarchitecture/Block/interneteventblock.dart';
import 'package:blockarchitecture/Block/internetstateblock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocConsumer(listener: (context, state) {
          if (state is InternetBackstate) {
           ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("fuck"),
            backgroundColor: Colors.green,)
           );
          }

          else  if (state is InternetBackstate) {
           ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("fuck"),
            backgroundColor: Colors.red,)
           );
          }
        }, builder: (context, state) {
          if (state is InternetBackstate) {
            return Text("Connected");
          } else if (state is Internetloststate) {
            return Text("not connected");
          } else {
            return Text("loading");
          }
        }),
        // child: BlocBuilder<InternetBloc, Internetstate>(
        //   builder: (context, state) {
        //     if (state is InternetBackstate) {
        //       return Center(child: Text("Internet connection is back"));
        //     }
        //     // else if (state is Internetloststate) {
        //     //   return Text("not Connected");
        //     // }

        //     else {
        //       return Text("Loading");
        //     }
        //   },
        // ),
      ),
    );
  }
}
