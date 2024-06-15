import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_rock_mobile/components/app_bar.dart';
import 'package:the_rock_mobile/components/ink_button.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_rock_mobile/models/drug_model.dart';
import 'package:the_rock_mobile/models/requests/prescription_model.dart';
import 'package:the_rock_mobile/services/doctor/prescription_service.dart';
import 'package:the_rock_mobile/services/drug_service.dart';
import 'package:the_rock_mobile/utility/multi_select_popup.dart';
// import 'package:the_rock_mobile/components/toast.dart';
// import 'package:the_rock_mobile/services/prescription_service.dart';
// import 'package:the_rock_mobile/models/prescription_model.dart';
// import 'package:the_rock_mobile/util/multi_select_popup.dart';

class Prescription extends StatefulWidget {
  static const String namedRoute = "/prescription-screen";
  const Prescription({super.key});

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  List<String> _selectedItems = [];
  final DrugService drugService =
      DrugService(); // Create an instance of DrugService

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<List<String>> fetchItems() async {
    final List<Drug> drugs = await drugService.fetchItems();
    // Convert the list of drugs to a list of drug names
    return drugs.map((drug) => drug.name).toList();
  }

  void _showMultiSelect() async {
    final List<String> items = await fetchItems();
    // ignore: use_build_context_synchronously
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items, selectedItems: _selectedItems);
      },
    );

    if (results != null) {
      setState(() => _selectedItems = results);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // final toast = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    void goBack() => navigator.pop(context);

    final Map routeData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final patientId = routeData["id"];

    // print("routeData[id]: ======> ${routeData["id"]}");
    // print("routeData[name]: ======> ${routeData["name"]}");

    ///
    void submitPrescription() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? doctorId = prefs.getString('authUserId');
      final isValidForm = formKey.currentState!.validate();
      if (isValidForm) {
        CreatePrescriptionPayload prescriptionPayload =
            CreatePrescriptionPayload(
          name: titleController.text.trim(),
          description: descriptionController.text.trim(),
          doctorId: doctorId!,
          patientId: patientId,
          drugIds: [],
        );

        await PrescriptioService().createPrescription(prescriptionPayload);
      } else {
        Get.snackbar("oOps... ", "Please fill the prescription form correctly",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
            icon: const Icon(
              FluentIcons.warning_12_filled,
              color: Colors.white,
            ));
      }
    }

    return Scaffold(
      body: Form(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // APP BAR
            PurpleAppBar(
              height: appHeight * .16,
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.xs),
              child: Container(
                alignment: const Alignment(0, 0.3),
                child: Row(
                  children: [
                    InkButton(
                      onTap: goBack,
                      borderRadius: AppSizes.md,
                      background: colorScheme.background,
                      iconColor: colorScheme.primary,
                    ),

                    SizedBox(width: appWidth * 0.12),

                    // title
                    Text(
                      "${routeData["name"]}'s Prescription",
                      style:
                          textTheme.displayLarge!.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Add a TextField for the title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
              child: TextFormField(
                controller: titleController,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: 'Prescription Name',
                ),
                validator: (data) {
                  if (data!.isEmpty) {
                    return "title field cannot be empty";
                  } else {
                    return null;
                  }
                },
              ),
            ),

            // Add a TextField for the description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
              child: TextFormField(
                  controller: descriptionController,
                  autocorrect: false,
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  validator: (data) {
                    if (data!.isEmpty) {
                      return "Description field cannot be empty";
                    } else {
                      return null;
                    }
                  }),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
              child: OutlinedButton(
                onPressed: _showMultiSelect,
                child: const Text('Pick Drug'),
              ),
            ),
            const Divider(height: 30),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
              child: Text('Drug List here'),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
              child: Wrap(
                children:
                    _selectedItems.map((e) => Chip(label: Text(e))).toList(),
              ),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
              child: ElevatedButton(
                onPressed: submitPrescription,
                child: const Text("Submit Prescription"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
