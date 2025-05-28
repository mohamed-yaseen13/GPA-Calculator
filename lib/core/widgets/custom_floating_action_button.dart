import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef ResultHandler =
    Future<void> Function(BuildContext context, dynamic result);

class CustomFloatingActionButton<TCubit extends Cubit<Object>>
    extends StatelessWidget {
  final Widget Function(BuildContext bottomSheetContext) bottomSheetBuilder;
  final ResultHandler onResult;

  const CustomFloatingActionButton({
    super.key,
    required this.bottomSheetBuilder,
    required this.onResult,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final result = await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder:
              (bottomSheetContext) => BlocProvider.value(
                value: context.read<TCubit>(),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
                  ),
                  child: bottomSheetBuilder(bottomSheetContext),
                ),
              ),
        );
        if (result != null) {
          await onResult(context, result);
        }
      },
      backgroundColor: Colors.yellow,
      foregroundColor: Colors.white,
      shape: const CircleBorder(),
      child: Icon(Icons.add),
    );
  }
}
