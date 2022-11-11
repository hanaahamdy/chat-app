import 'package:flutter/material.dart';

import '../../../../login/presentation/widgets/build_form_field.dart';

Padding buldSendMassegField({required controller,Function? onsubmit, sendAction}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: buildTextFormField(
      onsubmited:onsubmit ,
        borderColor: Colors.grey,
        hintText: "Send Message",
        controller: controller,
        label: "",
        suffixAction:sendAction ,
        suffix: Icons.send),
  );
}