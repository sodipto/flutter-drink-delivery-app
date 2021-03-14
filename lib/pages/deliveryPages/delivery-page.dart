import 'dart:math';

import 'package:drink_app/constants/color-utils.dart';
import 'package:drink_app/constants/converter-helper.dart';
import 'package:drink_app/data/static-data.dart';
import 'package:drink_app/pages/detailsPage/details-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models.dart';

class DeliveryPage extends StatefulWidget {
  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  final List<Marker> markers = [];
  final List<Polyline> polyline = [];
  BitmapDescriptor markerIcon;
  GoogleMapController mapController;

  addMarker() async {
    setState(() {
      markers.add(Marker(
        position: LatLng(23.745035, 90.409906),
        markerId: MarkerId(Random().nextInt(100).toString()),
        infoWindow: InfoWindow(title: "Coolcat house", snippet: ''),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        onTap: () {},
      ));
      markers.add(Marker(
        position: LatLng(23.74714029960101, 90.39888639003038),
        markerId: MarkerId(Random().nextInt(100).toString()),
        infoWindow: InfoWindow(title: "Tea Store", snippet: ''),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        onTap: () {},
      ));
    });
  }

  addPolyLine() {
    polyline.add(Polyline(
        polylineId: PolylineId(Random().nextInt(100).toString()),
        visible: true,
        points: [
          LatLng(23.74714029960101, 90.39888639003038),
          LatLng(23.745035, 90.409906)
        ],
        color: BrandColor,
        width: 4));
  }

  static final CameraPosition _initPosition = CameraPosition(
    target: LatLng(23.744620717961276, 90.40453512221575),
    zoom: 14.4746,
  );

  Set<Circle> circles = Set.from([
    Circle(
        circleId: CircleId("1"),
        center: LatLng(23.74714029960101, 90.39888639003038),
        radius: 150,
        fillColor: BrandColor,
        strokeWidth: 30,
        strokeColor: Color(0xFFc8da99))
  ]);

  getIcons() async {
    var icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(70, 70)), "assets/images/user.png");
    setState(() {
      this.markerIcon = icon;
    });
  }

  @override
  void initState() {
    super.initState();
    //this.getIcons();
    addMarker();
    addPolyLine();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                height: size.height * 0.40,
                width: size.width,
                child: GoogleMap(
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  initialCameraPosition: _initPosition,
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  markers: markers.toSet(),
                  polylines: polyline.toSet(),
                  circles: circles,
                  onTap: (position) {
                    print(position);
                  },
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 10,
                left: 25,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                    child: SvgPicture.asset('assets/icons/left-arrow.svg',
                        color: Colors.black)),
              ),
              Positioned(
                bottom: -12,
                right: 0,
                left: 0,
                child: Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  padding: EdgeInsets.all(12),
                  height: 130,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          spreadRadius: 2),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/D-2.gif',
                          height: 80, width: 140, fit: BoxFit.cover),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text("Delivering...",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text("Around about 10:30 PM",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: BrandColor,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          OutlineButton(
                              child: Text("Refund"),
                              onPressed: null,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22.0)))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 30, left: 25, right: 25, bottom: 15),
            height: size.height * 0.60,
            width: size.width,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black12, blurRadius: 2, spreadRadius: 2),
                ],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 10),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: Products.take(2).length,
                          itemBuilder: (context, index) {
                            var item = Products[index];
                            return buildCartProduct(item);
                          }),
                      SizedBox(height: 5),
                      Divider(thickness: 0.5, color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery fee",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: OpacityColor,
                                  fontWeight: FontWeight.w500)),
                          Text("¥ 2",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text("¥ 54",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold))),
                      SizedBox(height: 5),
                      Divider(thickness: 0.5, color: Colors.grey),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Coupon",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: OpacityColor,
                                  fontWeight: FontWeight.bold)),
                          Text("-¥ 4.00",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: BrandColor,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 0.5, color: Colors.grey),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Pay",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          Text("¥ 50",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCartProduct(Product product) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetails()),
          );
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Container(
              height: 100,
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Converter.getColorFromHex(product.color),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Image.asset(product.imgfUrl, height: 45),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F2906))),
                        SizedBox(height: 5),
                        Text("big/ice",
                            style:
                                TextStyle(fontSize: 16, color: OpacityColor)),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("x1",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                            Text("¥ 26",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}
