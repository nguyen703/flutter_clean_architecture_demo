import 'package:advicer/2_application/pages/advice/bloc/advice_bloc.dart';
import 'package:advicer/2_application/pages/advice/widgets/advice_appbar.dart';
import 'package:advicer/2_application/pages/advice/widgets/advice_field.dart';
import 'package:advicer/2_application/pages/advice/widgets/custom_button.dart';
import 'package:advicer/2_application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdvicePageWrapperProvider extends StatelessWidget {
  const AdvicePageWrapperProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdviceBloc(),
      child: const AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
        appBar: AdviceAppbar(themeData: themeData),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Expanded(child: Center(
                child: BlocBuilder<AdviceBloc, AdviceState>(
                  builder: (context, state) {
                    if (state is AdviceInitial) {
                      return Text(
                        "Your advice is waiting for you",
                        style: themeData.textTheme.headline1,
                      );
                    }
                    if (state is AdviceLoadingState) {
                      return CircularProgressIndicator(
                          color: themeData.colorScheme.secondary);
                    }
                    if (state is AdviceLoadedState) {
                      return const AdviceField(
                          advice: ''' "Hello darkness my old friend" ''');
                    }
                    if (state is AdviceErrorState) {
                      return const ErrorMessage(
                          message: "Oops.. something's wrong");
                    }
                    return const SizedBox.shrink();
                  },
                ),
              )),
              SizedBox(
                  height: 200,
                  child: Center(
                    child: CustomButton(
                        onTap: () => BlocProvider.of<AdviceBloc>(context)
                            .add(AdviceRequestedEvent())),
                  )),
            ],
          ),
        ));
  }
}
