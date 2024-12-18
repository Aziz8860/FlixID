import 'package:flix_id/presentation/misc/methods.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_id/presentation/pages/wallet_page/methods/recent_transactions.dart';
import 'package:flix_id/presentation/widgets/back_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletPage extends ConsumerWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Column(
              children: [
                BackNavigationBar(
                  'My Wallet',
                  onTap: () => ref.read(routerProvider).pop(),
                ),
                verticalSpace(24),
                // wallet card,
                ElevatedButton(
                    onPressed: () {
                      ref.read(userDataProvider.notifier).topUp(100000);
                    },
                    child: const Text('Top Up')),
                verticalSpace(24),
                ...recentTransactions(ref),
              ],
            ),
          )
        ],
      ),
    );
  }
}
