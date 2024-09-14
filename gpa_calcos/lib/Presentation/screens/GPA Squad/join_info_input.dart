import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpa_calcos/Presentation/Custom/files/Toast/showtoast.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
class JoinSquadPage extends StatefulWidget {
  const JoinSquadPage({super.key});

  @override
  State<JoinSquadPage> createState() => _JoinSquadPageState();
}

class _JoinSquadPageState extends State<JoinSquadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.color4,
      appBar: AppBar(
        backgroundColor: MainColors.color4,
        leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: const Icon(CupertinoIcons.xmark),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center ,
                children: [
                   Text('Join an existing squad',style: TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.w600,
                     fontSize: 18.sp,
                   ),),
                 const  SizedBox(height: 4,),
                  Text('Enter an invite below to join an existing squad',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 13.sp,
                  ),),
              ],),
            ),
            const SizedBox(height: 16,),
            const Text('Invite link',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),),
           const  SizedBox(height: 4,),
            SizedBox(
              height: 46,
              width: 351,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'https://gpa_guide/hTKzmak',
                  border:InputBorder.none,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    // Border when not focused
                    borderRadius: BorderRadius.circular(15),
                    borderSide:BorderSide.none
                  ),
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),

                ),
              ),
            ),
            const SizedBox(height: 10,),
          const   Text('Invites should be like https://gpa_guide.gg/hTKzmak or https://gpa_guide/cool-people',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),),
     const  Spacer(),
      GestureDetector(
        onTap: (){
          showToast(message: 'Coming soon');
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical:5 ),
          padding:const  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          decoration: BoxDecoration(
            color: MainColors.color2,
            borderRadius: BorderRadius.circular(10),
          ),
          child:const Text(
            'Join with Invite link',
            style:  TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),),
        ),
      ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Divider(color: MainColors.color1),
              Text(
                'Or',
                style:TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: MainColors.color1,
                ),),
              Divider(color: MainColors.color1,),
            ],),
            GestureDetector(
              onTap: (){
                showToast(message: 'Coming soon');
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical:5 ),
                padding:const  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  color: MainColors.color5,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:Text(
                  'Join a student hub',
                  style:TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: MainColors.color1,
                  ),),
              ),
            ),

           const  SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
