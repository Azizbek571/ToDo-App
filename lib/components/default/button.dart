import 'package:to_do_app/config/imports.dart';

class Button extends StatelessWidget {
 String text;
 Function? onTap;
 bool dense;
   Button({
    super.key,
     this.onTap,
     this.text = "Text",
     this.dense =false,
    
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
             EdgeInsets.symmetric(vertical: dense?10: 18,horizontal:dense? 10 : 20),
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(dense?14:20)),
          child: Text(
            text,
            style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
                fontSize: dense?18:20),
            textAlign: TextAlign.center,
          )),
    );
  }
}
