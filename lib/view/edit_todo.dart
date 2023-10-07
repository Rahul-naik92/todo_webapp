import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/task_controller.dart';

class TodoEdit extends StatelessWidget {
  final int? index;
  TodoEdit({Key? key, @required this.index}) : super(key: key);

  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    final TextEditingController editedTitleController =
        TextEditingController(text: taskController.tasks[index!].title);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Task',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.close),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width * 0.9,
                height: Get.height * 0.15,
                child: TextField(
                  // textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    // hintText: "What do you want to accomplish?",
                    label: const Text("Edit Task"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    // focusedBorder: InputBorder.none,
                  ),
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  autofocus: true,
                  controller: editedTitleController,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  taskController.updateTask(index!, editedTitleController.text);
                  Get.back();
                  Get.snackbar(
                    'Updated',
                    'Task Succesfully updated',
                    snackPosition: SnackPosition.TOP,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
