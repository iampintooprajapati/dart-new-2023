class AvmStepper extends StatefulWidget {
  final int currentInde;
  void Function(int index) onTap;

  AvmStepper({Key? key, this.currentInde = 0, required this.onTap})
      : super(key: key);

  @override
  State<AvmStepper> createState() => _AvmStepperState();
}

class _AvmStepperState extends State<AvmStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Stack(
        children: [
          Positioned(
            child: Align(
              alignment: Alignment.center,
              child: Divider(
                endIndent: 20,
                indent: 20,
                color: AppColors.steeprDisableColor,
                thickness: 3,
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.onTap(0);
                    },
                    child: CircleAvatar(
                      backgroundColor: widget.currentInde == 0
                          ? AppColors.primaryColor
                          : AppColors.steeprDisableColor,
                      child: Text("1",
                          style: TextStyle(
                              color: widget.currentInde == 0
                                  ? Colors.white
                                  : AppColors.steeprDisableTextColor,
                              fontFamily: AVMFontFamily.poppinsSeiBold)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onTap(1);
                    },
                    child: CircleAvatar(
                      backgroundColor: widget.currentInde == 1
                          ? AppColors.primaryColor
                          : AppColors.steeprDisableColor,
                      child: Text(
                        "2",
                        style: TextStyle(
                          color: widget.currentInde == 1
                              ? Colors.white
                              : AppColors.steeprDisableTextColor,
                          fontFamily: AVMFontFamily.poppinsSeiBold,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onTap(2);
                    },
                    child: CircleAvatar(
                      backgroundColor: widget.currentInde == 2
                          ? AppColors.primaryColor
                          : AppColors.steeprDisableColor,
                      child: Text(
                        "3",
                        style: TextStyle(
                          color: widget.currentInde == 2
                              ? Colors.white
                              : AppColors.steeprDisableTextColor,
                          fontFamily: AVMFontFamily.poppinsSeiBold,
                        ),
                      ),
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}



class AvmAddBusinessStepper extends StatefulWidget {
  final int currentInde;
  void Function(int index) onTap;

  AvmAddBusinessStepper({Key? key, this.currentInde = 0, required this.onTap})
      : super(key: key);

  @override
  State<AvmAddBusinessStepper> createState() => _AvmAddBusinessStepperState();
}

class _AvmAddBusinessStepperState extends State<AvmAddBusinessStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.4,
      child: Stack(
        children: [
          Positioned(
            child: Align(
              alignment: Alignment.center,
              child: Divider(
                endIndent: 30,
                indent: 20,
                color: AppColors.steeprDisableColor,
                thickness: 3,
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.onTap(0);
                    },
                    child: CircleAvatar(
                      backgroundColor: widget.currentInde == 0
                          ? AppColors.primaryColor
                          : AppColors.steeprDisableColor,
                      child: Text("1",
                          style: TextStyle(
                              color: widget.currentInde == 0
                                  ? Colors.white
                                  : AppColors.steeprDisableTextColor,
                              fontFamily: AVMFontFamily.poppinsSeiBold)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onTap(1);
                    },
                    child: CircleAvatar(
                      backgroundColor: widget.currentInde == 1
                          ? AppColors.primaryColor
                          : AppColors.steeprDisableColor,
                      child: Text(
                        "2",
                        style: TextStyle(
                          color: widget.currentInde == 1
                              ? Colors.white
                              : AppColors.steeprDisableTextColor,
                          fontFamily: AVMFontFamily.poppinsSeiBold,
                        ),
                      ),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     widget.onTap(2);
                  //   },
                  //   child: CircleAvatar(
                  //     backgroundColor: widget.currentInde == 2
                  //         ? AppColors.primaryColor
                  //         : AppColors.steeprDisableColor,
                  //     child: Text(
                  //       "3",
                  //       style: TextStyle(
                  //         color: widget.currentInde == 2
                  //             ? Colors.white
                  //             : AppColors.steeprDisableTextColor,
                  //         fontFamily: AVMFontFamily.poppinsSeiBold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ]),
          )
        ],
      ),
    );
  }
}