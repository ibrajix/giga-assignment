
import 'dart:math';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterassignment/constants/images.dart';
import 'package:flutterassignment/model/address_model.dart';
import 'package:flutterassignment/utils/utility.dart';
import 'package:flutterassignment/widgets/giga_app_bar.dart';
import 'package:flutterassignment/widgets/giga_button.dart';
import 'package:flutterassignment/widgets/giga_confetti_bottom_sheet.dart';
import 'package:flutterassignment/widgets/giga_input_field.dart';
import 'package:go_router/go_router.dart';

import '../constants/colors.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> with FormMixin {

  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _prefectureController = TextEditingController();
  final TextEditingController _municipalityController = TextEditingController();
  final TextEditingController _subAreaController = TextEditingController();
  final TextEditingController _blockController = TextEditingController();
  final TextEditingController _houseController = TextEditingController();
  final TextEditingController _apartmentController = TextEditingController();
  bool allFieldsValidated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: gigaAppBar(
          height: 80,
          title: 'Registered Address',
          leadingWidget: IconButton(
            icon: SvgPicture.asset(
              Images.backIcon
            ),
            onPressed: () {
             context.pop();
            },
          ),
        ),
        body: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LinearProgressIndicator(
                color: AppColors.gigaYellow,
                value: 0.5,
                backgroundColor: AppColors.gigaWhite,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  'Please enter information as written \non your ID document',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        GigaInputField(
                          hintText: "Country",
                          readOnly: true,
                          validator: Utility.validateString(),
                          controller: _countryController,
                          suffixIcon: const Icon(
                            Icons.search,
                            color: AppColors.gigaHintColor,
                          ),
                          onClickTextField: (){
                            showCountryPicker(
                              context: context,
                              onSelect: (Country country) {
                                setState(() {
                                  _countryController.text = country.name;
                                });
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        GigaInputField(
                          hintText: "Prefecture",
                          validator: Utility.validateString(),
                          controller: _prefectureController,
                        ),
                        const SizedBox(height: 10),
                        GigaInputField(
                          hintText: "Municipality",
                          validator: Utility.validateString(),
                          controller: _municipalityController,
                        ),
                        const SizedBox(height: 10),
                        //ON PURPOSE BECAUSE A TEXT WATCHER ON A SINGLE TEXT FIELD FOR THIS WILL LEAD TO POOR USER EXPERIENCE
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: GigaInputField(
                                hintText: "Subarea",
                                validator: Utility.validateString(),
                                controller: _subAreaController,
                              ),
                            ),
                            Expanded(
                              child: GigaInputField(
                                hintText: "Block",
                                validator: Utility.validateString(),
                                controller: _blockController,
                              ),
                            ),
                            Expanded(
                              child: GigaInputField(
                                hintText: "House",
                                validator: Utility.validateString(),
                                controller: _houseController,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        GigaInputField(
                          hintText: "Apartment, suite or unit",
                          validator: Utility.validateString(),
                          controller: _apartmentController,
                        ),
                      ],
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: GigaButton(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    backgroundColor: AppColors.gigaPurple,
                      onPressed: () => validate(() {
                        //save as object
                        var streetAddressFormat = "${_subAreaController.text} - ${_blockController.text} - ${_houseController.text}";
                        var address = Address(
                          country: _countryController.text,
                          prefecture: _prefectureController.text,
                          municipality: _municipalityController.text,
                          streetAddress: streetAddressFormat,
                          apartment: _apartmentController.text
                        );
                        showModalBottomSheet<Widget>(
                          isScrollControlled: true,
                          context: context,
                          isDismissible: true,
                          enableDrag: true,
                          builder: (context) {
                            return GigaConfettiBottomSheet(
                              address: address,
                              icon: Images.locationPin,
                              header: "",
                              title: "Well done!",
                              subtitle: "Here are your details:",
                              onButtonClicked: () {
                                context.pop();
                              },
                            );
                          },
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16.0),
                            ),
                          ),
                        );
                       },
                      ),
                      text: 'Next'
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

  @override
  void dispose() {
    super.dispose();
    _countryController.dispose();
    _prefectureController.dispose();
    _municipalityController.dispose();
    _subAreaController.dispose();
    _blockController.dispose();
    _houseController.dispose();
    _apartmentController.dispose();
  }

}

