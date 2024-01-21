import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SwipeRightAnimation extends StatefulWidget {
  const SwipeRightAnimation({super.key});

  @override
  State<SwipeRightAnimation> createState() => _SwipeRightAnimationState();
}

class _SwipeRightAnimationState extends State<SwipeRightAnimation>
    with TickerProviderStateMixin {
  late PageController _pageController;
  bool showIcon = false;
  bool rightIconClicked = true;
  late AnimationController _shrinkController;
  late Animation<double> _shrinkAnimation;
  late AnimationController _iconZoomController;
  late Animation<double> _iconZoomAnimation;
  int currentIndex = 0;
  @override
  void initState() {
    _pageController = PageController();
    _shrinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
    );

    _iconZoomController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
    );

    _iconZoomAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _iconZoomController,
        curve: Curves.easeOutExpo,
      ),
    );

    _shrinkAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _shrinkController,
        curve: Curves.easeIn,
      ),
    );

    _shrinkAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        debugPrint('Shrink Animation completed');
        setState(() {
          showIcon = true;
        });
        _iconZoomController.forward();
        Future.delayed(const Duration(milliseconds: 1500), () {
          _pageController.animateToPage(
            currentIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
          setState(() {
            showIcon = false;
          });
        });
      }
    });

    _iconZoomAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        debugPrint('Icon Animation completed');
        _iconZoomController.reverse();
        _shrinkController.reverse();
      }
    });
    super.initState();
  }

  void _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose() {
    _shrinkController.dispose();
    _iconZoomController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Home'),
        elevation: 20,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.settings_rounded),
          )
        ],
      ),
      body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (value) {
            _onPageChanged(value);
          },
          scrollDirection: Axis.vertical,
          itemCount: profileList.length + 1,
          itemBuilder: (context, index) {
            if (index == profileList.length - 1) {
              return const Center(
                  child: Text(
                'There are no more\nprofiles in this list\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ));
            }
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: showIcon
                  ? ZoomIn(
                      child: rightIconClicked
                          ? const Icon(
                              Icons.favorite_rounded,
                              size: 150,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.close_rounded,
                              size: 150,
                              color: Colors.red,
                            ),
                    )
                  : FadeInUp(
                      child: AnimatedBuilder(
                          animation: _shrinkAnimation,
                          builder: (context, child) {
                            return ScaleTransition(
                              scale: _shrinkAnimation,
                              child: _profileCard(
                                profileName: profileList[index].profileName,
                                profilePic: profileList[index].profilePic,
                                age: profileList[index].age,
                                index: index,
                              ),
                            );
                          }),
                    ),
            );
          }),
    );
  }

  Widget _profileCard({
    required String profileName,
    required String profilePic,
    required String age,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: profilePic,
                    height: 550,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: Row(
                      children: [
                        Text(
                          profileName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                  // bottomLeft
                                  offset: Offset(-1, -1),
                                  color: Colors.black),
                              Shadow(
                                  // bottomRight
                                  offset: Offset(1, -1),
                                  color: Colors.black),
                              Shadow(
                                  // topRight
                                  offset: Offset(1, 1),
                                  color: Colors.black),
                              Shadow(
                                  // topLeft
                                  offset: Offset(-1, 1),
                                  color: Colors.black),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          age,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                  // bottomLeft
                                  offset: Offset(-1, -1),
                                  color: Colors.black),
                              Shadow(
                                  // bottomRight
                                  offset: Offset(1, -1),
                                  color: Colors.black),
                              Shadow(
                                  // topRight
                                  offset: Offset(1, 1),
                                  color: Colors.black),
                              Shadow(
                                  // topLeft
                                  offset: Offset(-1, 1),
                                  color: Colors.black),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* reject button
                  ButtonWidget(
                    ontap: () {
                      setState(() {
                        rightIconClicked = false;
                      });
                      _shrinkController.forward();
                      Future.delayed(const Duration(milliseconds: 1500), () {
                        _pageController.animateToPage(
                          index + 1,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                        setState(() {
                          showIcon = false;
                        });
                      });
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 50,
                      color: Colors.red,
                    ),
                    padding: 5,
                  ),
                  //*previous profile button
                  ButtonWidget(
                    ontap: () {
                      _pageController.animateToPage(
                        index - 1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: const Icon(
                      Icons.replay,
                      size: 30,
                      color: Colors.amber,
                    ),
                    padding: 10,
                  ),
                  //*like button
                  ButtonWidget(
                    ontap: () {
                      setState(() {
                        rightIconClicked = true;
                      });

                      _shrinkController.forward();

                      Future.delayed(const Duration(milliseconds: 1500), () {
                        _pageController.animateToPage(
                          index + 1,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );

                        setState(() {
                          showIcon = false;
                        });
                      });
                    },
                    icon: const Icon(
                      Icons.favorite_rounded,
                      size: 50,
                      color: Colors.green,
                    ),
                    padding: 5,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//* button design
class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.ontap,
    required this.icon,
    required this.padding,
  });
  final VoidCallback ontap;
  final Widget icon;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color.fromARGB(255, 40, 38, 38),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                offset: Offset(5, 5),
                spreadRadius: 1,
              )
            ]),
        padding: EdgeInsets.all(padding),
        child: icon,
      ),
    );
  }
}

class ProfileDataModel {
  final String profileName;
  final String profilePic;
  final String age;

  ProfileDataModel({
    required this.profileName,
    required this.profilePic,
    required this.age,
  });
}

List<ProfileDataModel> profileList = [
  ProfileDataModel(
    profileName: 'Emma',
    profilePic:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    age: '20',
  ),
  ProfileDataModel(
    profileName: 'Olivia',
    profilePic:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    age: '22',
  ),
  ProfileDataModel(
    profileName: 'Ava',
    profilePic:
        'https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=1961&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    age: '25',
  ),
  ProfileDataModel(
    profileName: 'Isabella',
    profilePic:
        'https://images.unsplash.com/photo-1548142813-c348350df52b?q=80&w=1889&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    age: '23',
  ),
  ProfileDataModel(
    profileName: 'Sophia',
    profilePic:
        'https://images.unsplash.com/photo-1505535762334-d060c7df86e9?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    age: '21',
  ),
  ProfileDataModel(
    profileName: 'Mia',
    profilePic:
        'https://images.unsplash.com/photo-1541823709867-1b206113eafd?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    age: '24',
  ),
  ProfileDataModel(
    profileName: 'Amelia',
    profilePic:
        'https://images.unsplash.com/photo-1464863979621-258859e62245?q=80&w=1886&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    age: '19',
  ),
  ProfileDataModel(
    profileName: 'Harper',
    profilePic:
        'https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    age: '26',
  ),
  ProfileDataModel(
    profileName: 'Evelyn',
    profilePic:
        'https://images.unsplash.com/photo-1503034230949-7fd0e1d0a9d6?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    age: '20',
  ),
  ProfileDataModel(
    profileName: 'Abigail',
    profilePic:
        'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?q=80&w=1941&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    age: '23',
  ),
];
