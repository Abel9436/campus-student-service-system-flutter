import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class UploadImageToFirebase extends StatefulWidget {
  const UploadImageToFirebase({Key? key});

  @override
  State<UploadImageToFirebase> createState() => _UploadImageToFirebaseState();
}

class _UploadImageToFirebaseState extends State<UploadImageToFirebase> {
  String _imageFile = '';
  Uint8List? selectedImageInBytes;
  TextEditingController foodNameController = TextEditingController();
  TextEditingController foodPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Image.asset('assets/menu-removebg-preview.png'),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 177, 177, 177)),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width / 4.9,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: ListView(
            children: [
              DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 54, 52, 52)),
                child: Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/OIP.jpg'),
                      ),
                    ),
                    Text(
                      'data',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              ListTile(
                tileColor: Color.fromARGB(255, 187, 185, 185),
                onTap: () {},
                iconColor: const Color.fromARGB(255, 255, 255, 255),
                hoverColor: Color.fromARGB(255, 153, 221, 233),
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                leading: Icon(color: Colors.black, Icons.update),
                title: Text('Update Profile'),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                tileColor: Color.fromARGB(255, 187, 185, 185),
                onTap: () {},
                iconColor: const Color.fromARGB(255, 255, 255, 255),
                hoverColor: Color.fromARGB(255, 153, 221, 233),
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                leading: Icon(Icons.wallet, color: Colors.black),
                title: Text('Integrate Wallet'),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                tileColor: Color.fromARGB(255, 187, 185, 185),
                onTap: () {},
                iconColor: const Color.fromARGB(255, 255, 255, 255),
                hoverColor: Color.fromARGB(255, 153, 221, 233),
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                leading: Icon(color: Colors.black, Icons.update),
                title: Text('Uploaded Foods'),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 111, 111, 111),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text('About Us',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text('Contact US',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold))),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height / 2.5,
                    right: MediaQuery.of(context).size.height / 2.5),
                child: Container(
                  child: Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 10),
                    child: Column(
                      children: [
                        const SizedBox(height: 0),
                        Center(
                          child: Text(
                            'Upload Your Best Food Here',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            pickImage();
                          },
                          child: Container(
                            height: 30,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 49, 180, 210)),
                            child: Center(
                              child: Text(
                                'Pick Food Image',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () async {
                            await uploadImage(selectedImageInBytes!);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 49, 180, 210)),
                              height: 35,
                              width: 300,
                              child: Center(
                                child: const Text(
                                  'Upload Image To Firebase Storage',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                        if (_imageFile.isNotEmpty || _imageFile != '')
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.memory(
                                selectedImageInBytes!,
                                height: 50,
                              ),
                            ),
                          ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              TextField(
                                controller: foodNameController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(211, 209, 233, 233),
                                  hintText: 'Enter Food Name',
                                  border: OutlineInputBorder(),
                                  labelText: 'Food Name',
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: foodPriceController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(211, 209, 233, 233),
                                  hintText: 'Enter Food Price',
                                  border: OutlineInputBorder(),
                                  labelText: 'Food Price',
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(height: 20),
                              TextButton(
                                onPressed: () async {
                                  await uploadFoodData();
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Color.fromARGB(255, 49, 180, 210)),
                                    height: 35,
                                    width: 300,
                                    child: Center(
                                        child: const Text(
                                      'Upload Food Data',
                                      style: TextStyle(color: Colors.white),
                                    ))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(213, 119, 118, 118)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    try {
      FilePickerResult? fileResult = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (fileResult != null) {
        setState(() {
          _imageFile = fileResult.files.first.name!;
          selectedImageInBytes = fileResult.files.first.bytes;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: $e"),
      ));
    }
  }

  Future<String> uploadImage(Uint8List selectedImageInBytes) async {
    try {
      Reference ref = FirebaseStorage.instance.ref().child('Images');
      final metadata = SettableMetadata(contentType: 'image/png');
      UploadTask uploadTask = ref.putData(selectedImageInBytes, metadata);

      await uploadTask.whenComplete(() => ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Image Uploaded"))));

      return await ref.getDownloadURL();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
    return '';
  }

  Future<void> uploadFoodData() async {
    try {
      String imageUrl = await uploadImage(selectedImageInBytes!);

      await FirebaseFirestore.instance.collection('Food').add({
        'name': foodNameController.text,
        'price': double.parse(foodPriceController.text),
        'image': imageUrl,
      });

      setState(() {
        _imageFile = '';
        selectedImageInBytes = null;
        foodNameController.clear();
        foodPriceController.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Food Data Uploaded"),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }
}
