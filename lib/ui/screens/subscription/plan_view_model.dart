import 'package:flutter/material.dart';
import 'package:mini_velo/data/repositories/plan_repository.dart';
import '../../../model/plan.dart';

class PlanViewModel extends ChangeNotifier {
  final PlanRepository _planRepository;
  PlanViewModel(this._planRepository);

  List<Plan> _plans = [];
  bool _isLoading = false;
  String? _error;
  Plan? _selectedPlan;
  Plan? _activePlan;
  DateTime? _expiresAt;

  List<Plan> get plans => _plans;
  bool get isLoading => _isLoading;
  String? get error => _error;
  Plan? get selectedPlan => _selectedPlan;
  Plan? get activePlan => _activePlan;
  DateTime? get expiresAt => _expiresAt;

  void selectPlan(Plan plan) {
    _selectedPlan = plan;
    notifyListeners();
  }

  Future<void> fetchAllPlans() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _plans = await _planRepository.fetchAllPlans();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchUserPlan(String userId) async {
    try {
      _activePlan = await _planRepository.fetchUserActivePlan(userId);
      _expiresAt = await _planRepository.fetchPlanExpiresAt(userId);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> init(String userId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _plans = await _planRepository.fetchAllPlans();
      _activePlan = await _planRepository.fetchUserActivePlan(userId);
      _expiresAt = await _planRepository.fetchPlanExpiresAt(userId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> buyPlan(String userId, Plan plan) async {
    try {
      await _planRepository.buyPlan(userId: userId, plan: plan);
      // refresh active plan after purchase
      _activePlan = await _planRepository.fetchUserActivePlan(userId);
      _expiresAt = await _planRepository.fetchPlanExpiresAt(userId);
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}
