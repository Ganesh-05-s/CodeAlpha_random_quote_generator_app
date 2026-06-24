import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/quote_provider.dart';
import '../widgets/quote_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = context.select<QuoteProvider, String?>((p) => p.selectedCategory) ?? 'QuoteVerse';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Consumer<QuoteProvider>(
        builder: (context, provider, child) {
          final quote = provider.currentQuote;
          
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 600),
                    switchInCurve: Curves.easeOutBack,
                    switchOutCurve: Curves.easeInCubic,
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0.0, 0.2),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                      );
                    },
                    child: QuoteCard(
                      key: ValueKey<String>(quote.id),
                      quote: quote,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton.filledTonal(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: '"${quote.quote}" - ${quote.author}'));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Quote copied to clipboard!'),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.copy_rounded),
                        tooltip: 'Copy Quote',
                      ),
                      const SizedBox(width: 16),
                      IconButton.filledTonal(
                        onPressed: () {
                          provider.toggleFavorite();
                        },
                        icon: Icon(
                          provider.isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                          color: provider.isFavorite ? Colors.redAccent : null,
                        ),
                        tooltip: 'Favorite',
                      ),
                      const SizedBox(width: 16),
                      IconButton.filledTonal(
                        onPressed: () {
                          // ignore: deprecated_member_use
                          Share.share('"${quote.quote}" - ${quote.author}');
                        },
                        icon: const Icon(Icons.share_rounded),
                        tooltip: 'Share Quote',
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: FilledButton(
                      onPressed: () {
                        provider.generateNewQuote();
                      },
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Generate New Quote',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
