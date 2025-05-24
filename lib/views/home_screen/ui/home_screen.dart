import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:s_rocks_music/data/models/music_service_model.dart';
import 'package:s_rocks_music/core/utils/dimensions.dart';
import 'package:s_rocks_music/views/home_screen/bloc/home_bloc.dart';
import 'package:s_rocks_music/widgets/app_text.dart';
import 'package:s_rocks_music/widgets/music_service_card.dart';
import 'package:s_rocks_music/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = Dimensions(context);
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      buildWhen: (previous, current) => current is HomeActionState,
      listenWhen: (previous, current) => current is HomeActionState,
      listener: (context, state) async {},
      builder: (context, state) {
        homeBloc.add(HomeInitialEvent());
        Widget buildLoading() {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }

        Widget buildError(String errorMessage) {
          return Center(
            child: AppText(
              text: errorMessage,
              color: Colors.red,
              fontSize: dimensions.h3,
              fontWeight: FontWeight.bold,
            ),
          );
        }

        Widget buildEmpty() {
          return Center(
            child: AppText(
              text: 'No services available',
              color: Colors.white,
              fontSize: dimensions.h3,
              fontWeight: FontWeight.bold,
            ),
          );
        }

        switch (state.runtimeType) {
          case HomeInitial:
            return buildLoading();
          case SuccessState:
            final services = (state as SuccessState).services;
            if (services.isEmpty) {
              return buildEmpty();
            }
            return Scaffold(
              backgroundColor: const Color(0xff18171C),
              appBar: AppBar(
                backgroundColor: Color(0xffA90140),
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color(0xffA90140), // ensures correct color
                  statusBarIconBrightness: Brightness.light,
                ),
                title: AppSearchBar(),
                actions: [
                  CircleAvatar(
                    backgroundColor: Color(0xffEADDFF),
                    child: IconButton(
                      icon: const Icon(
                        Icons.person_outline_rounded,
                        color: Color(0xff4F378A),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: dimensions.height * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: const Radius.circular(15),
                              bottomLeft: const Radius.circular(15),
                            ),

                            gradient: LinearGradient(
                              colors: [
                                const Color(0xffA90140),
                                const Color(0xff550120),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                        Positioned(
                          left: -(dimensions.width) * 0.1,
                          top: dimensions.height * 0.12,
                          child: SizedBox(
                            height: dimensions.width * 0.4,
                            child: Image(image: AssetImage("assets/disk.png")),
                          ),
                        ),
                        Positioned(
                          right: -(dimensions.width) * 0.16,
                          top: dimensions.height * 0.1,
                          child: SizedBox(
                            height: dimensions.width * 0.4,
                            child: Image(
                              image: AssetImage("assets/guitar.png"),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText(
                              text: 'Claim your',
                              fontSize: dimensions.h5,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Free Demo',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lobster(
                                  fontSize: dimensions.h1,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            AppText(
                              text: 'for custom music production',
                              fontSize: dimensions.h5,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            SizedBox(height: dimensions.height * 0.04),

                            ElevatedButton(
                              onPressed: () {},
                              child: AppText(
                                text: 'Book Now',
                                fontSize: dimensions.h7,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: AppText(
                          text:
                              'Hire hand-picked Pros for popular music services',
                          fontSize: dimensions.h5,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      shrinkWrap: true,
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        MusicServiceModel service = services[index];
                        return MusicServiceCard(service: service);
                      },
                    ),
                  ],
                ),
              ),
            );
          case ErrorState:
            final errorMessage = (state as ErrorState).errorMessage;
            return buildError(errorMessage);
          default:
            return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
