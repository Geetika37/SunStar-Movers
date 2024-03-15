import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        shadowColor: Colors.red,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
        backgroundColor: Colors.red,
        toolbarHeight: 80,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: ImageIcon(
              AssetImage('assets/chevron-left.png'),
              color: Colors.white,
            )),
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Notification",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Colors.white),
          ),
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 20,),
            NotificationRow(),

            SizedBox(height: 10,),
            new Divider(color: Colors.grey.shade300,),
            SizedBox(height: 10,),

            NotificationRow(),

            SizedBox(height: 10,),
            new Divider(color: Colors.grey.shade300,),
            SizedBox(height: 10,),

            NotificationRow(),

            SizedBox(height: 10,),
            new Divider(color: Colors.grey.shade300,),
            SizedBox(height: 10,),

            NotificationRow(),

            SizedBox(height: 10,),
            new Divider(color: Colors.grey.shade300,),
            SizedBox(height: 10,),

            NotificationRow()
          ],
        ),
      ),

    );
  }
}



class NotificationRow extends StatelessWidget {
  const NotificationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xfffFDE4E5),
          child: Image.asset('assets/notification.png'),
        ),
        SizedBox(width: 10,),
        Flexible(child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting ',maxLines: 2,style: TextStyle(fontFamily: 'Poppins',fontSize: 14,fontWeight: FontWeight.w400),)),
        Column(
          children: [
            Text('14h',style: TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w400)),
            Icon(Icons.more_horiz_outlined)
          ],
        )
      ],
    );
  }
}
