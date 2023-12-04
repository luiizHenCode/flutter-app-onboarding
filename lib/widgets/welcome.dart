import 'package:flutter/material.dart';
import 'package:onboarding/models/welcome_model.dart';

class Welcome extends StatelessWidget {
  const Welcome({
    super.key,
    required this.welcomeData,
    required this.onNextPage,
  });

  final WelcomeModel welcomeData;
  final void Function() onNextPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.0),
                  bottomRight: Radius.circular(24.0),
                ),
              ),
              child: Placeholder(
                strokeWidth: 0.0,
                child: Image(
                  image: AssetImage(welcomeData.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 24.0,
                bottom: 48.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    welcomeData.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    welcomeData.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56.0,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 56.0,
                    child: TextButton(
                      onPressed: onNextPage,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.blueAccent,
                        ),
                        foregroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                            horizontal: 32.0,
                            vertical: 16.0,
                          ),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            welcomeData.buttonLabel,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
