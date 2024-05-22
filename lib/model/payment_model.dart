
import 'package:pink_ribbon/data/app_assets.dart';
class PaymentModel {

  
  String title;
  String image;
  
 
  PaymentModel({required this.title, required this.image});
}

List<PaymentModel> methodItem = [
  PaymentModel(title: "Allied Bank Limited ", image: AppAssets.kAllied),
  PaymentModel(title: "MCB Bank Limited ", image: AppAssets.kMCB),
  PaymentModel(title: "United Bank Limited ", image: AppAssets.kUnited),
  PaymentModel(title: "National Bank of Pakistan ", image: AppAssets.kNBP ),
  PaymentModel(title: "Faysal Bank Limited ", image: AppAssets.kFaysal),
  PaymentModel(title: "Bank of Punjab ", image: AppAssets.kBOP ),
  PaymentModel(title: "Jazz Cash ", image: AppAssets.kJazzcash ),
  PaymentModel(title: "Easy Paisa ", image: AppAssets.kEasypaisa ),
];