import 'package:flutter/material.dart';
import 'package:hk_policestation_hq/controllers/Controllers.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children:[
        //   '${Controllers().userFetchData.email}',
        //   style: const TextStyle(color: Colors.red),
        // ),

        TextFormField(
          
        ),
        Text(
          '${Controllers().userFetchData.phone}',
          style: const TextStyle(color: Colors.red),
        ),
        ],
      ),
    );
  }
}
