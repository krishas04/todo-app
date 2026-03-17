# Flutter Learnings
1. `Widget Tree`
- Everything in Flutter is a widget (text, buttons, layout, even padding).
- Each widget builds on its parent, creating a hierarchy.
- Understanding the widget tree is crucial for designing layouts and managing state.

2. `build() Method`
- The build() method is required in every widget.
- It describes the UI of that widget.
- Flutter calls build() whenever the widget needs to redraw itself.
- Every widget returns a tree of child widgets.

3. `MaterialApp Widget`
- MaterialApp is the root widget for Material Design apps in Flutter.
- It provides:
  - App navigation (routes)
  - Global theming (ThemeData)
  - Material Design styling
  - Localization support
- Material widgets include:
  Scaffold, AppBar, Card, ListTile, TextField, FloatingActionButton, Dialog, Snackbar.

4. `Material Design`
- Material Design is Google’s design system.
- It uses real-world inspired surfaces, shadows, and motion.
- Core principles:
  - Material is the metaphor – widgets behave like physical objects.
  - Bold, graphic, and intentional – use colors, typography, and hierarchy.
  - Motion provides meaning – animations help users understand UI changes.

5. `ThemeData`
- ThemeData defines the global look and feel of the app. 
- It controls:
  - Colors (colorScheme, primaryColor)
  - Typography (textTheme)
  - Component styling (appBarTheme, buttonTheme)

6. `ColorScheme & fromSeed()`
- `ColorScheme` is a set of colors used throughout the app (primary, secondary, surface, background, error). 
- `ColorScheme.fromSeed(seedColor: ...)` generates a `full color palette from a single base color`. 
- Supports Material Design 3 dynamic colors. 
- Generated colors include:
  - primary, primaryContainer 
  - secondary, secondaryContainer 
  - tertiary, surface, background, error

7. `useMaterial3`
- A boolean property in ThemeData to enable Material Design 3 (latest version).
- Effects:
  - Updated component styles
  - Rounded buttons
  - Modern typography
  - Adaptive color system

8. `Stateless and Stateful widgets`
   `StatelessWidget`
   A StatelessWidget is a widget that does not change over time.
   It is immutable, meaning once it is created, its data cannot be modified.

   `StatefulWidget`
   A StatefulWidget is a widget that can change over time.
   It has a separate State object that holds mutable data.

  `setState()`
  setState() is used inside a StatefulWidget to update the UI. 
  It does:
  - Updates (mutates) the state/data
  - Tells Flutter to rebuild the widget

9. `TextEditingController`
- Used TextEditingController to read input from TextField.
- Cleared input using `_controller.clear()` after adding a todo.
- Disposed controller using `dispose()` to prevent memory leaks.