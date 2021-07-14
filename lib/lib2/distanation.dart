import 'package:flutter/material.dart';
import 'package:gsg_first_project/lib2/user_info.dart';
class Destination extends StatelessWidget {
  final UserInfo userInfo;
  Destination(this.userInfo);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${userInfo.userName}\n'
                '${userInfo.email}\n'
                '${userInfo.password}\n'
                '${userInfo.companyAddress ?? ''}\n'
                '${userInfo.shopName ?? ''}\n'
                '${userInfo.pio ?? ''}\n'
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text('Log out'))
          ],
        ),
      ),
    );
  }
}
