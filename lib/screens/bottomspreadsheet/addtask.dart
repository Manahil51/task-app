import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  String selectedStatus = 'Running';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        controller.text = pickedTime.format(context);
      });
    }
  }

  void _saveTask() {
    final String taskName = taskNameController.text;
    final String date = dateController.text;
    final String startTime = startTimeController.text;
    final String endTime = endTimeController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskDetails(
          taskName: taskName,
          date: date,
          startTime: startTime,
          endTime: endTime,
          status: selectedStatus,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Add Task",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add task name",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            TextField(
              controller: taskNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                labelText: "Enter your task to add",
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Date",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                labelText: "Select the date",
              ),
              onTap: () => _selectDate(context),
              readOnly: true,
            ),
            const SizedBox(height: 16.0),
            const Row(
              children: [
                Text(
                  "Start time",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                SizedBox(
                  width: 70,
                ),
                Text(
                  "End time",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: startTimeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: "Starting time",
                    ),
                    onTap: () => _selectTime(context, startTimeController),
                    readOnly: true,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    controller: endTimeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: "Ending time",
                    ),
                    onTap: () => _selectTime(context, endTimeController),
                    readOnly: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Board",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedStatus = 'Running';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedStatus == 'Running' ? Colors.blue : Colors.grey,
                  ),
                  child: const Text("Running"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedStatus = 'Urgent';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedStatus == 'Urgent' ? Colors.blue : Colors.grey,
                  ),
                  child: const Text("Urgent"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedStatus = 'Ongoing';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedStatus == 'Ongoing' ? Colors.blue : Colors.grey,
                  ),
                  child: const Text("Ongoing"),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: _saveTask,
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskDetails extends StatelessWidget {
  final String taskName;
  final String date;
  final String startTime;
  final String endTime;
  final String status;

  const TaskDetails({
    Key? key,
    required this.taskName,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              " $taskName",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8.0),
            Text(
              "Date: $date",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8.0),
            Text(
              "Time: $startTime - $endTime",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8.0),
            Text(
              "Status: $status",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
