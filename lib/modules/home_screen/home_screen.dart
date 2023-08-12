// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:iti_projects/component/component.dart';
import 'package:iti_projects/models/tasks_model.dart';
import 'package:iti_projects/style/colors.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<TasksModel> tasksList = [
    TasksModel(
        imagePath: 'assets/images/image1a.png',
        tasksTitle: 'Blood test',
        icon: Icons.check_circle,
        statu: 'Completed',
        color: Colors.green),
    TasksModel(
        imagePath: 'assets/images/image1b.png',
        tasksTitle: 'White blood cell',
        icon: Icons.error,
        statu: 'Pending',
        color: Colors.deepOrange),
    TasksModel(
        imagePath: 'assets/images/image1c.png',
        tasksTitle: 'Urinalysis',
        icon: Icons.check_circle,
        statu: 'Completed',
        color: Colors.green),
    TasksModel(
        imagePath: 'assets/images/image1a.png',
        tasksTitle: 'Vanillylmandelic Acid',
        icon: Icons.error,
        statu: 'Pending',
        color: Colors.deepOrange),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Welcome',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
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
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(width: 1.0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hello, Omar',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Add a detailed profile  ',
                          style: TextStyle(
                            fontSize: 15.0,
                            color:  primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          'personalised suggestions',
                          style: TextStyle(
                            fontSize: 15.0,
                            color:  primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: 150.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: (){},
                              child: Text(
                                'Set up profile',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/banner2.png',
                      height: 99.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(width: 1.0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Uncoming',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: (){},
                          child: Text(
                            'View All Tasks',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: secondaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Blood Testing',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '12 June, Monday',
                          style: TextStyle(
                            fontSize: 15.0,
                            color:  primaryColor,
                          ),
                        ),
                        SizedBox(width: 4.0,),
                        Icon(Icons.calendar_month,color:  primaryColor,),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Text(
                          '12:30 PM',
                          style: TextStyle(
                            fontSize: 15.0,
                            color:  primaryColor,
                          ),
                        ),
                        SizedBox(width: 4.0,),
                        Icon(Icons.watch_later_outlined,color:  primaryColor,),
                        Spacer(),
                        CircleAvatar(
                          maxRadius: 16.0,
                          backgroundColor: secondaryColor,
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        CircleAvatar(
                          maxRadius: 16.0,
                          backgroundColor: secondaryColor,
                          child: Icon(
                            Icons.chat,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          '1',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Medical Tests',
                    style: TextStyle(
                      fontSize: 20.0,
                      color:  primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: (){},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 200.0,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildTaskItem(
                        imagePath: tasksList[index].imagePath,
                        tasksTitle: tasksList[index].tasksTitle,
                        icon: tasksList[index].icon,
                        status: tasksList[index].statu,
                        color: tasksList[index].color),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 10.0,
                        ),
                    itemCount: tasksList.length),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(width: 1.0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Are you tired?',
                          style: TextStyle(
                            fontSize: 22.0,
                            color:  primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'With our application ',
                          style: TextStyle(
                            fontSize: 15.0,
                            color:  primaryColor,
                          ),
                        ),
                        Text(
                          'help you to find ',
                          style: TextStyle(
                            fontSize: 15.0,
                            color:  primaryColor,
                          ),
                        ),
                        Text(
                          'your comfort.',
                          style: TextStyle(
                            fontSize: 15.0,
                            color:  primaryColor,
                          ),
                        ),
                        TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                     primaryColor)),
                            onPressed: () {},
                            child: Text(
                              'Book your test now ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
                    Image.asset('assets/images/image2.png'),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
            ],
          ),
        ),
      ),
    );
  }
}
