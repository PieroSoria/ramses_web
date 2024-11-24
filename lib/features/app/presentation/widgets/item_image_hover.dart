import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramses_web/features/app/data/models/info_model.dart';
import 'package:ramses_web/features/app/presentation/bloc/app_bloc.dart';
import 'package:ramses_web/features/app/presentation/widgets/overlay_container.dart';

class ItemImageHover extends StatelessWidget {
  const ItemImageHover({
    super.key,
    required this.data,
    required this.isindex,
  });

  final InfoModel data;
  final bool isindex;

  @override
  Widget build(BuildContext context) {
    final appbloc = context.read<AppBloc>();
    return MouseRegion(
      onEnter: (_) => appbloc.add(AppEvent.onChangeHover(ishover: true)),
      onExit: (_) => appbloc.add(AppEvent.onChangeHover(ishover: false)),
      child: Stack(
        children: [
          Container(
            width: 600,
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            margin: const EdgeInsets.only(bottom: 20, top: 40),
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(data.imagen!),
                fit: BoxFit.fill,
              ),
            ),
          ),
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              if (state.ishover! && isindex) {
                return HoverOverlay(data: data);
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}