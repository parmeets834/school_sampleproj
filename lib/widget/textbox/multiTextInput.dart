
import 'package:flutter/material.dart';


class MultiLineTextInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new Theme(
      data: new ThemeData(
        primaryColor: ThemeData().primaryColor,
        primaryColorDark: Colors.grey,
      ),
      child: new TextField(
        minLines: 1,//Normal textInputField will be displayed
        maxLines: 5,// when user presses enter it will adapt to it
        keyboardType: TextInputType.multiline,
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal)),
            hintText: "Please Write Here",
            helperText: 'Write all relvant point in this request',
            labelText: 'Mentor Request',
            prefixIcon: const Icon(
              Icons.pending_actions,
            ),
            prefixText: ' ',
            suffixIcon:Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Icon(Icons.clear)),
            ),
            suffixStyle: const TextStyle(color: Colors.red)),
      ),
    );
  }
}
