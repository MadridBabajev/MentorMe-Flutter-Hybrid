import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart'; // <-- import image_picker here
import 'package:mentor_me/common/constants/colors.dart';
import 'package:mentor_me/state/views/ml_features/ml_features_provider.dart';

/// A Flutter page that demonstrates local OCR and Summarization (inference).
/// It has:
///   - A button to pick an image from gallery
///   - A text field for manual text to summarize
///   - Buttons to run local OCR, Summarize, or both
///   - A place to display results
class MlFeaturesView extends ConsumerStatefulWidget {
  const MlFeaturesView({super.key});

  @override
  ConsumerState<MlFeaturesView> createState() => _MlFeaturesViewState();
}

class _MlFeaturesViewState extends ConsumerState<MlFeaturesView> {
  File? _selectedImage;
  final _manualTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Ensure the models are loaded once
    ref.read(mlFeaturesProvider.notifier).loadAllModels();
  }

  @override
  Widget build(BuildContext context) {
    final mlFeaturesState = ref.watch(mlFeaturesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ML Features",
          style: GoogleFonts.poppins(color: AppColors.textIconsColor),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      backgroundColor: AppColors.lightPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              // Image picker row
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: mlFeaturesState.isLoading ? null : _pickImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.photo_library, color: AppColors.textIconsColor),
                    label: const Text("Choose an Image", style: TextStyle(color: AppColors.textIconsColor)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _selectedImage == null
                          ? "No image selected"
                          : _selectedImage!.path.split("/").last,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),
              // Text area for manual summarization
              TextField(
                controller: _manualTextController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Enter text to summarize",
                  labelStyle: GoogleFonts.poppins(color: AppColors.secondaryTextColor),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.darkPrimaryColor),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Buttons row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildActionButton(
                    label: "OCR (Local)",
                    onPressed: mlFeaturesState.isLoading
                        ? null
                        : () => ref.read(mlFeaturesProvider.notifier)
                        .runLocalOcr(_selectedImage),
                  ),
                  _buildActionButton(
                    label: "Summarize (Local)",
                    onPressed: mlFeaturesState.isLoading
                        ? null
                        : () {
                      final text = _manualTextController.text;
                      ref
                          .read(mlFeaturesProvider.notifier)
                          .runLocalSummarize(text);
                    },
                  )
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildActionButton(
                  label: "OCR+Summarize",
                  onPressed: mlFeaturesState.isLoading
                      ? null
                      : () => ref.read(mlFeaturesProvider.notifier)
                      .runLocalOcrAndSummarize(_selectedImage))
                ]
              ),
              const SizedBox(height: 20),

              // Loading indicator & results
              if (mlFeaturesState.isLoading) ...[
                const CircularProgressIndicator(),
                const SizedBox(height: 20),
              ],

              if (mlFeaturesState.errorMessage.isNotEmpty)
                Text(
                  "Error: ${mlFeaturesState.errorMessage}",
                  style: GoogleFonts.poppins(color: AppColors.errorColor, fontSize: 14),
                ),

              if (mlFeaturesState.ocrText.isNotEmpty) ...[
                const SizedBox(height: 10),
                Text(
                  "Local OCR result:",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                Text(
                  mlFeaturesState.ocrText.join("\n"),
                  style: GoogleFonts.poppins(),
                ),
              ],

              if (mlFeaturesState.summaryText.isNotEmpty) ...[
                const SizedBox(height: 10),
                Text("Local Summarization result:",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                Text(mlFeaturesState.summaryText, style: GoogleFonts.poppins()),
              ],

              if (mlFeaturesState.combinedText.isNotEmpty) ...[
                const SizedBox(height: 10),
                Text("Local OCR+Summarization combined:",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                Text(mlFeaturesState.combinedText, style: GoogleFonts.poppins()),
              ],
            ],
          ),
        ),
      ),
    );
  }

  /// Helper widget for the three main action buttons
  Widget _buildActionButton({
    required String label,
    required VoidCallback? onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(label, style: GoogleFonts.poppins(color: AppColors.textIconsColor)),
    );
  }

  /// Picks an image using the system gallery
  Future<void> _pickImage() async {
    try {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked != null) {
        setState(() => _selectedImage = File(picked.path));
      }
    } catch (e) {
      debugPrint("Image picking error: $e");
    }
  }
}
