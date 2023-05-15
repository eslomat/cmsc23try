import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../screens/login.dart';
import 'package:health_monitoring_app/providers/data_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_monitoring_app/models/data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    print("Homepage Disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> dataStream = context.watch<DataProvider>().data;
    Stream<User?> userStream = context.watch<AuthProvider>().userStream;

    return StreamBuilder(
        stream: userStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error encountered! ${snapshot.error}"),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData) {
            return const LoginPage();
          }

          // if user is logged in, display the scaffold containing the streambuilder for the homepage
          return displayScaffold(context, dataStream, snapshot.data?.email);
        });
  }

  Scaffold displayScaffold(BuildContext context,
      Stream<QuerySnapshot<Object?>> dataStream, String? email) {
    Data? currentData; // data of current user
    return Scaffold(
        appBar: AppBar(
          title: const Text("Access Permitted"),
        ),
        body: StreamBuilder(
            stream: dataStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error encountered! ${snapshot.error}"),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text("No Data Found"),
                );
              }

              // dataList = list of documents in "data" collection
              List<QueryDocumentSnapshot<Object?>>? dataList =
                  snapshot.data?.docs;
              dataList?.forEach((element) {
                Data data =
                    Data.fromJson(element.data() as Map<String, dynamic>);

                // if email from authentication == email from an element of the dataList (from firebase),
                if (data.email == email) {
                  //  then the data of the current user = data from that element (document from firebase)
                  currentData = data;
                }
              });

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Successfully Logged In As ${currentData?.type}"),
                    TextButton(
                      onPressed: () {
                        context.read<AuthProvider>().signOut();
                      },
                      child: const Text("Sign out"),
                    )
                  ],
                ),
              );
            }));
  }
}
