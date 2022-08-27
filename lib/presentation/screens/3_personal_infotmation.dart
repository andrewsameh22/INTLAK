import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:task/presentation/widgets/dropdown_textField.dart';

import '../../cubit/registration_cubit_bloc.dart';
import '../../cubit/registration_cubit_state.dart';
import '../widgets/aTXTFld.dart';
import '../widgets/basic_text_form_filed.dart';
import '../widgets/registration_button.dart';

class PersonalInformation extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  late DateTime selectedDate;
  late DateTime selectedYear;

  TextEditingController emailController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => RegistrationCubitBloc(),
        child: BlocConsumer<RegistrationCubitBloc, RegistrationCubitState>(
          listener: (BuildContext context, RegistrationCubitState state) {},
          builder: (BuildContext context, RegistrationCubitState state) {
            RegistrationCubitBloc cub = RegistrationCubitBloc.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        // top: 50,
                        right: 20,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.10,
                            ),
                            Text(
                              "Personal Information",
                              style: GoogleFonts.montserrat(
                                color: const Color(0XFF3f3f3f),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                            ),
                            TxtFld(
                              picon: Icon(Icons.person_outline),
                              controller: fullNameController,
                              label: 'Full Name',
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            DropDown(
                              context: context,
                              onChanged: (value) {
                                GenderValue = value;
                                cub.emit(test());
                              },
                              Selecteditems:
                                  Genders.map(buildMenuitem).toList(),
                              hint: 'Gender',
                              SelectedValue: GenderValue,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            TxtFld(
                              picon: Icon(Icons.date_range),
                              controller: DateController,
                              keyType: null,
                              readOnly: true,
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                ).then((value) {
                                  print(value);

                                  selectedDate = value!;
                                  print(selectedDate);
                                  DateController.text =
                                      selectedDate.year.toString() +
                                          '-' +
                                          selectedDate.month.toString() +
                                          '-' +
                                          selectedDate.day.toString();
                                });
                              },
                              label: 'Date of Birth',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please choose your birth date';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            DropDown(
                              context: context,
                              onChanged: (value) {
                                SubjectsValue = value;
                                cub.emit(test());
                              },
                              Selecteditems:
                                  Subjects.map(buildMenuitem).toList(),
                              hint: 'Subjects',
                              SelectedValue: SubjectsValue,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            DropDown(
                              context: context,
                              onChanged: (value) {
                                EduValue = value;
                                cub.emit(test());
                              },
                              Selecteditems:
                                  YearOfEdu.map(buildMenuitem).toList(),
                              hint: 'Year of Education',
                              SelectedValue: EduValue,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            TxtFld(
                              picon: Icon(Icons.email),
                              controller: emailController,
                              keyType: TextInputType.emailAddress,
                              label: 'Email',
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'empty field required';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.09,
                            ),
                            registrationButton(
                              text: "Continue",
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  //navigate b2a hna
                                }
                              },
                              context: context,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            );
          },
        ));
  }
}
