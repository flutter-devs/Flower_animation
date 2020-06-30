import 'dart:async';
import 'dart:math';

import 'package:flowerapp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/local_model/homepage_view_model.dart';
class CartItemsScreen extends StatefulWidget {
  @override
  _CartItemsScreenState createState() => _CartItemsScreenState();
}

class _CartItemsScreenState extends State<CartItemsScreen> {

  HomePageViewModel _homePageViewModel = HomePageViewModel();


  var backArrowMarginLeft = 5.0;

  var animationDuration = Duration(microseconds: 0);

  var addToCartMarginRight =5.0;

  var backGroundAnimatedImageHeight = 430.0;

  var flowerDescriptionTextAnimation = 200.0;

  var moreInfoComponentHeight = 240.0;

  var priceInfoMargin = 0.0;

  var addToCartMargin = 70.0;

  var itemPriceOpacityValue=0.0;

  var myCartItemsDurationAnimation =Duration(microseconds: 0);

  var shoppingBagAnimationRight =0.0;

  var itemPurchasedViewleftAnimation_1 = 150.0;

  var itemPurchasedViewleftAnimation_2=200.0;

  var itemPurchasedViewleftAnimation_3 =250.0;

  var titleTopMarginAnimation =0.0;

  var animatedBackGroundClipperWidth =double.infinity;
  @override

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    animateProperties(size);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: priceInfoComponent(size),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                //  fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    height: size.height,
                    width: size.width,

