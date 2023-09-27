// ignore_for_file: invalid_use_of_visible_for_testing_member, sort_child_properties_last
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import "package:images_picker/images_picker.dart";
import '../screens/help.dart';
import '../screens/navBar.dart';
import '../screens/processImage.dart';

enum APP_THEME { LIGHT, DARK }

class MyAppThemes {
  //Method for changing to the light theme
  static ThemeData appThemeLight() {
    return ThemeData(
      // Define the default brightness and colors for the overall app.
      brightness: Brightness.light,
      //appBar theme
      appBarTheme: const AppBarTheme(
        //ApBar's color
        color: Color.fromARGB(255, 21, 76, 121),

        //Theme for AppBar's icons
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      //Theme for app's icons
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),

      //Theme for FloatingActionButton
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //White background
        backgroundColor: Colors.white,

        //Black plus (+) sign for FAB
        foregroundColor: Colors.black,
      ),
    );
  }

  // Method for changing to the dark theme.
  static ThemeData appThemeDark() {
    return ThemeData(
      brightness: Brightness.dark,

      appBarTheme: const AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      iconTheme: const IconThemeData(
        color: Colors.black,
      ),

      //Theme for FloatingActionButton
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //dark background for FAB
        backgroundColor: Colors.black,

        //White plus (+) sign for FAB
        foregroundColor: Colors.white,
      ),
    );
  }
}

//creating a  stateful widget.
class WeedRecognizer extends StatefulWidget {
  const WeedRecognizer({Key? key}) : super(key: key);

  @override
  _WeedRecognizerState createState() => _WeedRecognizerState();
}

class _WeedRecognizerState extends State<WeedRecognizer> {
  //Setting a default theme
  var currentTheme = APP_THEME.LIGHT;

  Future<Uint8List>? memImage;

  File? imageFile;

  File? imageContent;

  // Getting byte data of an image.
  // this byte data will be used to render the image
  // Int8List? _bytes;
  Uint8List? _bytes;

  @override
  void dispose() {
    super.dispose();
  }

// functionality for picking an image from gallery.
  Future<void> pickImage(context) async {
    final image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    } else {
      print('-----------THE PATH TO THE IMAGE FROM GALLERY IS--------- ' +
          image.path);

      setState(() {
        imageFile = File(image.path);

        imageContent = File(image.path);

        print(
            "-----------------picked image content--------------------------- ");

        print(imageContent);
      });

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              ProcessImage(imageFile: imageFile, imageContent: imageContent),
        ),
      );
    }
  }

