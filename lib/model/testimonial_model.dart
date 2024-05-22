import 'package:pink_ribbon/data/app_assets.dart';


class TestimonialList {
  String image;
  String name;
  String time;
  TestimonialList({required this.name, required this.image, required this.time});
}

List<TestimonialList> testimonialItem = [
  TestimonialList(name: 'Enola Holmes', image: AppAssets.kSurvivor1,time: "5 years"),
  TestimonialList(name: 'Elizebeth Joy', image: AppAssets.kSurvivor2, time: "1 year, 10 months"),
  TestimonialList(name: 'Meddy Frendora', image: AppAssets.kSurvivor3, time: "2 years, 3 months"),
  
];