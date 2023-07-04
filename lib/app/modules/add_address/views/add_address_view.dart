import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vd_commmerce/app/data/woocommerce_api.dart';
import 'package:vd_commmerce/app/models/address/address.dart';
import 'package:vd_commmerce/app/modules/add_address/views/constants.dart';

import '../controllers/add_address_controller.dart';

class AddDetailsView extends GetView<AddAddressController> {
  AddDetailsView({Key? key}) : super(key: key);

  late String firstName;
  late String lastName;
  late String email;
  late String city;
  late String district;
  late String state;
  late String pincode;
  String country = 'India';
  late String contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Details'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                        onChanged: (value) {
                          firstName = value;
                        },
                        decoration: kInputStyle.copyWith(
                            labelText: 'First Name', icon: const Icon(Icons.person))),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                        onChanged: (value) {
                          lastName = value;
                        },
                        decoration: kInputStyle.copyWith(
                            labelText: 'Last Name')),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: kInputStyle.copyWith(
                      labelText: 'Email Address',
                      icon: const Icon(Icons.mail))),
              const SizedBox(height: 20.0),
              TextFormField(
                  onChanged: (value) {
                    city = value;
                  },
                  decoration: kInputStyle.copyWith(
                      labelText: 'City/Location',
                      icon: const Icon(Icons.location_city))),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        onChanged: (value) {
                          district = value;
                        },
                        decoration:
                            kInputStyle.copyWith(labelText: 'District')),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: TextFormField(
                        onChanged: (value) {
                          pincode = value;
                        },
                        keyboardType: TextInputType.number,
                        decoration:
                            kInputStyle.copyWith(labelText: 'Pin-Code')),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        onChanged: (value) {
                          state = value;
                        },
                        decoration: kInputStyle.copyWith(labelText: 'State')),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: TextFormField(
                        onChanged: (value) {
                          country = value;
                        },
                        decoration: kInputStyle.copyWith(labelText: 'Country')),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                  onChanged: (value) {
                    contact = value;
                  },
                  keyboardType: TextInputType.number,
                  decoration: kInputStyle.copyWith(
                      labelText: 'Contact', icon: const Icon(Icons.phone))),
              const SizedBox(height: 30.0),
              ElevatedButton(
                  onPressed: () {
                    final newAddress = Address(
                        firstName: firstName,
                        lastName: lastName,
                        email: email,
                        city: city,
                        district: district,
                        state: state,
                        pincode: pincode,
                        phone: contact);
                    addressList.add(newAddress);
                    WooCommerceApi().createCustomer(newAddress);
                    WooCommerceApi().getCustomers();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(13.0),
                      foregroundColor: Colors.teal[700]),
                  child: const Text('Add Address',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500)))
            ],
          ),
        ));
  }
}
