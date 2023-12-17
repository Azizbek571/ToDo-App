import 'package:to_do_app/config/imports.dart';

class Button extends StatelessWidget {
 String text;
 Function? onTap;
   Button({
    super.key,
     this.onTap,
     this.text = "Text"
    
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null){
        onTap!();
        }
      },
      child: Container(
          width: double.maxFinite,
          padding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            text,
            style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20),
            textAlign: TextAlign.center,
          )),
    );
  }
}
