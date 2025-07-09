import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ContainarDonation extends StatefulWidget {
  const ContainarDonation ({super.key});

  @override
  State<ContainarDonation> createState() => _ContainarDonationState();
}

class _ContainarDonationState extends State<ContainarDonation> {

  // TextEditingController nameController = TextEditingController();
  // TextEditingController ageController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController governorateController = TextEditingController();
  // TextEditingController cityController = TextEditingController();
  // TextEditingController bloodTypeController = TextEditingController();
  // TextEditingController latestDonationController = TextEditingController();
  // TextEditingController conditionController = TextEditingController();

  // final formKey = GlobalKey<FormState>();

   List<String> itemlist = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  String? selecteditem = 'O-';

  List<String> gov = [
    'Alexandria',
    'Assiut',
    'Aswan',
    'Beheira',
    'Bani Suef',
    'Cairo',
    'Daqahliya',
    'Damietta',
    'Fayyoum',
    'Gharbiya',
    'Giza',
    'Helwan',
    'Ismailia',
    'Kafr El Sheikh',
    'Luxor',
    'Marsa Matrouh',
    'Minya',
    'Monofiya',
    'New Valley',
    'North Sinai',
    'Port Said',
    'Qalioubiya',
    'Qena',
    'Red Sea',
    'Sharqiya',
    'Sohag',
    'South Sinai',
    'Suez',
    'Tanta'
  ];

  String? selectedgov = 'Cairo';

  List<String> con = ["Available", "Not available"];

  String? selectedcon = "Available";

  // @override
  // void dispose() {
  //   nameController.dispose();
  //   ageController.dispose();
  //   phoneController.dispose();
  //   governorateController.dispose();
  //   cityController.dispose();
  //   bloodTypeController.dispose();
  //   latestDonationController.dispose();
  //   conditionController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Form(
      // key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Container(
          height: 590,
          width: 370,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 153, 49, 49),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0),
                spreadRadius: 0,
                blurRadius: 10,)],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            child: Column(children: [
           SizedBox(height: 20.h,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Name:",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                    height: 50,
                    width: 220,
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 249, 211, 208)),
                    ))
              ],
            ),
            SizedBox(height: 15.h,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Age:",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                    height: 50,
                    width: 220,
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 249, 211, 208)),
                    ))
              ],
            ),
            SizedBox(height: 15.h,),
            const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Phone:",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                  height: 50,
                  width: 220,
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true, fillColor: Color.fromARGB(255, 249, 211, 208)),
                  ))
            ]),
            SizedBox(height: 15.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Governorate:",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                    height: 50,
                    width: 220,
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                          fillColor: Color.fromARGB(255, 249, 211, 208),
                          filled: true),
                      onChanged: (item) => setState(() => selectedgov = item),
                      value: selectedgov,
                      items: gov
                          .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ))
                          .toList(),
                    )),
               
              ],
            ),
            SizedBox(height: 15.h,),
            const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "City:",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                  height: 50,
                  width: 220,
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true, fillColor: Color.fromARGB(255, 249, 211, 208)),
                  ))
            ]),
           SizedBox(height: 15.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Blood type:",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                    height: 50,
                    width: 220,
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                          fillColor: Color.fromARGB(255, 249, 211, 208),
                          filled: true),
                      onChanged: (item) => setState(() => selecteditem = item),
                      value: selecteditem,
                      items: itemlist
                          .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ))
                          .toList(),
                    )),
              ],
            ),
           SizedBox(height: 15.h,),
            const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Latest\ndonation:",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                  height: 50,
                  width: 220,
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true, fillColor: Color.fromARGB(255, 249, 211, 208)),
                  ))
            ]),
           SizedBox(height: 15.h,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text(
                "Condition:",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                  height: 50,
                  width: 220,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                        fillColor: Color.fromARGB(255, 249, 211, 208), filled: true),
                    onChanged: (item) => setState(() => selectedcon = item),
                    value: selectedcon,
                    items: con
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ))
                        .toList(),
                  )),
            ]),
            SizedBox(height: 20.h,),
                  ]),
          ),
        ),
      ),
    );
  }

  
}
