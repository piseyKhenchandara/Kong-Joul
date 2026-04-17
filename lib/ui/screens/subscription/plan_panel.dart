import 'package:flutter/material.dart';
import 'package:mini_velo/model/plan.dart';

class PlanPanel extends StatelessWidget {
  final Plan plan;

  const PlanPanel({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    final bool isActive = plan.status == "active";

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        color: isActive ? Colors.green.withOpacity(0.15) : Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 TOP ROW (icon + name)
          Row(
            children: [
              Image.asset(
                'images/ticket.png',
                width: 60,
                height: 44,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.confirmation_number, size: 40),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Text(
                  _formatName(plan.planName),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              if (isActive) const Icon(Icons.check_circle, color: Colors.green),
            ],
          ),

          const SizedBox(height: 12),

          // 🔹 DESCRIPTION
          Text(
            _getDescription(plan.time),
            style: const TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 12),

          // 🔹 BOTTOM ROW (price + time)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _getTimeText(plan.time),
                style: const TextStyle(fontSize: 14),
              ),

              Text(
                "\$${plan.price}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 🔹 helper: format name
  String _formatName(String name) {
    switch (name) {
      case "perRide":
        return "Pay Per Ride";
      case "daily":
        return "Daily Pass";
      case "weekly":
        return "Weekly Pass";
      case "monthly":
        return "Monthly Pass";
      default:
        return name;
    }
  }

  // 🔹 helper: description
  String _getDescription(int time) {
    if (time == 0) return "One ride only";
    if (time == 24) return "Full day access";
    if (time == 168) return "Full week access";
    if (time == 720) return "Full month access";
    return "$time hours access";
  }

  // 🔹 helper: time text
  String _getTimeText(int time) {
    if (time == 0) return "1 Ride";
    return "$time hrs";
  }
}
