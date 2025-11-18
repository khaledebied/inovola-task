part of 'expense_tracker_imports.dart';

@RoutePage(name: "ExpenseTrackerRoute")
class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  ExpenseTrackerController controller = ExpenseTrackerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          backgroundColor: context.colors.appBarBg,
          hasBackButton: false,
          height: 30,
        ),
        body: const Column(
          children: [
          ],
        ));
  }
}
