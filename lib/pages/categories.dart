import 'package:to_do_app/components/default/confirm_dilaog.dart';
import 'package:to_do_app/config/imports.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  CategoryController controller = Get.put(CategoryController());

  @override
  void initState() {
    controller.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (controller) {
        return controller.loading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                constraints: const BoxConstraints(maxWidth: 500),
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            const Spacer(),
                            Text(
                              'Categories',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blue5),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                controller.title.text ='';
                                Get.dialog(AddCategoriesDialog(
                                  textController: controller.title,
                                  onTap: () {
                                    controller.add();
                                  },
                                ));
                              },
                              child: Icon(
                                Icons.add_circle_outline_outlined,
                                color: AppColors.blue5,
                                size: 30),
                            )
                          ],
                        )),
                      Column(
                        children:
                            List.generate(controller.categories.length, (index) {
                          var item = controller.categories[index];
                          return CategoryItem(item: item, controller: controller);
                        }),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.item, required this.controller});
  var item;
  CategoryController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray6), 
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Text(
                item['title'].toString(),
                style: TextStyle(fontSize: 18),
              ),
              const Spacer(),
              PopupMenuButton(
                icon: const Icon(Icons.more_vert_outlined),
                color: Colors.white,
                itemBuilder: (context) => [
                   PopupMenuItem(
                    value: 1,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                        controller.title.text = item['title'];
                        Get.dialog(AddCategoriesDialog(
                            textController: controller.title,
                            editing: true,
                            onTap: () {
                              controller.edit(item['id']);
                            }));
                      },
                    
                    child: const Row(
                      children: [
                        Icon(
                          Icons.edit,
                          size: 20,
                          color: Colors.green,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Change',
                          style: TextStyle(color: Colors.green))
                      ]),
                    )),
                     PopupMenuItem(
                    value: 1,
                    child: InkWell(
                      onTap: () {
                        Get.dialog(ConfirmDialog(
                            text:
                                "Are you sure you want want to delete the category ${item['title']}?",
                            title: "Delete",
                            onTap: () {
                              controller.delete(item['id']);
                            }));
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.delete, size: 20, color: Colors.red),
                          SizedBox(width: 10),
                          Text('Delete', style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                  ),
                ],
                elevation: 2,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}

class AddCategoriesDialog extends StatelessWidget {
       AddCategoriesDialog(
      {super.key, 
      required this.textController,
       required this.onTap,
       this.editing = false});
  final TextEditingController textController;
  final Function onTap;
  bool editing;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            editing ? "Change the category" : "Add a category",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 15),
          Input(
            hintText: 'Name of category',
            controller: textController,
          ),
          const SizedBox(height: 15),
          Button(
              onTap: () {
                onTap();
              },
              text: editing ? "Change" : "add",
          )
        ],
      ),
    );
  }
}
