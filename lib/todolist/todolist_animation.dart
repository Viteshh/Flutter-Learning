// import 'package:first_app/todolist/todo_model.dart';
// import 'package:first_app/todolist/todo_screen.dart';
// import 'package:flutter/material.dart';

// class _TodoScreenState extends State<TodoScreen> with TickerProviderStateMixin {
//   // define the animation controller
//   late AnimationController _animationController;
//   late List<Note> _notes;

//   @override
//   void initState() {
//     super.initState();
//     _notes = [];
//     // initialize the animation controller
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 500),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   // method to add a note to the list
//   void _addNote() async {
//     // play the animation
//     _animationController.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
    
//       body: AnimatedList(
//         controller: _animationController,
//         initialItemCount: _notes.length,
//         itemBuilder: (context, index, animation) {
//           return SlideTransition(
//             position: Tween<Offset>(
//               begin: Offset(1, 0),
//               end: Offset.zero,
//             ).animate(animation),
//             child: ListTile(
//               title: Text(_notes[index].title),
//               subtitle: Text(_notes[index].description),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addNote,
//         tooltip: 'Add Note',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
