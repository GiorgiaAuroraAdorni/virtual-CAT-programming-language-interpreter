/// Creating an enum called CatColors with the values white, green, red, blue,
/// yellow, and NaC.
enum CatColors { white, green, red, blue, yellow, NaC }

/// If the key is a valid color, return the color,
/// otherwise return CatColors.NaC.
///
/// Args:
///   key (String): The key to search for.
CatColors containsColor(String key) => CatColors.values.firstWhere(
      (CatColors element) => element.name == key,
      orElse: () => CatColors.NaC,
    );
