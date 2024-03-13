import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:servisify/pages/loginn.dart';
import 'package:servisify/pages/student_pages/laundary_serviece.dart';
import 'package:servisify/pages/student_pages/logout.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class FoodDelivary extends StatefulWidget {
  const FoodDelivary({Key? key}) : super(key: key);

  @override
  State<FoodDelivary> createState() => _FoodDelivaryState();
}

class _FoodDelivaryState extends State<FoodDelivary> {
  final List<String> profiles = ['Profile', 'Orders', 'Notification', 'Logout'];

  Widget Cards(String imgurl, String foodName, double price) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Ink.image(
            height: 250,
            fit: BoxFit.cover,
            child: InkWell(
              onTap: () {},
            ),
            image: NetworkImage(imgurl),
          ),
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      foodName,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 129, 187, 199),
                      ),
                      child: Center(
                        child: Text(
                          'Price $price',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: RatingBar.builder(
                  glow: true,
                  glowRadius: 3,
                  unratedColor: Color.fromARGB(255, 0, 0, 0),
                  initialRating: 0,
                  minRating: 0,
                  maxRating: 4,
                  allowHalfRating: true,
                  direction: Axis.horizontal,
                  itemCount: 4,
                  itemSize: 30,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 10,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  final List<String> items = [
    'Food Delivery',
    'Laundry',
    'Side Hustle Opportunities'
  ];
  String? selectedValue;

  TextEditingController searchController = TextEditingController();

  late StreamController<List<DocumentSnapshot>> _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = StreamController<List<DocumentSnapshot>>();
  }

  @override
  void dispose() {
    _searchController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width / 7,
                                child: TextField(
                                  controller: searchController,
                                  onChanged: (value) {
                                    _updateSearchResults(value);
                                  },
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 200, 200, 200),
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 160, 159, 159),
                                    hintText: 'Filter a Meal',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  print(
                                      "Search Query: ${searchController.text}");
                                },
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      'Go',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color.fromARGB(255, 0, 150, 181),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: const Row(
                          children: [
                            Icon(
                              Icons.list,
                              size: 16,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                'Select Service',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: items
                            .map(
                              (String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                            .toList(),
                        value: selectedValue,
                        onChanged: (String? value) {
                          setState(() {
                            selectedValue = value;
                            if (selectedValue == 'Laundry') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LaundaryServiece(),
                                ),
                              );
                            }
                            if (selectedValue == 'Food Delivery') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FoodDelivary(),
                                ),
                              );
                            }
                            if (selectedValue == 'Side Hustle Opportunities') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FoodDelivary(),
                                ),
                              );
                            }
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50,
                          width: 160,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: const Color.fromARGB(255, 103, 100, 100),
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down_circle_outlined,
                          ),
                          iconSize: 14,
                          iconEnabledColor: Color.fromARGB(255, 255, 255, 255),
                          iconDisabledColor: Colors.grey,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color.fromARGB(255, 111, 110, 110),
                          ),
                          offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
                            thumbVisibility:
                                MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'About Us',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Contact Us',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          child: Text('A'),
                          backgroundColor: Color.fromARGB(255, 5, 198, 215),
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: const Row(
                              children: [
                                Icon(
                                  Icons.account_circle,
                                  size: 20,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    'Profile',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: profiles
                                .map(
                                  (String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                                .toList(),
                            value: selectedValue,
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value;
                                if (selectedValue == 'Laundry') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const LaundaryServiece(),
                                    ),
                                  );
                                }
                                if (selectedValue == 'Food Delivery') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FoodDelivary(),
                                    ),
                                  );
                                }
                                if (selectedValue == 'Logout') {
                                  Logout().logout(
                                      FirebaseAuth.instance.currentUser);
                                }
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              width: 160,
                              padding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Color.fromARGB(182, 255, 255, 255),
                                ),
                                color: Color.fromARGB(255, 107, 167, 179),
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down_circle_outlined,
                              ),
                              iconSize: 14,
                              iconEnabledColor:
                                  Color.fromARGB(255, 255, 255, 255),
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: const Color.fromARGB(255, 111, 110, 110),
                              ),
                              offset: const Offset(-20, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                    MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  'Find Your Favorite Food Here',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(80),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: StreamBuilder<List<DocumentSnapshot>>(
                      stream: _searchController.stream,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator(
                            color: Color.fromARGB(255, 255, 255, 255),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Text('No results found.');
                        } else {
                          return GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            padding: const EdgeInsets.all(20),
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            crossAxisCount: 5,
                            children: List.generate(
                              snapshot.data!.length,
                              (index) {
                                var doc = snapshot.data![index];
                                return Cards(
                                  doc['image'],
                                  doc['name'],
                                  doc['price'].toDouble(),
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateSearchResults(String query) {
    FirebaseFirestore.instance
        .collection('Food')
        .where('name', isGreaterThanOrEqualTo: query)
        .snapshots()
        .listen((snapshot) {
      _searchController.add(snapshot.docs);
    });
  }
}
