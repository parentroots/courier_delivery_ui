import 'package:flutter/material.dart';
import 'package:foodi_go/utilities/app_colors.dart';
import 'package:foodi_go/utilities/assets_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Map<String, dynamic>> shipmentData = [
    {
      "image": AssetsPath.boxImage,
      "name": "Md Ibrahim Nazmul",
      "address": "7 No Sorisamuri Betagi, Barguna",
      "date":DateTime.now()
    },
    {
      "image": AssetsPath.boxImage,
      "name": "Sadilul Oli",
      "address": "Kakchira, Patharghata, Barguna",
      "date":DateTime.now()
    },
    {
      "image": AssetsPath.boxImage,
      "name": "Imran mahmud",
      "address": "Dhaka, Mirpur-10",
      "date":DateTime.now()
    },
    {
      "image": AssetsPath.boxImage,
      "name": "Hasan Mahmud",
      "address": "Chattogram, Agrabad",
      "date":DateTime.now()
    },
    {
      "image": AssetsPath.boxImage,
      "name": "Tanvir Hossain",
      "address": "Khulna, Sonadanga",
      "date":DateTime.now()
    },
    {
      "image": AssetsPath.boxImage,
      "name": "Rifat Ahmed",
      "address": "Rajshahi, Boalia",
      "date":DateTime.now()
    },
    {
      "image": AssetsPath.boxImage,
      "name": "Mehedi Hasan",
      "address": "Sylhet, Amberkhana",
      "date":DateTime.now()
    },
    {
      "image": AssetsPath.boxImage,
      "name": "Sabbir Alam",
      "address": "Barishal, Rupatali",
      "date":DateTime.now()
    },
    {
      "image": AssetsPath.boxImage,
      "name": "Fahim Reza",
      "address": "Mymensingh, Shambhuganj",
      "date":DateTime.now()
    },
    {
      "image": AssetsPath.boxImage,
      "name": "Aminul Islam",
      "address": "Rangpur, Mahiganj",
      "date":DateTime.now()
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSearchSection(),

              SizedBox(height: 20),
              buildCardSection(),
              SizedBox(height: 25),

              Container(
                height: 60,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.whiteColor,
                  border: Border.all(color: AppColors.themeColor, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image(image: AssetImage(AssetsPath.boxImage)),
                      SizedBox(width: 10),
                      Text("Create New Shipment",style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 18
                      ),),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10,),
              Text("Recent",style: Theme.of(context).textTheme.titleMedium,),

              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: shipmentData.length,
                  itemBuilder: (context,index){
                  final data=shipmentData[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.transparent,
                        border: Border.all(color: Colors.black12,width: 1)
                      ),
                      child: ListTile(
                        leading: Image.asset(data["image"]),
                        title:Text(data["name"]) ,
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4,),
                            Text(data["address"]),

                            SizedBox(height: 5,),

                            Row(
                              children: [
                                Icon(Icons.calendar_month_outlined),
                              Text(data["date"].toString())
                            ],
                            )

                          ],
                        ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                  return Divider(height: 15,color: Colors.transparent,);
              },)


            ],
          ),
        ),
      ),
    );
  }

  Container buildCardSection() {
    return Container(
      height: 180,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.themeColor,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 15),
                  Text(
                    "Fast. Reliable. Hassle-",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColors.whiteColor,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text(
                    "Free Parcel Delivery.",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: AppColors.whiteColor,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    textAlign: TextAlign.center,
                    "Your trusted partner for fast &  safe,  deliveries. Send or receive with ease. Start shipping today!",
                    style: TextStyle(fontSize: 14, color: AppColors.whiteColor),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Image(image: AssetImage(AssetsPath.cardImage))],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildSearchSection() {
    return Container(
      height: 160,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.themeColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Track your Parcel",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Text(
              "Please enter your order Id",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order Id",
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 18,
                      ),
                    ),
                    CircleAvatar(
                      child: Icon(
                        Icons.search,
                        color: AppColors.themeColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
