import 'package:flutter/material.dart';

Future<String> askModal(BuildContext context, String question) {
  return Navigator.push(
    context,
    PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, _, __) {
          return AskModal(
            question: question,
          );
        }),
  );
}

class AskModal extends StatelessWidget {
  final String question;

  AskModal({this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      alignment: Alignment.center,
      child: Card(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(question),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.pop(context, "ok");
                    },
                    color: Colors.green,
                  ),
                  RaisedButton(
                    child: Text("Nope"),
                    onPressed: () {
                      Navigator.pop(context, "nope");
                    },
                    color: Colors.red,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
