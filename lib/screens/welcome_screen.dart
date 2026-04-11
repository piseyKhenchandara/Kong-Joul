import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/primary_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              _BikeHeader(),
              const SizedBox(height: 32),
              _MapCard(),
              const Spacer(),
              PrimaryButton(
                label: 'Explore Map',
                icon: Icons.map_outlined,
                onPressed: () {
                  // TODO: navigate to map screen
                },
              ),
              const SizedBox(height: 18),
              _LoginLink(),
              const Spacer(),
              _Footer(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Bike icon + title + tagline ──────────────────────────────────────────────

class _BikeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/ride.png', width: 72, height: 72),
        const SizedBox(height: 16),
        const Text(
          'VeloToulouse',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Your city, your ride, your way',
          style: TextStyle(
            fontSize: 15,
            color: AppColors.textDark,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}

// ── Map image card ───────────────────────────────────────────────────────────

class _MapCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/images/image.png',
        width: double.infinity,
        height: 220,
        fit: BoxFit.cover,
      ),
    );
  }
}

// ── Log in link ──────────────────────────────────────────────────────────────

class _LoginLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: navigate to login screen
      },
      child: const Text(
        'Log in to your account',
        style: TextStyle(
          fontSize: 15,
          color: AppColors.primary,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// ── Footer ───────────────────────────────────────────────────────────────────

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      '© Official-City-Service | VeloToulouse',
      style: TextStyle(
        fontSize: 11,
        color: AppColors.textMuted,
        letterSpacing: 0.3,
      ),
    );
  }
}
