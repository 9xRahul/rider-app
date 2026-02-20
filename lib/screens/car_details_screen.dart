import 'package:flutter/material.dart';

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay? picked;

  Future<Null> selectTime(BuildContext context) async {
    picked = await showTimePicker(context: context, initialTime: _time);
    setState(() {
      _time = picked!;

      print(picked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Colors.black, Colors.yellow],
          ),
        ),
        height: 3000,
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: .spaceBetween,

                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Text(
                    "Book Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(),
                ],
              ),
            ),
            Icon(Icons.car_crash, color: Colors.yellow, size: 100),

            Container(
              height: 500,
              width: 1000,
              color: Colors.black87,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            "Taxt Bsic",
                            style: TextStyle(color: Colors.white),
                          ),
                          Row(
                            children: [
                              Text(
                                "4.2",
                                style: TextStyle(color: Colors.yellow),
                              ),
                              Icon(Icons.star, color: Colors.yellow),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Will be arrived in 15 min",
                      style: TextStyle(color: Colors.white),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.arrow_upward, color: Colors.white),

                                  Column(
                                    mainAxisAlignment: .start,
                                    crossAxisAlignment: .start,
                                    children: [
                                      Text(
                                        "Pickup",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "St marys hospital",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),

                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_downward,
                                    color: Colors.white,
                                  ),

                                  Column(
                                    mainAxisAlignment: .start,
                                    crossAxisAlignment: .start,
                                    children: [
                                      Text(
                                        "Pickup",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "St marys hospital",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.access_alarm, color: Colors.black),
                                Text(
                                  "8km",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.access_alarm, color: Colors.black),
                                Text(
                                  "8km",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.access_alarm, color: Colors.black),
                                Text(
                                  "8km",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Center(
                              child: Text(
                                "3",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Center(
                              child: Text(
                                "4",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        Text("${selectedDate.toLocal()}".split(' ')[0]),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: const Text('Select date'),
                        ),
                        Text("${selectedDate.toLocal()}".split(' ')[0]),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () => selectTime(context),
                          child: Row(children: [const Text('Pick up time')]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 80),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(child: Text("Book Now")),
            ),
          ],
        ),
      ),
    );
  }
}
