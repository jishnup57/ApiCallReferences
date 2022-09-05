import 'package:apiparcing/service/medicine_service.dart';
import 'package:flutter/material.dart';

class MedicineHome extends StatelessWidget {
  const MedicineHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () async{
            final result= await MedicineApiCall.fetchUser();
            print(result.problem.first.diabetes.first.medications.first.medicationsClasses.first.className.first.associatedDrug.first.name);
            },
            child: const Icon(Icons.medication_outlined)),
      ),
    );
  }
}
