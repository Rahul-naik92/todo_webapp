import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/task_controller.dart';

class AddTodoPage extends StatelessWidget {
  static const id = '/add_page';
  final TaskController taskController = Get.put(TaskController());
  // final TextEditingController titleController = TextEditingController();

  AddTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task', style: TextStyle(color: Colors.white)),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.1,
                  width: Get.width * 0.9,
                  child: TextFormField(
                    maxLines: 3,
                    controller: taskController.titleController,
                    decoration: InputDecoration(
                      labelText: 'Add Task',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                taskController.addTask(taskController.titleController.text);
                Get.back();
                Get.snackbar(
                  'title',
                  '${taskController.titleController.text} added',
                  snackPosition: SnackPosition.TOP,
                );
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }

  }
