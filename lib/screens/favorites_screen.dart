import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/quote_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Quotes',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<QuoteProvider>(
        builder: (context, provider, child) {
          final favorites = provider.favoriteQuotes;

          if (favorites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border_rounded,
                    size: 80,
                    color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No favorites yet.',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final quote = favorites[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '"${quote.quote}"',
                        style: GoogleFonts.lora(
                          fontSize: 18,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '- ${quote.author}',
                            style: GoogleFonts.inter(
                              fontStyle: FontStyle.italic,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.copy_rounded, size: 20),
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(text: '"${quote.quote}" - ${quote.author}'));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Quote copied!')),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.share_rounded, size: 20),
                                onPressed: () {
                                  // ignore: deprecated_member_use
                                  Share.share('"${quote.quote}" - ${quote.author}');
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.favorite_rounded, color: Colors.redAccent, size: 20),
                                onPressed: () {
                                  provider.toggleFavorite(quote);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
