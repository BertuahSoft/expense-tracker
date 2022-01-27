import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A material design panel that slides in horizontally from the edge of a
/// [Scaffold] to show navigation links in an application.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=WRj86iHihgY}
///
/// Drawers are typically used with the [Scaffold.drawer] property. The child of
/// the drawer is usually a [ListView] whose first child is a [DrawerHeader]
/// that displays status information about the current user. The remaining
/// drawer children are often constructed with [ListTile]s, often concluding
/// with an [AboutListTile].
///
/// The [AppBar] automatically displays an appropriate [IconButton] to show the
/// [Drawer] when a [Drawer] is available in the [Scaffold]. The [Scaffold]
/// automatically handles the edge-swipe gesture to show the drawer.
///
/// {@animation 350 622 https://flutter.github.io/assets-for-api-docs/assets/material/drawer.mp4}
///
/// {@tool snippet}
/// This example shows how to create a [Scaffold] that contains an [AppBar] and
/// a [Drawer]. A user taps the "menu" icon in the [AppBar] to open the
/// [Drawer]. The [Drawer] displays four items: A header and three menu items.
/// The [Drawer] displays the four items using a [ListView], which allows the
/// user to scroll through the items if need be.
///
/// ```dart
/// Scaffold(
///   appBar: AppBar(
///     title: const Text('Drawer Demo'),
///   ),
///   drawer: Drawer(
///     child: ListView(
///       padding: EdgeInsets.zero,
///       children: const <Widget>[
///         DrawerHeader(
///           decoration: BoxDecoration(
///             color: Colors.blue,
///           ),
///           child: Text(
///             'Drawer Header',
///             style: TextStyle(
///               color: Colors.white,
///               fontSize: 24,
///             ),
///           ),
///         ),
///         ListTile(
///           leading: Icon(Icons.message),
///           title: Text('Messages'),
///         ),
///         ListTile(
///           leading: Icon(Icons.account_circle),
///           title: Text('Profile'),
///         ),
///         ListTile(
///           leading: Icon(Icons.settings),
///           title: Text('Settings'),
///         ),
///       ],
///     ),
///   ),
/// )
/// ```
/// {@end-tool}
///
/// An open drawer can be closed by calling [Navigator.pop]. For example
/// a drawer item might close the drawer when tapped:
///
/// ```dart
/// ListTile(
///   leading: Icon(Icons.change_history),
///   title: Text('Change history'),
///   onTap: () {
///     // change app state...
///     Navigator.pop(context); // close the drawer
///   },
/// );
/// ```
///
/// See also:
///
///  * [Scaffold.drawer], where one specifies a [Drawer] so that it can be
///    shown.
///  * [Scaffold.of], to obtain the current [ScaffoldState], which manages the
///    display and animation of the drawer.
///  * [ScaffoldState.openDrawer], which displays its [Drawer], if any.
///  * <https://material.io/design/components/navigation-drawer.html>
class MainDrawer extends StatelessWidget {
  /// Creates a material design drawer.
  ///
  /// Typically used in the [Scaffold.drawer] property.
  ///
  /// The [elevation] must be non-negative.
  const MainDrawer({
    Key? key,
    this.elevation = 16.0,
    this.child,
    this.semanticLabel,
  }) : super(key: key);

  /// The z-coordinate at which to place this drawer relative to its parent.
  ///
  /// This controls the size of the shadow below the drawer.
  ///
  /// Defaults to 16, the appropriate elevation for drawers. The value is
  /// always non-negative.
  final double elevation;

  /// The widget below this widget in the tree.
  ///
  /// Typically a [SliverList].
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  /// The semantic label of the dialog used by accessibility frameworks to
  /// announce screen transitions when the drawer is opened and closed.
  ///
  /// If this label is not provided, it will default to
  /// [MaterialLocalizations.drawerLabel].
  ///
  /// See also:
  ///
  ///  * [SemanticsConfiguration.namesRoute], for a description of how this
  ///    value is used.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    String? label = semanticLabel;
    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        label = semanticLabel ?? MaterialLocalizations.of(context).drawerLabel;
    }
    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: label,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(width: 250.w),
        child: Material(
          elevation: elevation,
          child: child,
        ),
      ),
    );
  }
}
