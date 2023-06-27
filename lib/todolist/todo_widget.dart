import 'package:first_app/todolist/db_helper.dart';
import 'package:first_app/todolist/todo_model.dart';
import 'package:flutter/material.dart';

class TodoWidget extends StatefulWidget {
  final Note note;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const TodoWidget(
      {Key? key,
      required this.note,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  double screenWidth = 0;
  double screenHeight = 0;

  bool startAnimation = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
        onLongPress: widget.onLongPress,
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6),
          child: AnimatedContainer(
            width: screenWidth,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 300 + (widget.note.id! * 200)),
            transform: Matrix4.translationValues(
                startAnimation ? 0 : screenWidth, 0, 0),
            child: Card(
                elevation: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.note.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Text(widget.note.description,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400))
                    ],
                  ),
                )),
          ),
        ));
  }
}
