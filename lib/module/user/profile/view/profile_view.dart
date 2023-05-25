import 'package:flutter/material.dart';
import 'package:bakery/core.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          actions: [
            InkWell(
              onTap: () => controller.doLogout(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.logout,
                    color: textColor1,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: bgColor,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.6,
                      image: AssetImage(
                          "assets/image/margarita-zueva-CY-OkOICA9o-unsplash.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 60,
                left: 0,
                right: 0,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                      top: 40,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: (MediaQuery.of(context).size.width - 160) / 2,
                      child: SizedBox(
                        width: 160,
                        height: 160.0,
                        child: Column(
                          children: [
                            Container(
                              height: 100.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(UserProfileService
                                      .data!["photo"]
                                      .toString()),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    16.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              UserProfileService.data!["name"].toString(),
                              style: const TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              UserProfileService.data!["email"],
                              style: const TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 280,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Order History",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "status order",
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      LayoutBuilder(
                        builder: (context, constraint) {
                          List menus = [
                            {
                              "icon": Icons.pending_actions,
                              "label": "Pending",
                              "onTap": () {},
                            },
                            {
                              "icon": Icons.delivery_dining,
                              "label": "Current",
                              "onTap": () {},
                            },
                            {
                              "icon": Icons.paid,
                              "label": "Completed",
                              "onTap": () {},
                            },
                            {
                              "icon": Icons.reviews,
                              "label": "Review",
                              "onTap": () {},
                            },
                          ];

                          return Wrap(
                            children: List.generate(
                              menus.length,
                              (index) {
                                var item = menus[index];

                                var size = constraint.biggest.width / 4;

                                return SizedBox(
                                  width: size,
                                  height: size,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.blueGrey,
                                      animationDuration:
                                          const Duration(milliseconds: 1000),
                                      backgroundColor: Colors.transparent,
                                      splashFactory: InkSplash.splashFactory,
                                      shadowColor: Colors.transparent,
                                      elevation: 0.0,
                                    ),
                                    onPressed: () => item["onTap"](),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            item["icon"],
                                            size: 24.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6.0,
                                        ),
                                        Text(
                                          "${item["label"]}",
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 11.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