                  //  color: Color(0xff6CA62A),
                   color: Color(0xff274531),
                  ),
                  stackBackgroundImage(size),
                  topBarActions(size),
                  topBarActionsTitle(size),
                myCartItemsView(size),
                ],
              ),

            ],
          ),
        ),

      ),
    );

  }

  stackBackgroundImage(size) =>   ClipPath(
    clipper: CustomLeafClipper(),
    child: AnimatedContainer(
      duration: Duration(milliseconds: 800),
      curve: Curves.easeIn,
      width: animatedBackGroundClipperWidth,
      height: 200,
      decoration: BoxDecoration(
        color: Color(0xff6CA62A),
//        gradient:  LinearGradient(
//            begin: Alignment.centerLeft,
//            end: Alignment.centerRight,
//            colors: [Color(0xff6CA62A), Color(0xff315D47)])
      ),
    ),
  );
  topBarActions(Size size) =>Positioned(
      top: 30.0,
      left: 0.0,
      right: 0.0,
      child: Row(
        children: <Widget>[
          AnimatedContainer(
              margin: EdgeInsets.only(left: backArrowMarginLeft),
              duration: Duration(seconds: 1),
              curve: Curves.easeIn,
              child: InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())),
                  child: Icon(Icons.arrow_back_ios,color: Colors.white,))),
          Spacer(),
          AnimatedContainer(
            curve: Curves.easeIn,
              margin: EdgeInsets.only(right: shoppingBagAnimationRight),
              duration: animationDuration,
              child: Image.asset("assets/images/shop_bag.png",color: Colors.white,fit: BoxFit.cover,height: 24,width: 24,)),

        ],
      ));

  void animateProperties(size) {
    Timer(const Duration(microseconds: 0), () {
      setState(() {
        titleTopMarginAnimation =35.0;
        addToCartMargin =18.0;
        priceInfoMargin =170.0;
        itemPurchasedViewleftAnimation_3 =30.0;
        itemPurchasedViewleftAnimation_2 =30.0;
        itemPurchasedViewleftAnimation_1 =30.0;
        myCartItemsDurationAnimation =Duration(milliseconds: 200);
        backArrowMarginLeft = 15.0;
        animationDuration = Duration(milliseconds: 600);
        addToCartMarginRight =10.0;
        backGroundAnimatedImageHeight = 300.0;
        flowerDescriptionTextAnimation =20.0;
        moreInfoComponentHeight = 10.0;
        itemPriceOpacityValue=1.0;
        shoppingBagAnimationRight =10.0;
        animatedBackGroundClipperWidth =size.width/1.4;
      });
    });
  }

  myCartItemsView(Size size) =>Positioned(
    left: 0,
    top: size.height/7,
    child: AnimatedContainer(
      height: size.height/1.2,
      width: size.width,
      duration: myCartItemsDurationAnimation,
     // curve: Curves.bounceIn,


      margin: EdgeInsets.only(top: moreInfoComponentHeight),
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
       // mainAxisAlignment: MainAxisAlignment.spa,
        children: <Widget>[
          SizedBox(height: 25,),
          totalPieceTextView("A total of 3 Pieces"),
         SizedBox(height: 10,),
          itemPurchasedViewWithDiscription("Magical Pastel","Classic Bouquet","\$ 45.99",HomePageViewModel().flowerList[0].photoUrl,itemPurchasedViewleftAnimation_1),
         itemPurchasedViewWithDiscription("Pale Yellow & Lifac","Delux Bouquet","\$ 45.99",HomePageViewModel().flowerList[1].photoUrl,itemPurchasedViewleftAnimation_2),
         itemPurchasedViewWithDiscription("Happiness in pink","Gentle Bouquet","\$ 45.99",HomePageViewModel().flowerList[4].photoUrl,itemPurchasedViewleftAnimation_3),
         // addDecorationSearchComponent(size),
         // otherItemsToBuy(size),
        //  priceInfoComponent(size),
        ],
      ),
    ),
  );

  totalPieceTextView(String s) =>AnimatedContainer(
    duration: Duration(milliseconds: 600),
    curve: Curves.easeInOutBack,
   alignment: Alignment.topLeft,
    margin: EdgeInsets.only(top: 15,left: flowerDescriptionTextAnimation,bottom: 5,right: 0),
    child:  Container(
      margin: EdgeInsets.only(left: 20),
      child: Text(s,
          style: GoogleFonts.roboto(
              fontStyle: FontStyle.normal, color: Colors.grey,fontWeight: FontWeight.w500)),
    ),
  );

  itemPurchasedViewWithDiscription(String s, String t, String u, String itemUrl, var itemPurchasedViewleftAnimation) => AnimatedContainer(
    duration: Duration(milliseconds: 800),
    curve: Curves.easeInOutBack,
    alignment: Alignment.topLeft,
    margin: EdgeInsets.only(top: 30,left: itemPurchasedViewleftAnimation,bottom:0,right: 0),
    child:  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image.asset(itemUrl,width: 85,height: 65,fit: BoxFit.contain,),
        SizedBox(width: 30,),
        Container(
          height: 65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 0,bottom: 7),
                child: Text(s,
                    style: GoogleFonts.roboto(
                        fontStyle: FontStyle.normal, color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16)),
              )  ,          Container(

                margin: EdgeInsets.only(top: 0,bottom: 0),
                child: Text(t,
                    style: GoogleFonts.roboto(
                        fontStyle: FontStyle.normal, color: Colors.grey,fontWeight: FontWeight.w500)),
              )  ,
              Spacer(),
              Container(

                margin: EdgeInsets.only(top: 7,bottom: 0),
                child: Text(u,
                    style: GoogleFonts.roboto(
                        fontStyle: FontStyle.normal, color: Color(0xff6CA62A),fontWeight: FontWeight.bold)),
              ),

            ],
          ),
        )
      ],
    ),
  );

  priceInfoComponent(Size size) =>AnimatedContainer(
    height: priceInfoMargin,
    curve: Curves.easeInOutBack,
    duration: Duration(milliseconds: 600),
    margin: EdgeInsets.only(top: 10 ),
    width: size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      ),
      color: Color(0xff274531),
    ),
    child: Column(
  //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(height: 8,),
        taxes(),
        total(),
        Spacer(),
        addToCartView(size),
       // taxes(),
      ],
    ) ,
  );
  taxes() =>Container(
    margin: EdgeInsets.only(left: 30,right: 30,top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text("Taxes",
              style: GoogleFonts.roboto(
                fontStyle: FontStyle.normal, color: Colors.grey[400],fontWeight: FontWeight.w500,)),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text("\$ 7.00",
              style: GoogleFonts.roboto(
                fontStyle: FontStyle.normal, color: Colors.grey[400],fontWeight: FontWeight.w500,)),
        )


      ],
    ),
  );

  total() =>Container(
    margin: EdgeInsets.only(left: 30,right: 15,top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text("Total Price",
              style: GoogleFonts.roboto(
                fontStyle: FontStyle.normal, color: Colors.white,fontWeight: FontWeight.w500)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 0,bottom: 0,right: 2),
              child:  Text("\$",
                  style: GoogleFonts.lato(
                      fontStyle: FontStyle.normal, color: Colors.grey,fontSize: 12)),
            ),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 0,right: 10,bottom: 2),
              child:  Text("45.99",
                  style: GoogleFonts.lato(
                      fontStyle: FontStyle.normal, color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold)),
            ),
          ],
        )


      ],
    ),
  );

  addToCartView(Size size) =>AnimatedContainer(
    height: 50,
    duration: Duration(milliseconds: 400),
    margin: EdgeInsets.only(top: addToCartMargin),
    width: size.width,
    decoration: BoxDecoration(
      color: Color(0xffF2A510),
      borderRadius: BorderRadius.only(
        topLeft: Radius.elliptical(40, 35),
        topRight: Radius.elliptical(40, 35),
      ),
    ),
    child: Center(
      child:   Text("Add To Cart",
          style: GoogleFonts.roboto(
              fontStyle: FontStyle.normal, color: Colors.white,fontWeight: FontWeight.bold,wordSpacing: 2.0,fontSize: 18)),
    ),





  );
  topBarActionsTitle(Size size) =>AnimatedPositioned(
    curve: Curves.easeIn,
    top: titleTopMarginAnimation,
    duration: Duration(milliseconds: 400),
    child:Container(
      width: size.width,
      child: Center(
        child: Text("My Cart",
            style: GoogleFonts.roboto(
                fontStyle: FontStyle.normal, color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16)),
      ),
    ),);


}

class CustomLeafClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

  path.lineTo(0.0,size.height);
  path.lineTo(size.width*0.6,size.height);

    path.quadraticBezierTo(0, size.height/4, size.width*0.4, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
