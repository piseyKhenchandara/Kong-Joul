import 'package:flutter/material.dart';
import '../../../model/plan.dart';
import '../../theme/app_colors.dart';
import 'plan_panel.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  late List<Plan> plans;

  @override
  void initState() {
    super.initState();

    // create all 4 plans
    plans = PlanEnum.values.map((e) => Plan.fromEnum(e)).toList();
  }

  void buyPlan(int index) {
    setState(() {
      // deactivate all first (optional)
      for (var p in plans) {
        p.status = "inactive";
      }

      // activate selected
      plans[index].status = "active";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50,),
          Text("SUBSCRIPTION", style: TextStyle(color: Colors.green, fontSize: 50),),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: plans.length,
                itemBuilder: (context, index) {
                  final plan = plans[index];
            
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
            
                      child: Row(
                        children: [
                          // your panel UI
                          Expanded(child: PlanPanel(plan: plan)),
            
                          const SizedBox(width: 10),
            
                          ElevatedButton(
                            onPressed: () => buyPlan(index),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: plan.status == "active"
                                  ? Colors.grey
                                  : AppColors.primary,
                            ),
                            child: Text(plan.status == "active" ? "Active" : "Buy"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
