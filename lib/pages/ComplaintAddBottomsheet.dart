import 'package:flutter/cupertino.dart';
import 'package:sunstarmovers/pages/Row3.dart';

class ComplaintAddBottomSheet extends StatelessWidget {
  const ComplaintAddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: ListView(
          children: [
            SizedBox(height: 15,),
            Text3(name3: 'Add Complaint'),
          ],
        ),
      ),
    );
  }
}
