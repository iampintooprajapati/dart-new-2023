class RegisterPage extends StatefulWidget {
  static const registerPageUrl = "/registerPage";
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int activeStep = 0; // Initial step set to 0.
  int upperBound = 3;
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;
  bool _value = false;
  bool _termsConditions = false;
  bool _obsecureText = true;
  bool _obsecureText2 = true;

  void _termsChanged(bool value) =>
      setState(() => _termsConditions = !_termsConditions);

  void _toggleObscured() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  void _toggleObscured2() {
    setState(() {
      _obsecureText2 = !_obsecureText2;
    });
  }

  File? ownerPhoto;
  File? aadharImage;
  TextEditingController _nameCtr = TextEditingController();
  TextEditingController _emailCtr = TextEditingController();
  TextEditingController _mobileCtr = TextEditingController();
  TextEditingController _addressCtr = TextEditingController();
  TextEditingController _pincodeCtr = TextEditingController();
  String? _bloodGrpCtr;
  TextEditingController _birthDateCtr = TextEditingController();
  TextEditingController _bioCtr = TextEditingController();
  TextEditingController _aadharCtr = TextEditingController();
  TextEditingController _passwordCtr = TextEditingController();
  TextEditingController _confrimPasswordCtr = TextEditingController();
  late RegisterBloc registerBloc;

  @override
  void initState() {
    super.initState();
    registerBloc = context.read<RegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        context: context,
        child: CustomAppContent(
          isNeedCenterTitle:
              "${AVMLocalization.of(context)?.getTranslatedValues('business_owner_register')}",
          isNeedLeading: false,
          isNeedProfile: false,
          leadingIcon: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                "assets/icons/back_arrow.png",
                width: 40,
              ),
            ),
          ),
        ),
      ),
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterOTPSentState) {
            AvmToast.instance.dismiss();
            AvmToast.instance.showSuccessMessage(context, state.msg);
            Navigator.pushNamed(context, RegisterOtpPage.registerOtpUrl,
                arguments: {'registerbloc': registerBloc});
          }
          if (state is RegisterReSentState) {
            AvmToast.instance.dismiss();
          }
          if (state is RegisteredState) {
            AvmToast.instance.dismiss();
          }
          if (state is RegisterOtpVerifedState) {
            AvmToast.instance.dismiss();
          }

          if (state is RegisterProccessing) {
            AvmToast.instance.showLoading(context);
          }
          if (state is RegistrationErrorState) {
            AvmToast.instance.dismiss();
            AvmToast.instance
                .showErrorMessage(context, state.errorMsg.toString());
          }
        },
        child: SafeArea(
          top: false,
          bottom: true,
          child: SingleChildScrollView(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  // image: DecorationImage(
                  //     image: AssetImage(
                  //       'assets/icons/splash_logo_bg.png',
                  //     ),
                  //     matchTextDirection: true,
                  //     alignment: Alignment.bottomCenter,
                  //     colorFilter: ColorFilter.mode(
                  //         AppColors.scaffold_background.withOpacity(0.1),
                  //         BlendMode.dstATop),
                  //     fit: BoxFit.contain),
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Topbarlogo(),
                  SizedBox(
                    height: 10,
                  ),
                  AvmStepper(
                    onTap: (index) {
                      if (index == 0) {
                        setState(() {
                          _currentStep = index;
                        });
                      } else if (index == 1) {
                        if (!validateStep1()) {
                          return;
                        } else {
                          setState(() {
                            _currentStep = index;
                          });
                        }
                      } else {
                        if (!validateStep1()) {
                          return;
                        } else if (!validateStep2()) {
                          return;
                        } else {
                          setState(() {
                            _currentStep = index;
                          });
                        }
                      }
                    },
                    currentInde: _currentStep,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (_currentStep == 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          AvmEditTextFiled(
                            hint:
                                "${AVMLocalization.of(context)?.getTranslatedValues('name')}*",
                            textEditingController: _nameCtr,
                            textInputType: TextInputType.text,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Transform.scale(
                                scale: 0.7,
                                child: ImageIcon(
                                    AssetImage(
                                      "assets/icons/user.png",
                                    ),
                                    color: AppColors.icon_color),
                              ),
                            ),
                          ),
                          AvmEditTextFiled(
                            hint:
                                "${AVMLocalization.of(context)?.getTranslatedValues('email_id')}*",
                            textEditingController: _emailCtr,
                            textInputType: TextInputType.emailAddress,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Transform.scale(
                                scale: 0.7,
                                child: ImageIcon(
                                    AssetImage(
                                      "assets/icons/email.png",
                                    ),
                                    color: AppColors.icon_color),
                              ),
                            ),
                          ),
                          AvmEditTextFiled(
                            hint:
                                "${AVMLocalization.of(context)?.getTranslatedValues('mobile_number')}*",
                            textInputType: TextInputType.phone,
                            textEditingController: _mobileCtr,
                            inputFormatter: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10)
                            ],
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Transform.scale(
                                scale: 0.7,
                                child: ImageIcon(
                                    AssetImage(
                                      "assets/icons/call.png",
                                    ),
                                    color: AppColors.icon_color),
                              ),
                            ),
                          ),
                          AvmEditTextFiled(
                            hint:
                                "${AVMLocalization.of(context)?.getTranslatedValues('address')}",
                            textInputType: TextInputType.text,
                            textEditingController: _addressCtr,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Transform.scale(
                                scale: 0.7,
                                child: ImageIcon(
                                    AssetImage(
                                      "assets/icons/location.png",
                                    ),
                                    color: AppColors.icon_color),
                              ),
                            ),
                          ),
                          AvmEditTextFiled(
                            hint:
                                "${AVMLocalization.of(context)?.getTranslatedValues('pin_code')}",
                            textEditingController: _pincodeCtr,
                            inputFormatter: [
                              LengthLimitingTextInputFormatter(6),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textInputType: TextInputType.number,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Transform.scale(
                                scale: 0.7,
                                child: ImageIcon(
                                    AssetImage(
                                      "assets/icons/zip_code.png",
                                    ),
                                    color: AppColors.icon_color),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 14, right: 14),
                            child: FlatButton(
                              minWidth: 2000,
                              height: 50,
                              color: AppColors.topbar_color,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: new Text(
                                "${AVMLocalization.of(context)?.getTranslatedValues('next')}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                bool isValid = validateStep1();
                                if (isValid) {
                                  setState(() {
                                    _currentStep = _currentStep + 1;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (_currentStep == 1)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(children: [
                        GestureDetector(
                            onTap: () async {
                              dynamic uploadedFile = await FileUploader.instance
                                  .imagePicker(
                                      globalNavigationKey.currentContext ??
                                          context);
                              if (uploadedFile != null) {
                                setState(() {
                                  ownerPhoto = uploadedFile;
                                });
                              }
                            },
                            child: ownerPhoto == null
                                ? Container(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                          child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 80),
                                            child: Transform.scale(
                                              scale: 0.7,
                                              child: ImageIcon(
                                                  AssetImage(
                                                    "assets/icons/upload_document.png",
                                                  ),
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          Text(
                                            "${AVMLocalization.of(context)?.getTranslatedValues('owner_photo')}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )),
                                    ),
                                  )
                                : Stack(
                                    overflow: Overflow.visible,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 241, 241, 241),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            )),
                                        child: Row(
                                          children: [
                                            Icon(ownerPhoto!.path
                                                    .contains(".pdf")
                                                ? Icons.picture_as_pdf_rounded
                                                : Icons.image),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "${ownerPhoto!.path.split("/").last}",
                                                maxLines: 1,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Positioned.fill(
                                          bottom: -2,
                                          right: 8,
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: CircleAvatar(
                                                radius: 10,
                                                child: Icon(
                                                    Icons.file_upload_outlined,
                                                    size: 14),
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .primaryColor),
                                          ))
                                    ],
                                  )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: AvmEditTextFiled(
                              hint:
                                  "${AVMLocalization.of(context)?.getTranslatedValues('birthdate')}",
                              textEditingController: _birthDateCtr,
                              textInputType: TextInputType.datetime,
                              isEnabled: false,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Transform.scale(
                                  scale: 0.7,
                                  child: ImageIcon(
                                      AssetImage(
                                        "assets/icons/dob.png",
                                      ),
                                      color: AppColors.icon_color),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Transform.scale(
                                  scale: 0.7,
                                  child: ImageIcon(
                                      AssetImage(
                                        "assets/icons/blood_g.png",
                                      ),
                                      color: AppColors.icon_color),
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                  value: _bloodGrpCtr,
                                  onChanged: (value) {
                                    setState(() {
                                      _bloodGrpCtr = value;
                                    });
                                  },
                                  items: [
                                    DropdownMenuItem(
                                      child: Text(
                                        "${AVMLocalization.of(context)?.getTranslatedValues('select_blood_group')}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      value: null,
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "A+",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      value: "A+",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "B+",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      value: "B+",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "AB+",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      value: "AB+",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "O+",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      value: "O+",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "A-",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      value: "A-",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "B-",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      value: "B-",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "AB-",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      value: "AB-",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "O-",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      value: "O-",
                                    ),
                                  ],
                                )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: TextFormField(
                            controller: _bioCtr,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            maxLines: 5,
                            style: Theme.of(context).textTheme.bodyText1,
                            decoration: InputDecoration(
                              hintText:
                                  '${AVMLocalization.of(context)?.getTranslatedValues('enter_details')}',
                              fillColor: Colors.white,
                              filled: true,
                              alignLabelWithHint: true,
                              labelText:
                                  "${AVMLocalization.of(context)?.getTranslatedValues('enter_details')}",
                              labelStyle: Theme.of(context).textTheme.bodyText2,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0,
                                    left: 8.0,
                                    right: 8.0,
                                    bottom: 90),
                                child: Transform.scale(
                                  scale: 0.7,
                                  child: ImageIcon(
                                      AssetImage(
                                        "assets/icons/edit_bio.png",
                                      ),
                                      color: AppColors.icon_color),
                                ),
                              ),
                              hintStyle: Theme.of(context).textTheme.bodyText2,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 14, right: 14),
                          child: FlatButton(
                            minWidth: 2000,
                            height: 50,
                            color: AppColors.topbar_color,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Text(
                              "${AVMLocalization.of(context)?.getTranslatedValues('next')}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              if (validateStep1() && validateStep2()) {
                                setState(() {
                                  _currentStep = _currentStep + 1;
                                });
                              }
                              // if (_currentStep == 2) {
                              // } else {

                              // }
                            },
                          ),
                        ),
                      ]),
                    ),
                  if (_currentStep == 2)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          AvmEditTextFiled(
                            hint:
                                "${AVMLocalization.of(context)?.getTranslatedValues('adhar_card_number')}*",
                            textInputType: TextInputType.number,
                            textEditingController: _aadharCtr,
                            inputFormatter: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(12),
                              CardNumberFormatter()
                            ],
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Transform.scale(
                                scale: 0.7,
                                child: ImageIcon(
                                    AssetImage(
                                      "assets/icons/card.png",
                                    ),
                                    color: AppColors.icon_color),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              dynamic uploadedFile = await FileUploader.instance
                                  .onUploadImage(context);
                              if (uploadedFile != null) {
                                setState(() {
                                  aadharImage = uploadedFile;
                                });
                              }
                            },
                            child: aadharImage == null
                                ? Container(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            // padding: EdgeInsets.only(left: 80),
                                            child: Transform.scale(
                                              scale: 0.7,
                                              child: ImageIcon(
                                                  AssetImage(
                                                    "assets/icons/upload_document.png",
                                                  ),
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          Text(
                                            "${AVMLocalization.of(context)?.getTranslatedValues('adhar_Card_Upload')}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : Stack(
                                    overflow: Overflow.visible,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 241, 241, 241),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            )),
                                        child: Row(
                                          children: [
                                            Icon(aadharImage!.path
                                                    .contains(".pdf")
                                                ? Icons.picture_as_pdf_rounded
                                                : Icons.image),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "${aadharImage!.path.split("/").last}",
                                                maxLines: 1,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Positioned.fill(
                                          bottom: -2,
                                          right: 6,
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: CircleAvatar(
                                                radius: 10,
                                                child: Icon(
                                                    Icons.file_upload_outlined,
                                                    size: 14),
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .primaryColor),
                                          ))
                                    ],
                                  ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AvmEditTextFiled(
                            hint:
                                "${AVMLocalization.of(context)?.getTranslatedValues('enter_password')}*",
                            textInputType: TextInputType.visiblePassword,
                            obsecureText: _obsecureText,
                            textEditingController: _passwordCtr,
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Transform.scale(
                                scale: 0.7,
                                child: ImageIcon(
                                    AssetImage(
                                      "assets/icons/lock.png",
                                    ),
                                    size: 12,
                                    color: AppColors.icon_color),
                              ),
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: _toggleObscured,
                                child: Transform.scale(
                                  scale: 0.7,
                                  child: ImageIcon(
                                      _obsecureText
                                          ? AssetImage(
                                              "assets/icons/eye_off.png",
                                            )
                                          : AssetImage(
                                              "assets/icons/eye_on.png",
                                            ),
                                      size: 12,
                                      color: AppColors.icon_color),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Password must contain at least 8 characters, one uppercase, one lowercase, one digit, and one special character",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AvmEditTextFiled(
                            hint:
                                "${AVMLocalization.of(context)?.getTranslatedValues('confirm_password')}*",
                            toolbarOptions: ToolbarOptions(
                                paste: false, copy: true, selectAll: false),
                            textInputType: TextInputType.visiblePassword,
                            obsecureText: _obsecureText2,
                            textEditingController: _confrimPasswordCtr,
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Transform.scale(
                                scale: 0.7,
                                child: ImageIcon(
                                    AssetImage(
                                      "assets/icons/lock.png",
                                    ),
                                    size: 12,
                                    color: AppColors.icon_color),
                              ),
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: _toggleObscured2,
                                child: Transform.scale(
                                  scale: 0.7,
                                  child: ImageIcon(
                                      _obsecureText2
                                          ? AssetImage(
                                              "assets/icons/eye_off.png",
                                            )
                                          : AssetImage(
                                              "assets/icons/eye_on.png",
                                            ),
                                      size: 12,
                                      color: AppColors.icon_color),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Transform.scale(
                                  scale: 1.2,
                                  child: Checkbox(
                                    activeColor: AppColors.topbar_color,
                                    checkColor: AppColors.icon_color,
                                    visualDensity: VisualDensity.compact,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2)),
                                    value: _value,
                                    onChanged: (value) {
                                      setState(() {
                                        _value = !_value;
                                      });
                                    },
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _value = !_value;
                                    });
                                  },
                                  child: Text(
                                    '${AVMLocalization.of(context)?.getTranslatedValues('i_agree_terms_and_conditions')}',
                                    style: TextStyle(
                                        fontSize: 17.0, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 14, right: 14),
                            child: FlatButton(
                              minWidth: 2000,
                              height: 50,
                              color: AppColors.topbar_color,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: new Text(
                                "${AVMLocalization.of(context)?.getTranslatedValues('register')}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                if (validateStep1() &&
                                    validateStep2() &&
                                    validateStep3()) {
                                  if (_value == false) {
                                    AvmToast.instance.showErrorMessage(context,
                                        "${AVMLocalization.of(context)?.getTranslatedValues('please_accept_the_terms_and_condition')}");
                                    return;
                                  }
                                  RegisterModel registerModel =
                                      _createRegisterModel();
                                  registerBloc.add(RegisterSendOtpEvent(
                                      registerModel: registerModel));
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  // Spacer(),

                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );






  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1930),
        lastDate: DateTime.now());
    if (picked != null) {
      _birthDateCtr.text =
          "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
    }
  }

  RegisterModel _createRegisterModel() {
    return RegisterModel(
        name: _nameCtr.text.trim(),
        email: _emailCtr.text.trim(),
        mobile: _mobileCtr.text.trim(),
        birthDate: _birthDateCtr.text,
        aadharNo: _aadharCtr.text.trim(),
        password: _passwordCtr.text,
        aadharCard: aadharImage,
        address: _addressCtr.text.trim(),
        bloodGroup: _bloodGrpCtr,
        ownerBio: _bioCtr.text,
        ownerPhoto: ownerPhoto,
        pincode: _pincodeCtr.text);
  }

  bool validateStep1() {
    // containsLastSpace(_nameCtr.text);
    if (_nameCtr.text == "" || _nameCtr.text.isEmpty) {
      AvmToast.instance.showErrorMessage(context,
          "${AVMLocalization.of(context)?.getTranslatedValues('please_enter_name')}");
      return false;
    } else if (containsLastSpace(_nameCtr.text)) {
      AvmToast.instance.showErrorMessage(context,
          "${AVMLocalization.of(context)?.getTranslatedValues('invalid_name')}");
      return false;
    } else if (_emailCtr.text == "" || _emailCtr.text.isEmpty) {
      AvmToast.instance.showErrorMessage(context,
          "${AVMLocalization.of(context)?.getTranslatedValues('please_enter_email')}");
      return false;
    }
    //  else if (containsLastdot(_emailCtr.text)) {
    //   AvmToast.instance.showErrorMessage(context, "Invalid Email");
    //   return false;
    // }
    else if (_emailCtr.text.contains(" ") ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(_emailCtr.text)) {
      AvmToast.instance.showErrorMessage(context,
          "${AVMLocalization.of(context)?.getTranslatedValues('invalid_email')}");
      return false;
    } else if (_mobileCtr.text == "" || _mobileCtr.text.isEmpty) {
      AvmToast.instance.showErrorMessage(context,
          "${AVMLocalization.of(context)?.getTranslatedValues('please_enter_mobile_number')}");
      return false;
    } else if (!RegExp(r"^(\+91[\-\s]?)?[0]?(91)?[6789]\d{9}$")
        .hasMatch(_mobileCtr.text)) {
      AvmToast.instance.showErrorMessage(context,
          "${AVMLocalization.of(context)?.getTranslatedValues('invalid_mobile_number')}");
      return false;
    }
    //  else if (_addressCtr.text == "" || _addressCtr.text.isEmpty) {
    //   AvmToast.instance.showErrorMessage(context,
    //       "${AVMLocalization.of(context)?.getTranslatedValues('please_enter_address')}");
    //   return false;
    // }
    else if (!(_addressCtr.text == "" || _addressCtr.text.isEmpty) &&
        containsLastSpace(_addressCtr.text)) {
      AvmToast.instance.showErrorMessage(context,
          "${AVMLocalization.of(context)?.getTranslatedValues('please_enter_address')}");
      return false;
    }
    // else if (_pincodeCtr.text == "" || _pincodeCtr.text.isEmpty) {
    //   AvmToast.instance.showErrorMessage(context,
    //       "${AVMLocalization.of(context)?.getTranslatedValues('please_enter_pincode')}");
    //   return false;
    // }
    else if (!(_pincodeCtr.text == "" || _pincodeCtr.text.isEmpty) &&
        containsLastSpace(_pincodeCtr.text)) {
      AvmToast.instance.showErrorMessage(context,
          "${AVMLocalization.of(context)?.getTranslatedValues('invalid_pincode')}");
      return false;
    } else {
      return true;
    }
  }

  bool validateStep2() {
    // if (ownerPhoto == null) {
    //   AvmToast.instance.showErrorMessage(context,
    //       "${AVMLocalization.of(context)?.getTranslatedValues('please_select_owner_photo')}");
    //   return false;
    // }
    // else if (_birthDateCtr.text == "" || _birthDateCtr.text.isEmpty) {
    //   AvmToast.instance.showErrorMessage(context,
    //       "${AVMLocalization.of(context)?.getTranslatedValues('please_enter_date_of_birth')}");
    //   return false;
    // } else if (_bloodGrpCtr == null) {
    //   AvmToast.instance.showErrorMessage(context,
    //       "${AVMLocalization.of(context)?.getTranslatedValues('please_select_blood_group')}");
    //   return false;
    // } else if (_bioCtr.text == "" || _bioCtr.text.isEmpty) {
    //   AvmToast.instance.showErrorMessage(context,
    //       "${AVMLocalization.of(context)?.getTranslatedValues('please_enter_owner_bio')}");
    //   return false;
    // } else if (containsLastSpace(_bioCtr.text)) {
    //   AvmToast.instance.showErrorMessage(context,
    //       "${AVMLocalization.of(context)?.getTranslatedValues('please_enter_valid_bio')}");
    //   return false;
    // } else {
    //   return true;
    // }
    return true;
  }

  bool validateStep3() {
    // print( RegExp(r"^[2-9]{1}[0-9]{3}\s[0-9]{4}\s[0-9]{4}$").hasMatch(_aadharCtr.text));
    AadharValidator aadharValidator = new AadharValidator();
    String aadhdar = _aadharCtr.text.trim().split(" ").join();
    bool isValide = aadharValidator.validate(aadhdar);
    if (_aadharCtr.text == "" || _aadharCtr.text.isEmpty) {
      print("manoj");
      AvmToast.instance.showErrorMessage(context,
          "${AVMLocalization.of(context)?.getTranslatedValues('please_enter_aadhar_number')}");
      return false;
    } else if (!(isValide)) {
      AvmToast.instance.showErrorMessage(context,
          "${AVMLocalization.of(context)?.getTranslatedValues('invalid_aadhar')}");
      return false;
    } else if (aadharImage == null) {
      AvmToast.instance.showErrorMessage(context,
          "${AVMLocalization.of(context)?.getTranslatedValues('please_select_aadhar_image')}");
      return false;
    } else if (_passwordCtr.text == "" || _passwordCtr.text.isEmpty) {
      AvmToast.instance.showErrorMessage(context,
          "${AVMLocalization.of(context)?.getTranslatedValues('please_enter_password')}");
      return false;
    } else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(_passwordCtr.text)) {
      AvmToast.instance.showErrorMessage(context,
          "${AVMLocalization.of(context)?.getTranslatedValues('password_should_match_given_criteria')}");
      return false;
    } else if (_confrimPasswordCtr.text == "" ||
        _confrimPasswordCtr.text.isEmpty) {
      AvmToast.instance.showErrorMessage(context,
          "${AVMLocalization.of(context)?.getTranslatedValues('please_enter_confirm_passowrd')}");

      return false;
    } else if ((_passwordCtr.text != "" || _passwordCtr.text.isNotEmpty) &&
        (_confrimPasswordCtr.text != "" ||
            _confrimPasswordCtr.text.isNotEmpty)) {
      if (_passwordCtr.text != _confrimPasswordCtr.text) {
        AvmToast.instance.showErrorMessage(context,
            "${AVMLocalization.of(context)?.getTranslatedValues('password_should_match_with_confirm_password')}");
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }
}




