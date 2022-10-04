import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';
import 'package:safaqat/safaqat/presentation/ui/home/components/search_button_widget.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: const [
      Flexible(
        flex: 10,
        child: SizedBox(
          height: 40,
            child: TextFiledForm(radius: 25)),
      ),
      SizedBox(width: 16),
      Flexible(flex: 4, child: SearchButtonWidget()),
    ]);
  }
}