// functionality for picking an image from camera.
  Future<void> takeImage(context) async {
    // final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    final pickedImage =
        // ignore: invalid_use_of_visible_for_testing_member
        await ImagePicker.platform.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      print('------------THE  PATH TO THE IMAGE FROM THE CAMERA IS-----' +
          pickedImage.path);

      setState(() {
        imageFile = File(pickedImage.path);
        imageContent = File(pickedImage.path);

        print(
            "-----------------picked image content--------------------------- ");
        print(imageContent);
      });

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              ProcessImage(imageFile: imageFile, imageContent: imageContent),
        ),
      );

      //dispose the resources
      //dispose();
    }
  }

  Future dropDown(String value) async {
    // print(value);

    if (value == "Quit") {
      exit(0);
    }
  }

  Future refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // the ThemeData Widget is used to add global themes to the app.
      // setting the theme dynamically.
      theme: currentTheme == APP_THEME.DARK
          ? MyAppThemes.appThemeDark()
          : MyAppThemes.appThemeLight(),
      home: Scaffold(
        drawer: NavBar(),
        appBar: buildAppBarWidget(), //AppBar
        body: buildBodyWidget(), //body

        //Code for FAB (floating Action button)
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.threesixty),
          onPressed: () {
            setState(() {
              // Currently selected theme toggles when FAB is pressed
              currentTheme == APP_THEME.DARK
                  ? currentTheme = APP_THEME.LIGHT
                  : currentTheme = APP_THEME.DARK;
            });
          },
        ),
      ),
    );
  }

  // AppBar of the Scaffold Widget.
  PreferredSizeWidget buildAppBarWidget() {
    return AppBar(
      // leading: IconButton(
      //   icon : const Icon(Icons.menu),
      //   onPressed: () {
      //       print("Menu being  displayed");
      //     },
      // ),
      title: const Text('mlbraca', style: TextStyle(fontSize: 20)),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            refresh();
            print("Application is being refreshed.");
          },
        ),
        PopupMenuButton<String>(
          itemBuilder: (context) => [
            // const PopupMenuItem(
            //   value: "more",
            //   child: Text("More.."),
            // ),
            const PopupMenuItem(
              value: "Quit",
              child: Text("quit"),
            ),
          ],
          onSelected: (String value) {
            dropDown(value);
          },
        ),
      ],
    );
  }

  // building the body section
  Widget buildBodyWidget() {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        SizedBox(
            height: 800.0,
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: Image.asset(
                        'assets/images/cancer.jpeg',
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      child: Container(
                          padding: const EdgeInsets.all(30.0),
                          child: const Text(
                            "Welcome to the mlbraca  mobile application, built to let you detect stage one cancer  diseases in mammogram images  and then enable early intervation through timely decision making.",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          )),
                      top: 140.0,
                      right: 0,
                      left: 0,
                    )
                  ],
                ),

                //Second element in the stack
                Positioned(
                  child: Container(
                      padding: const EdgeInsets.only(
                          top: 600.0 * 0.12,
                          left: 20.0,
                          right: 20.0,
                          bottom: 20.0),
                      height: 400,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          )),
                      child: Builder(
                        builder: (context) => Column(
                          children: <Widget>[
                            // First Row for the observation
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    takeImage(context);

                                    // imageFile != null
                                    //     ? Navigator.of(context).push(
                                    //         MaterialPageRoute(
                                    //             builder: (context) =>
                                    //                 ProcessImage(
                                    //                     imageFile: imageFile)))
                                    //     : print("Failed to pick image");
                                  },
                                  child: Container(
                                      width: 150,
                                      height: 150,
                                      margin:
                                          const EdgeInsets.only(right: 10.0),
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 21, 76, 121),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(75))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Center(
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                  height: 90.0,
                                                  width: 90.0,
                                                  child: Image.asset(
                                                    'assets/icons/observe.png',
                                                    fit: BoxFit.cover,
                                                  )),
                                              const Text(
                                                "Scan image",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    pickImage(context);

                                    // after Navigate to the screen
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(builder: (context) => ProcessImage(imageFile: imageFile)
                                    // ));
                                  },
                                  child: Container(
                                      width: 150,
                                      height: 150,
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 21, 76, 121),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(75))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(25.0),
                                        child: Center(
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                  height: 80.0,
                                                  width: 80.0,
                                                  child: Image.asset(
                                                    'assets/icons/import.png',
                                                    fit: BoxFit.cover,
                                                  )),
                                              const Text(
                                                "Import",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),

                            //End of first Row.

                            //  Second Row for the Text

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    print("Help on how to use the application");

                                    // after Navigate to the screen
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => const Help(),
                                    ));
                                  },
                                  child: Container(
                                      width: 150,
                                      height: 150,
                                      margin: const EdgeInsets.only(top: 10.0),
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 21, 76, 121),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(75))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(25.0),
                                        child: Center(
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                  height: 80.0,
                                                  width: 80.0,
                                                  child: Image.asset(
                                                    'assets/icons/help.png',
                                                    fit: BoxFit.cover,
                                                  )),
                                              const Text(
                                                "Help",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            )

                            //end of the second Row
                          ],
                        ),
                      )),
                  right: 0,
                  left: 0,
                  top: 900.0 * 0.3,
                  bottom: 0,
                ),
              ],
            )),
      ],
    ));
  }
}
