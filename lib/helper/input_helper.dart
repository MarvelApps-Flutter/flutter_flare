import 'package:flutter/rendering.dart';

// Adapted these helpful functions from:
// https://github.com/flutter/flutter/blob/master/packages/flutter/test/material/text_field_test.dart

// Returns first render editable
RenderEditable findRenderEditable(RenderObject root) {
  late RenderEditable renderEditable;
  void recursiveFinder(RenderObject child) {
    if (child is RenderEditable) {
      renderEditable = child;
      return;
    }
    child.visitChildren(recursiveFinder);
  }

  root.visitChildren(recursiveFinder);
  return renderEditable;
}

List<TextSelectionPoint> globalize(
    Iterable<TextSelectionPoint> points, RenderBox box) {
  return points.map<TextSelectionPoint>((TextSelectionPoint point) {
    return TextSelectionPoint(
      box.localToGlobal(point.point),
      point.direction,
    );
  }).toList();
}

Offset getCaretPosition(RenderObject box) {
  late RenderEditable? renderEditable = findRenderEditable(box);
  if (!renderEditable.hasFocus) {}
  final List<TextSelectionPoint> endpoints = globalize(
    renderEditable.getEndpointsForSelection(renderEditable.selection!),
    renderEditable,
  );
  return endpoints[0].point + const Offset(0.0, -2.0);
}