import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/userdata.dart';

class EditProfile extends StatefulWidget {
  final String? id;
  const EditProfile(this.id, {Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final CollectionReference userdata =
      FirebaseFirestore.instance.collection('users');

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();

  @override
  void initState() {
    userdata
        .doc(widget.id)
        .snapshots()
        .listen((DocumentSnapshot<Object?> snapshot) {
      _nameController.text = snapshot.get('name').toString();
      _phoneController.text = snapshot.get('phone').toString();
      _schoolController.text = snapshot.get('school').toString();
    });
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Expanded(
            child: getUser(),
          ),
        ],
      ),
    );
  }

  FutureBuilder<DocumentSnapshot<Object?>> getUser() {
    return FutureBuilder(
      future: userdata.doc(widget.id).get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        try {
          if (snapshot.hasData) {
            return dataUser(context);
          }
        } catch (e) {
          debugPrint(e.toString());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget dataUser(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 80,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Name'),
                    //Validasi TextFormField
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name ca\'nt be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: h * .03),
                  TextFormField(
                    controller: _schoolController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'School'),
                    //Validasi TextFormField
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'school ca\'nt be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: h * .03),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number Phone'),
                    //Validasi TextFormField
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[0-9]').hasMatch(value)) {
                        return 'Number Phone ca\'nt be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: h * .03),
                ],
              ),
              Align(
                alignment: AlignmentDirectional.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 255, 212, 76),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        UserData.updateData(
                                widget.id,
                                _nameController.text.trim(),
                                _phoneController.text.trim(),
                                _schoolController.text.trim())
                            .then(
                          (value) => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Data has been successfully updated',
                              ),
                            ),
                          ),
                        );
                      });
                    }
                  },
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
