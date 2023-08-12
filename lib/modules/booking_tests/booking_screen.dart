// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:iti_projects/modules/booking_tests/cubit/book_cubit.dart';

import '../../style/colors.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  var nameController = TextEditingController();
  var typeController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var generrController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit, BookState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        BookCubit cubit = BookCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            titleSpacing: 55.0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Booking',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: primaryColor,
                    ),
                  ],
                ),
                Text(
                  'Menofia, Sadat city',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  maxRadius: 15.0,
                  minRadius: 10.0,
                  backgroundColor: Colors.white60,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.black,
                      ))),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 25.0,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 25.0,
                  )),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200.0,
                      child: Image.asset('assets/images/image3.png'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'Make your booking',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/images/lab.png',
                          height: 70.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Name must be not empty';
                        }
                        return null;
                      },
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: secondaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Name',
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Type must be not empty';
                        }
                        return null;
                      },
                      controller: typeController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.label,
                          color: secondaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Test type',
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((value) {
                          timeController.text =
                              value!.format(context).toString();
                        });
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Time must be not empty';
                        }
                        return null;
                      },
                      controller: timeController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.watch_later_outlined,
                          color: secondaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Test Time',
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.parse('2023-12-30'),
                        ).then((value) {
                          dateController.text =
                              DateFormat.yMMMd().format(value!);
                        });
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Date must be not empty';
                        }
                        return null;
                      },
                      controller: dateController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.calendar_month,
                          color: secondaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Test Date',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                            value: 'Male',
                            groupValue: cubit.gender,
                            onChanged: (value) {
                              cubit.toggelRadioValue(value);
                            }),
                        Text(
                          'Male',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                        Radio(
                            value: 'Female',
                            groupValue: cubit.gender,
                            onChanged: (value) {
                              cubit.toggelRadioValue(value);
                            }),
                        Text(
                          'Female',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      child: TextButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0.5),
                              backgroundColor:
                                  MaterialStateProperty.all(secondaryColor)),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.InsertToDatabase(
                                name: nameController.text,
                                type: typeController.text,
                                time: timeController.text,
                                date: dateController.text,
                                gender: cubit.gender,
                              );
                            }
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Booking result'),
                                  content: Text(
                                      'You can see Your booking in Tests screen.'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'))
                                  ],
                                );
                              },
                            );
                          },
                          child: Text(
                            'Book Test',
                            style:
                                TextStyle(color: Colors.white, fontSize: 23.0),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
