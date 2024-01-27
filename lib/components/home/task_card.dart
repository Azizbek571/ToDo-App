import 'package:to_do_app/config/imports.dart';

class TaskCard extends StatelessWidget {
   TaskCard({
    super.key,
    required this.item,
    this.isSelect=false,
  });

  final TaskModel item;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: isSelect?AppColors.bluelight : null,
          border: Border.all(color: AppColors.blue5),
          borderRadius: BorderRadius.circular(14)),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: AppColors.blue5,
                  borderRadius:
                      BorderRadius.circular(100)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue7),
                  ),
                  Text(
                    item.description,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Row(children: [
                        Text("Time: ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800)),
                        Text(
                          "${item.startTime}_${item.endTime}",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black)),
                      ]),
                      const Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                        decoration: BoxDecoration(color: AppColors.blue5, borderRadius: BorderRadius.circular(10)),
                        child: Text(item.status, style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),))
                    ],
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
