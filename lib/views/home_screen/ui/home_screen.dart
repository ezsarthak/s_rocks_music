import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:s_rocks_music/models/music_service_model.dart';
import 'package:s_rocks_music/utils/dimensions.dart';
import 'package:s_rocks_music/views/home_screen/bloc/home_bloc.dart';
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
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        Widget buildEmpty() {
          return const Center(
            child: Text(
              'No services available',
              style: TextStyle(color: Colors.white),
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
                title: MinimalSearchBar(),
                actions: [
                  CircleAvatar(
                    backgroundColor: Color(0xffEADDFF),
                    child: IconButton(
                      icon: const Icon(
                        Icons.person_outline_rounded,
                        color: Color(0xff4F378A),
                      ),
                      onPressed: () {
                      },
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: dimensions.height * 0.4,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: const Radius.circular(15),
                          bottomLeft: const Radius.circular(15),
                        ),

                        color: const Color(0xffA90140),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Hire hand-picked Pros for popular music services',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.syne(
                          fontSize: dimensions.h6,
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
