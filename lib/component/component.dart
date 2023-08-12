// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
 import 'package:iti_projects/modules/booking_tests/cubit/book_cubit.dart';


import '../style/colors.dart';

Widget buildTaskItem(
  {
    required String imagePath,
    required String tasksTitle,
    required IconData icon,
    required String status,
    required Color color,
  }
)=>  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200.0,
                        height: 130.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[100],
                        ),
                        child: Image.asset('$imagePath'),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        '$tasksTitle',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff1E2742),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            icon,
                            color: color,
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            '$status',
                            style: TextStyle(
                                fontSize: 16.0, color: Color(0xff1E2742)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );


Widget buildBookingItem(Map model,context)=>  Dismissible(
  key: Key(model['id'].toString()),
   onDismissed: (direction){
   BookCubit.get(context).deleteData(id: model['id']);
  },
  child:   Padding(
  
              padding: const EdgeInsets.all(20.0),
  
              child: Container(
  
                    padding: EdgeInsets.all(10.0),
  
                    width: double.infinity,
  
                    height: 200.0,
  
                    decoration: BoxDecoration(
  
                      color: Colors.grey[100],
  
                      border: Border.all(width: 1.0, color: Colors.grey),
  
                      borderRadius: BorderRadius.circular(20.0),
  
                    ),
  
                    child:  Column(
  
                        children: [
  
                          Row(
  
                            children: [
  
                              Text(
  
                                'Name: ${model['name']}',
  
                                style: TextStyle(
  
                                    fontSize: 20.0,
  
                                    fontWeight: FontWeight.bold,
  
                                    color: primaryColor),
  
                              ),
  
                              SizedBox(width: 70.0,),
  
                              InkWell(
  
                                onTap: (){},
  
                                child: Text(
  
                                  '${model['gender']}',
  
                                  style: TextStyle(
  
                                    decoration: TextDecoration.underline,
  
                                    fontSize: 18.0,
  
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
  
                                'Test type: ${model['type']}',
  
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
  
                                '${model['date']}',
  
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
  
                                '${model['time']}',
  
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
  
            ),
);

Widget tasksBuilder(
  {
    required List<Map> tasks,
  }
)=> ConditionalBuilder(
          condition: tasks.isNotEmpty,
          builder: (context)=> SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListView.separated(
                  itemBuilder: (context,index)=> buildBookingItem(tasks[index],context),
                   separatorBuilder: (context,index)=> SizedBox(height: 6.0,),
              itemCount: tasks.length
              ),
            ),
          ),
          fallback: (context)=>const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu,
                  color: Colors.grey,
                  size: 70.0,
                ),
                Text('No Tetst yet! , please add tests',style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),)
              ],
            ),
          ),
        );


Widget buildSettingItem1()=> Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          height: 280,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            const Padding(padding: EdgeInsets.all(12)),
             Text(
              "General",
              style: TextStyle(
                color: primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Icon(
                  Icons.rate_review_sharp,
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  "  Rate Us",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.blue,
                  size: 20,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),

            //2second

            Row(
              children: const [
                Icon(
                  Icons.account_box_rounded,
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  "  Business Account",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.blue,
                  size: 20,
                )
              ],
            ),

            const SizedBox(
              height: 15,
            ),

            //third3
            Row(
              children: const [
                Icon(
                  Icons.note_alt,
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  "  Terms & Conditions",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.blue,
                  size: 20,
                )
              ],
            ),

            const SizedBox(
              height: 15,
            ),
            //4fourth
            Row(
              children: const [
                Icon(
                  Icons.privacy_tip,
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  "  Privacy Policy",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.blue,
                  size: 20,
                )
              ],
            ),
          ]),
        );   

 Widget buildSettingItem2()=>  Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            const Padding(padding: EdgeInsets.all(12)),
             Text(
              "Account and Security",
              style: TextStyle(
                color: primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Icon(
                  Icons.update_rounded,
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  "  Update data",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.blue,
                  size: 20,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),

            //2second

            Row(
              children: const [
                Icon(
                  Icons.manage_accounts,
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  "  manage benefeciary",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.blue,
                  size: 20,
                )
              ],
            ),

            const SizedBox(
              height: 15,
            ),

            //third3
            Row(
              children: const [
                Icon(
                  Icons.lock_rounded,
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  "  Change Password",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.blue,
                  size: 20,
                )
              ],
            ),

            const SizedBox(
              height: 15,
            ),
            //4fourth
            Row(
              children: const [
                Icon(
                  Icons.password_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  "  Change Password",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.blue,
                  size: 20,
                )
              ],
            ),
          ]),
        );          