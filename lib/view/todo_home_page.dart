import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/task_controller.dart';
import 'add_todo_page.dart';
import 'edit_todo.dart';

class AddToDoHomePage extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  AddToDoHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Application - Rahul Naik", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
   
        child: Obx(
          () => taskController.tasks.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                                      const Text(
                      "You Don't have any task added to list!!!!!!.",
                      style: TextStyle(fontSize: 20),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.to(() => AddTodoPage());
                        },
                        child: const Text("Create new Task",
                            style: TextStyle(color: Colors.white)))
                  ],
                )
              : ListView.builder(
                  itemCount: taskController.tasks.length,
                  itemBuilder: (context, index) => Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              "Delete ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Icon(
                              Icons.delete_outline,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onDismissed: (_) {
                      taskController.removeTask(index);
                      Get.snackbar('Deleted!', "task successfully deleted",
                          snackPosition: SnackPosition.TOP);
                    },
                    child: Card(
                      child: ListTile(
                          title: Text(
                            taskController.tasks[index].title!,
                            style: taskController.tasks[index].isDone == true
                                ? TextStyle(
                                    color: Colors.grey.withOpacity(0.5),
                                    decoration: TextDecoration.lineThrough,
                                  )
                                : const TextStyle(
                                    color: Colors.black,
                                  ),
                          ),
                          trailing: taskController.tasks[index].isDone == true
                              ? const SizedBox(
                                  height: 10,
                                  width: 10,
                                )
                              : IconButton(
                                  onPressed: () =>
                                      Get.to(() => TodoEdit(index: index)),
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  ),
                                ),
                          leading: IconButton(
                              onPressed: () {
                                taskController.toggleTask(index);
                              },
                              icon: taskController.tasks[index].isDone == true
                                  ? const Icon(
                                      Icons.check_box,
                                      color: Colors.green,
                                    )
                                  : const Icon(
                                      Icons.check_box_outline_blank,
                                      color: Colors.grey,
                                    ))),
                    ),
                  ),
                ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Get.to(() => AddTodoPage());
        },
      ),
    );
  }

  ListTile buildCheckedListTile(int index) {
    return ListTile(
        title: Text(
          taskController.tasks[index].title!,
          style: taskController.tasks[index].isDone == true
              ? const TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                )
              : const TextStyle(
                  color: Colors.black,
                ),
        ),
        trailing: IconButton(
          onPressed: () => Get.to(() => TodoEdit(index: index)),
          icon: const Icon(Icons.edit),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: taskController.tasks[index].isDone == false
                ? const Icon(
                    Icons.check_box,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.check_box_outline_blank,
                    color: Colors.grey,
                  )));
  }
}
