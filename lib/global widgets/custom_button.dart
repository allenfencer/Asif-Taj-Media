import 'package:flutter/material.dart';
import 'package:tech_media/constants/color.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final bool isLoading;
  final VoidCallback function;
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.function,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: function,
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.dividedColor),
          child: isLoading
              ? const Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  ),
                )
              : Text(
                  buttonText,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.whiteColor,
                      ),
                ),
        ));
  }
}
