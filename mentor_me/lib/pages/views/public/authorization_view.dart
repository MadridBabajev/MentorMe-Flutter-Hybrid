import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_me/common/constants/app_navigation_routes.dart';
import 'package:mentor_me/common/constants/colors.dart';
import 'package:mentor_me/l10n/app_localizations.dart';
import 'package:mentor_me/pages/components/animations/loading_animation_view.dart';
import 'package:mentor_me/state/authorization/auth_provider.dart';
import 'package:mentor_me/state/loading/is_loading_provider.dart';
import 'package:mentor_me/state/views/main/view_navigation_provider.dart';

final isLoginModeProvider = StateProvider<bool>((ref) => true);

class AuthorizationView extends ConsumerStatefulWidget {
  const AuthorizationView({super.key});

  @override
  ConsumerState<AuthorizationView> createState() => _AuthorizationViewState();
}

class _AuthorizationViewState extends ConsumerState<AuthorizationView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobilePhoneController = TextEditingController();
  final countryController = TextEditingController();
  final isTutor = ValueNotifier<bool>(false);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    mobilePhoneController.dispose();
    countryController.dispose();
    isTutor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoginMode = ref.watch(isLoginModeProvider);
    final authState = ref.watch(authProvider);
    final isLoading = ref.watch(isLoadingProvider);
    final errorMessage =
        !authState.isAuthorized ? authState.errorMessage : null;
    final translations = LocalisationStrings.of(context);

    // Reset registration-specific fields when toggling to login mode
    if (isLoginMode) {
      firstNameController.clear();
      lastNameController.clear();
      confirmPasswordController.clear();
      mobilePhoneController.clear();
      countryController.clear();
      isTutor.value = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isLoginMode ? translations!.login : translations!.register,
          style: GoogleFonts.poppins(color: AppColors.textIconsColor),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Center(
        child: isLoading
            ? const LoadingAnimationView()
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (errorMessage != null) ...[
                      Text(
                        errorMessage,
                        style: GoogleFonts.poppins(
                          color: AppColors.errorColor,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    _buildTextInput(translations.emailField, Icons.email,
                        emailController, false),
                    const SizedBox(height: 16),
                    _buildTextInput(translations.passwordField, Icons.lock,
                        passwordController, true),
                    if (!isLoginMode) ...[
                      const SizedBox(height: 16),
                      _buildTextInput(translations.confirmPasswordField,
                          Icons.lock, confirmPasswordController, true),
                      const SizedBox(height: 16),
                      _buildTextInput(translations.firstNameField, Icons.person,
                          firstNameController, false),
                      const SizedBox(height: 16),
                      _buildTextInput(translations.lastNameField, Icons.person,
                          lastNameController, false),
                      const SizedBox(height: 16),
                      _buildTextInput(translations.mobileField, Icons.phone,
                          mobilePhoneController, false),
                      const SizedBox(height: 16),
                      _buildDropdownInput(
                          translations.countryField, countryController),
                      const SizedBox(height: 16),
                    ],
                    ValueListenableBuilder<bool>(
                      valueListenable: isTutor,
                      builder: (_, value, __) => Material(
                        type: MaterialType.transparency,
                        child: CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            translations.isTutorField,
                            style: GoogleFonts.poppins(
                              color: AppColors.primaryTextColor,
                            ),
                          ),
                          value: value,
                          activeColor: AppColors.darkPrimaryColor,
                          onChanged: (newValue) =>
                              isTutor.value = newValue ?? false,
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () async {
                        final notifier = ref.read(authProvider.notifier);
                        final isTutorValue = isTutor.value;
                        if (isLoginMode) {
                          await notifier.login(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            isTutorValue,
                          );
                          if (authState.isAuthorized) {
                            bodyNavigatorKey.currentState
                                ?.pushNamedAndRemoveUntil(
                              AppRoutes.profile,
                                  (route) => false,
                            );
                          }
                        } else {
                          await notifier.register(
                            firstNameController.text.trim(),
                            lastNameController.text.trim(),
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            confirmPasswordController.text.trim(),
                            mobilePhoneController.text.trim(),
                            isTutorValue,
                            countryController.text.trim(),
                          );
                          if (authState.isAuthorized) {
                            bodyNavigatorKey.currentState
                                ?.pushNamedAndRemoveUntil(
                              AppRoutes.profile,
                                  (route) => false,
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text(
                        isLoginMode
                            ? translations.login
                            : translations.register,
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildModeSwitch(isLoginMode, translations),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildTextInput(String label, IconData icon,
      TextEditingController controller, bool obscureText) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(icon, color: AppColors.primaryColor),
        labelText: label,
        labelStyle: GoogleFonts.poppins(color: AppColors.primaryTextColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.darkPrimaryColor),
        ),
      ),
    );
  }

  Widget _buildDropdownInput(String label, TextEditingController controller) {
    return DropdownButtonFormField<String>(
      value: controller.text.isNotEmpty ? controller.text : null,
      items: ['Estonia', 'Latvia', 'Lithuania']
          .map((country) => CountryDropdownItem(country: country))
          .toList(),
      onChanged: (value) {
        controller.text = value ?? '';
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(Icons.public, color: AppColors.primaryColor),
        labelText: label,
        labelStyle: GoogleFonts.poppins(color: AppColors.primaryTextColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.darkPrimaryColor),
        ),
      ),
    );
  }

  Widget _buildModeSwitch(bool isLoginMode, LocalisationStrings translations) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLoginMode ? translations.haveNoAccount : translations.haveAnAccount,
          style: GoogleFonts.poppins(color: AppColors.primaryTextColor),
        ),
        TextButton(
          onPressed: () {
            ref.read(isLoginModeProvider.notifier).state = !isLoginMode;
          },
          child: Text(
            isLoginMode ? translations.register : translations.login,
            style: GoogleFonts.poppins(color: AppColors.accentColor),
          ),
        ),
      ],
    );
  }
}

class CountryDropdownItem extends DropdownMenuItem<String> {
  CountryDropdownItem({super.key, required String country})
      : super(
          value: country,
          child: Row(
            children: [
              Icon(Icons.flag, color: AppColors.primaryColor),
              const SizedBox(width: 8),
              Text(country),
            ],
          ),
        );
}
