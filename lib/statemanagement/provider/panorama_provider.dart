import 'package:flutter/material.dart';
import '../models/panorama_model.dart';


class PanoramaImageProvider extends ChangeNotifier {
  final List<PanoramaImages> _panoramaimages = <PanoramaImages>[
    PanoramaImages(
      id: 1,
      image:
        "assets/carousel/terraces.jpeg",
    )];

  List<PanoramaImages> get panoramaimages {
    return _panoramaimages;
  }

  int get panoramaimagesCounts {
    return _panoramaimages.length;
  }

  void add(PanoramaImages panoramaimages) {
    _panoramaimages.add(panoramaimages);
    notifyListeners();
  }

  void removeAll() {
    _panoramaimages.clear();
    notifyListeners();
  }
}