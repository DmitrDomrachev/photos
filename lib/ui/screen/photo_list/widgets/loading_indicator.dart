import 'package:flutter/cupertino.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverPadding(
      padding: EdgeInsets.only(bottom: 25),
      sliver: SliverToBoxAdapter(
        child: Center(
            child: SizedBox(
              width: 22,
              height: 22,
              child: CupertinoActivityIndicator(
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            )),
      ),
    );
  }
}