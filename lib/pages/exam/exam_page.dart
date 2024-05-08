import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_optical_reader/base/base_stateful_state.dart';
import 'package:mobile_optical_reader/pages/exam/exam_view_model.dart';
import 'package:provider/provider.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends BaseStatefulState<ExamPage> {
  late ExamViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<ExamViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFddcbdc),
        title: Row(
          children: [
            const Icon(
              Icons.home_work_outlined,
              color: Colors.black,
            ),
            const SizedBox(width: 8),
            const Text(
              "Sınavlar",
              style: TextStyle(color: Colors.black),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                debugPrint("Ekle tıklandı!!");
                _dialogBuilder(context);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(vm.lessons[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                );
              },
              itemCount: vm.lessons.length,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 60,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height / 2.1,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Ders Adı",
                      hintStyle: const TextStyle(fontSize: 14),
                      filled: true,
                      fillColor: const Color(0xFFddcbdc),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ValueListenableBuilder(
                      valueListenable: vm.chooseOpticForm,
                      builder: (_, __, ___) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<String>(
                            dropdownColor: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(20),
                            items: vm.opticForms
                                .map((String opticForm) => DropdownMenuItem(
                                      child: Text(opticForm),
                                      value: opticForm,
                                    ))
                                .toList(),
                            value: vm.chooseOpticForm.value,
                            onChanged: (String? newSelect) {
                              vm.chooseOpticForm.value = newSelect!;
                            },
                          ),
                        );
                      }),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        onPressed: () {
                          debugPrint("Ders Ekle Tıklandı");
                        },
                        child: Text("EKLE"),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        onPressed: () {
                          debugPrint("İptal Tıklandı");
                          Navigator.pop(context);
                        },
                        child: Text("İPTAL"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
