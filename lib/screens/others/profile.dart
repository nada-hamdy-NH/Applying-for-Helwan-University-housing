import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdina1/core/controllers/oldStudent/upDate/update_cubit.dart';
import 'package:mdina1/core/controllers/oldStudent/upDate/update_status.dart';
import 'package:mdina1/screens/others/updateProfile.dart';
import 'package:mdina1/widgets/drower.dart';

import '../../core/controllers/oldStudent/getProfileData/GetProfileStatus.dart';
import '../../core/controllers/oldStudent/getProfileData/get_profileData_cubit.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}
bool _rebuildPage = false ;
class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProfileCubit ,GetProfileStatus >( listener:(context , state){} ,builder:(context , state){
    var  getProfileData = GetProfileCubit.get(context) ;
    if(getProfileData.newStudents!.student.gender =="Male"){
      getProfileData.newStudents!.student.gender == "ذكر";
    }else{
      getProfileData.newStudents!.student.gender == "مؤنث";
    }
    if(getProfileData.newStudents!.student.religion =="muslim"){
      getProfileData.newStudents!.student.religion == "مسلم";
    }else{
      getProfileData.newStudents!.student.religion == "مسيحي";
    }
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff003c70),
            title: Text('بيانات الطالب',style: TextStyle(color:Color(0xffac8600),fontWeight: FontWeight.bold),),
            centerTitle: true,
          ),
          endDrawer: home_drawer(),
          body: Column(
              children: [
                Padding(padding: const EdgeInsets.only(left: 270 , top: 10, bottom: 20),
                    child:CircleAvatar(
                      radius: 40,
                      child:ClipOval(child:  Container(
                          decoration: const BoxDecoration(
                              image:DecorationImage(image: NetworkImage('https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg'),
                                  fit: BoxFit.cover
                              ))
                      ) ,)
                      ,)),
               Directionality(
                  textDirection: TextDirection.rtl,
                  child:
                  Card(
                    color: Colors.grey.shade50,
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: RichText(
                        text:  TextSpan(
                          style: TextStyle(fontSize: 20, color: Colors.black ,fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(text: 'اسم  : ' , style: TextStyle(color:Color(0xffac8600),fontSize: 16,fontWeight: FontWeight.bold)),
                            TextSpan(
                              text:'${getProfileData.newStudents!.student.name}' ,
                              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff003c70)),
                            ),

                          ],
                        ),
                      ),

                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text:  TextSpan(
                              style: TextStyle(fontSize: 16, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(text: 'اسم الاب : ' , style: TextStyle(color: Color(0xffac8600),fontSize: 16,fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text:'${getProfileData.newStudents!.student.fatherName}' ,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff003c70)),
                                ),

                              ],
                            ),
                          ),
                          RichText(
                            text:  TextSpan(
                              style: TextStyle(fontSize: 16, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(text: 'الرقم القومى : ' , style: TextStyle(color: Color(0xffac8600),fontSize: 16,fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text:'${getProfileData.newStudents!.student.nationalID}' ,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff003c70)),

                                ),

                              ],
                            ),
                          ),
                          RichText(
                            text:  TextSpan(
                              style: TextStyle(fontSize: 16, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(text: 'الديانة : ' , style: TextStyle(color: Color(0xffac8600),fontSize: 16,fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text:'${getProfileData.newStudents!.student.religion}' ,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff003c70)),
                                ),

                              ],
                            ),
                          ),
                          RichText(
                            text:  TextSpan(
                              style: TextStyle(fontSize: 16, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(text: 'الجنسية : ' , style: TextStyle(color: Color(0xffac8600),fontSize: 16,fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text:'${getProfileData.newStudents!.student.gender}' ,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff003c70)),
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ) ,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xff003c70)

                  ),
                  width: 300,
                  height: 40,
                  child:ElevatedButton(
                      style:ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xffac8600)),

                      ),
                      child: const Text("التعديل على المعلومات  الشخصية ",
                      ),
                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateStudentProfile()));}

                    // details.onStepContinue,
                  ) ,),
                SizedBox(height: 100,)

              ]
          )
      );
    } );


  }
}