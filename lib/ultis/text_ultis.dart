/// Text utilities used across the app.
///
/// Provides small, well-tested helpers for truncating text safely so UI
/// components (cards, chips, list tiles) can show short previews with
/// optional ellipsis.
///
/// Text utilities used across the app.
///
/// Provides small, well-tested helpers for truncating text safely so UI
/// components (cards, chips, list tiles) can show short previews with
/// optional ellipsis.
///
/// Usage examples:
///   import 'package:food_delivery/ultis/text_ultis.dart';
///
///   final short = TextUtils.truncate('A very long product name', 12); // "A very long..."
///   final words = TextUtils.truncateWords('one two three four five', 3); // "one two three..."

class TextUtils {
  TextUtils._(); // not instantiable

  /// Truncate [input] to at most [maxLength] characters.
  ///
  /// If [input] is shorter than or equal to [maxLength], the original
  /// string is returned. If truncation happens and [ellipsis] is true,
  /// the function will append [ellipsisText] and ensure the returned
  /// string does not exceed [maxLength] characters unless [maxLength]
  /// is smaller than the length of [ellipsisText].
  static String truncate(
    String input,
    int maxLength, {
    bool ellipsis = true,
    String ellipsisText = '...',
  }) {
    if (maxLength <= 0) return '';
    if (input.length <= maxLength) return input;

    if (!ellipsis) return input.substring(0, maxLength);

    final eLen = ellipsisText.length;
    if (eLen >= maxLength) {
      // Not enough room for both content and ellipsis — return a clipped
      // ellipsisText or its truncated form so we don't exceed maxLength.
      return ellipsisText.substring(0, maxLength);
    }

    final contentLen = maxLength - eLen;
    return '${input.substring(0, contentLen)}$ellipsisText';
  }

  /// Truncate [input] by words keeping up to [maxWords] words and
  /// appending [ellipsisText] if truncated.
  ///
  /// Example: TextUtils.truncateWords('one two three four', 2) -> 'one two...'
  static String truncateWords(
    String input,
    int maxWords, {
    String ellipsisText = '...',
  }) {
    if (maxWords <= 0) return '';
    final parts = input
        .split(RegExp(r'\s+'))
        .where((s) => s.isNotEmpty)
        .toList();
    if (parts.length <= maxWords) return input;
    return '${parts.take(maxWords).join(' ')}$ellipsisText';
  }
}
