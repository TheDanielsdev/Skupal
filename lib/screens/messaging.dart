import 'package:flutter/material.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/models/messaging_model.dart';
import 'package:skupal/models/messaging_populate.dart';

final msg = Messaging_Populate.messagingFnc();

class Messaging extends StatefulWidget {
  Messaging_Model? messaging;
  Messaging({Key? key, this.messaging}) : super(key: key);

  @override
  State<Messaging> createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 90, 0),
                    child: Text("Your Messages",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Image.asset('assets/hamburger.png'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.Subtle,
                    border: Border.all(color: AppColor.Subtle),
                    borderRadius: BorderRadius.circular(5)),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: TextFormField(
                  //fix this later
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black12,
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.black12)),
                  expands: true,
                  minLines: null,
                  maxLines: null,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(color: Colors.white),
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 0, 0),
                      child: Image.asset(
                        'assets/' + msg[0].img!,
                      ),
                    ),
                    Positioned(
                      top: 15,
                      left: 70,
                      child: Text('David Collen',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                        top: 35,
                        left: 70,
                        child: Text(
                          'How are you?',
                          style: TextStyle(
                              color: Colors.black12,
                              fontWeight: FontWeight.bold),
                        )),
                    Positioned(
                        top: 20,
                        left: 240,
                        child: Image.asset('assets/mark_double.png')),
                    Positioned(top: 18, left: 260, child: Text('6:55AM')),
                    Positioned(
                      top: 35,
                      left: 285,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.Main_Color,
                            borderRadius: BorderRadius.circular(50)),
                        width: 20,
                        height: 20,
                        child: Center(
                          child: Text(
                            '5',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Container(
                decoration: BoxDecoration(color: Colors.white),
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 0, 0),
                      child: Image.asset(
                        'assets/Flyd.png',
                      ),
                    ),
                    Positioned(
                      top: 15,
                      left: 70,
                      child: Text('Floyd Miles',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                        top: 35,
                        left: 70,
                        child: Text(
                          'I just sent you the files',
                          style: TextStyle(
                              color: Colors.black12,
                              fontWeight: FontWeight.bold),
                        )),
                    Positioned(
                        top: 20,
                        left: 240,
                        child: Image.asset('assets/mark_double.png')),
                    Positioned(top: 18, left: 260, child: Text('6:55AM')),
                  ],
                )),
            Container(
                decoration: BoxDecoration(color: Colors.white),
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 0, 0),
                      child: Image.asset(
                        'assets/theresa.png',
                      ),
                    ),
                    Positioned(
                      top: 15,
                      left: 70,
                      child: Text('Theresa Webb',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                        top: 35,
                        left: 70,
                        child: Text(
                          'When can you deliver?',
                          style: TextStyle(
                              color: Colors.black12,
                              fontWeight: FontWeight.bold),
                        )),
                    Positioned(
                        top: 20,
                        left: 240,
                        child: Image.asset('assets/mark_double.png')),
                    Positioned(top: 18, left: 260, child: Text('6:55AM')),
                    // Positioned(
                    //   top: 35,
                    //   left: 285,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         color: AppColor.Main_Color,
                    //         borderRadius: BorderRadius.circular(50)),
                    //     width: 20,
                    //     height: 20,
                    //     child: Center(
                    //       child: Text(
                    //         '5',
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: AppColor.Main_Color,
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business_center_outlined), label: 'Gigs'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/loan nav.png'), label: 'Loans')
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
