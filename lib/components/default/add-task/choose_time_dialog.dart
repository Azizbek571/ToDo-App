import 'package:to_do_app/config/imports.dart';

class ChooseTimeDialog extends StatefulWidget {
  ChooseTimeDialog({super.key, required this.controller, required this.start});

  TaskController controller;
  bool start;

  @override
  State<ChooseTimeDialog> createState() => _ChooseTimeDialogState();
}

class _ChooseTimeDialogState extends State<ChooseTimeDialog> {
  String hour = "00";
  String minute = "00";

  setHour(item) {
    setState(() {
      hour = item;
    });
  }

  setMinute(item) {
    setState(() {
      minute = item;
    });
  }

  save() {
    widget.controller.saveTime(widget.start, hour + ":" + minute);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        actions: [
          Button(
              onTap: () {
                save();
              },
              dense: true,
              text: "Save")
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TimeSection(
              section: hour,
              label: "Choose the time",
              list: widget.controller.hours,
              onTap: (item) {
                setHour(item);
              },
            ),
            SizedBox(height: 24),
            TimeSection(
              section: minute,
              label: "Choose the minute",
              list: widget.controller.minutes,
              onTap: (item) {
                setMinute(item);
              },
            ),
          ],
        ));
  }
}

class TimeSection extends StatelessWidget {
  const TimeSection({
    super.key,
    required this.section,
    required this.label,
    required this.list,
    required this.onTap,
  });

  final String section;
  final String label;
  final List list;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(list.length, (index) {
              var item = list[index];
              return InkWell(
                onTap: () {
                  onTap(item);
                },
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        color: item == section ? AppColors.blue7 : null,
                        border: Border.all(color: AppColors.blue7),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(item,
                        style: TextStyle(
                            color: item == section
                                ? AppColors.white
                                : AppColors.blue7))),
              );
            }),
          ),
        ),
      ],
    );
  }
}



//  Text('Choose the minute'),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: List.generate(
//                     widget.controller.minutes.length,
//                     (index) {
//                       var item = widget.controller.minutes[index];
//                   return InkWell(
//                      onTap: () {
//                       setMinute(item);
//                     },
//                     child: Container(
//                         padding:
//                             EdgeInsets.symmetric(
//                                 vertical: 2,
//                                 horizontal: 5),
//                         margin: EdgeInsets.only(
//                             right: 5),
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 color: AppColors
//                                     .blue7),
//                             borderRadius:
//                                 BorderRadius
//                                     .circular(5)),
//                         child: Text(widget.controller.minutes[index])),
//                   );
//                 }),
//               ),
//             ),