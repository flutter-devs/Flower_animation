import 'dart:async';

import 'package:flowerapp/const/ui_const.dart';
import 'package:flowerapp/model/local_model/homepage_view_model.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Cart_Items_screen.dart';
class FlowerViewScreen extends StatefulWidget {

 int index;
var photo;


 FlowerViewScreen({this.index, this.photo});

  @override
  _FlowerViewScreenState createState() => _FlowerViewScreenState();
}

class _FlowerViewScreenState extends State<FlowerViewScreen> {
   var stepIcons = [Icons.edit_location, Icons.arrow_back_ios,Icons.edit_location,];
  final List<String> titles = ["Classic", "Delux", "Premium"];
  int _curStep = 2;
HomePageViewModel _homePageViewModel = HomePageViewModel();


  var backArrowMarginLeft = 5.0;

  var animationDuration = Duration(microseconds: 0);

  var addToCartMarginRight =5.0;

  var backGroundAnimatedImageHeight = 430.0;

  var flowerDescriptionTextAnimation = 50.0;

  var moreInfoComponentHeight = 40.0;

  var priceInfoMargin = 120.0;

  var addToCartMargin = 40.0;

  var itemPriceOpacityValue=0.0;

  bool itemPriceViewVisibility = false;

  var mimosaWidth =0.0;

  var mimosaHeight =0.0;

  var mimosaPriceWidth = 0.0;

  var mimosaPriceHeight =0.0;



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    animateProperties();
    return SafeArea(
      child: Scaffold(
    //    backgroundColor:  Color(0xff274531),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  stackBackgroundImage(size),
                  addToCart(size),
                  topBarActions(size),
                ],
              ),
              SizedBox(height: 14,),
              Hero(
                tag: "Bouquet OF ${widget.index}",
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: textViewFlower("Bouquet of ${HomePageViewModel().flowerList[widget.index].name}",1.0,0.0),
                ),
              ),
             SizedBox(height: 4,),
             Hero(
               tag: "Magical Pastel ${widget.index}",
               child:  textView(),
             ),
              Container(
                margin: EdgeInsets.only(left: 10,right: 0,bottom: 22),
                child: textViewFlower(UiConstant.flowerDescription,2.0,1.9),),
              StepProgressView(icons: stepIcons,width: MediaQuery.of(context).size.width,curStep: _curStep,color:  Color(0xffF2A510),
              titles: titles,),
              plantsQuantityViewPrice(),
              addDEcoration(size),
            ],
          ),
        ),
      ),
    );
  }

  addToCart(Size size) =>  Positioned(
      bottom: 0,
      right: 10,
      child:       Container(
        margin: EdgeInsets.only(right: 5),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff76A73B),
        ),
        child:  Center(
          child: Hero(
            tag: "shopping_cart ${widget.index}",
            child: InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CartItemsScreen())),
              child: Image.asset("assets/images/shop_bag.png",color: Colors.white,fit: BoxFit.fill,height: 24,width: 24,),
            ),
          ),
        ),
      ));

  stackBackgroundImage(size) =>   AnimatedContainer(
    padding: EdgeInsets.only(bottom: 20),
    curve: Curves.easeIn,
    duration: Duration(milliseconds: 600),
    height: backGroundAnimatedImageHeight,
    child: Hero(
        tag: "flower ${widget.index}",
        child: Image.asset(widget.photo,fit: BoxFit.scaleDown,width: size.width,)),
  );

  textViewFlower(s,wordSpacing,lineSpace) =>     AnimatedContainer(
    duration: Duration(milliseconds: 600),
    curve: Curves.easeIn,
    alignment: Alignment.topLeft,
    margin: EdgeInsets.only(top: flowerDescriptionTextAnimation,left: 10,bottom: 0,right: 0),
    child:  Text(s,
        style: GoogleFonts.roboto(
            fontStyle: FontStyle.normal, color: Colors.grey,fontWeight: FontWeight.w500,wordSpacing: wordSpacing,height: lineSpace)),
  );

  textView() =>Container(
    alignment: Alignment.topLeft,
    margin: EdgeInsets.only(top: 7,left: 18,bottom: 7),

    child:  Text("Magical Pastel",
        style: GoogleFonts.roboto(
            fontStyle: FontStyle.normal, color: Colors.black,fontWeight: FontWeight.bold,fontSize: 21)),
  );

  plantsQuantityViewPrice() =>Container(
    margin: EdgeInsets.only(top: 10),
    child: Column(
      children: <Widget>[
        SizedBox(height: 20,),
       Container(
         margin: EdgeInsets.only(left: 18,right: 40),
         child: Row(
         //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[

             textViewFlower("Plants",1.0,0.0),
             Spacer(),
             textViewFlower("Quantity", 1.0,0.0),
             Spacer(),
             textViewFlower("Price", 1.0,0.0),


           ],
         ),
       ),
        SizedBox(
          height: 4,
        ),
        Container(
          margin: EdgeInsets.only(right: 30,left: 27),
          child: Row(
            textBaseline: TextBaseline.alphabetic,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             Text(_homePageViewModel.flowerList[widget.index].name,
                 style: GoogleFonts.roboto(
                   fontStyle: FontStyle.normal, color: Colors.black,fontWeight: FontWeight.bold,)),
             Spacer(),
             Text("${_homePageViewModel.flowerList[widget.index].quantity} flowers",
                 style: GoogleFonts.roboto(
                   fontStyle: FontStyle.normal, color: Colors.black,fontWeight: FontWeight.bold,)),
             Spacer(),
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
                   child:  Text("34",
                       style: GoogleFonts.lato(
                           fontStyle: FontStyle.normal, color: Color(0xffF2A510), fontSize: 24,fontWeight: FontWeight.bold)),
                 ),
               ],
             ),
           ],
       ),
        ),
      ],
    ),
  );

  topBarActions(Size size) =>Positioned(
    top: 20.0,
      left: 0.0,
      right: 0.0,
      child: Row(
        children: <Widget>[
          AnimatedContainer(
            margin: EdgeInsets.only(left: backArrowMarginLeft),
              duration: Duration(seconds: 1),
              curve: Curves.easeIn,
              child: InkWell(
                onTap: ()=>Navigator.of(context).pop(),
                  child: Icon(Icons.arrow_back_ios,color: Color(0xff274531),))),
         Spacer(),
         AnimatedContainer(
           curve: Curves.easeIn,
             margin: EdgeInsets.only(right: 10),
             duration: animationDuration,
             child: Icon(FontAwesomeIcons.heart,color: Color(0xff274531),)),
          AnimatedContainer(
              margin: EdgeInsets.only(right: addToCartMarginRight),
              duration: Duration(milliseconds: 600),
              child: InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CartItemsScreen())),child: Image.asset(
                "assets/images/shopping_cart.png",
                height: 24,
                width: 24,
                fit: BoxFit.cover,
                color: Color(0xff274531),
              ))),
        ],
      ));

  void animateProperties() {
   Timer(const Duration(microseconds: 0), () {
      setState(() {
        backArrowMarginLeft = 15.0;
        animationDuration = Duration(milliseconds: 600);
        addToCartMarginRight =20.0;
        backGroundAnimatedImageHeight = 220.0;
        flowerDescriptionTextAnimation =10.0;
        moreInfoComponentHeight = 18.0;
        itemPriceOpacityValue=1.0;

      });
    });
  }
  void animatemimosa() {
   Timer(const Duration(microseconds: 0), () {
      setState(() {
        mimosaWidth =90.0;
        mimosaHeight =15.0;
        mimosaPriceWidth =62.0;
        mimosaPriceHeight= 18.0;

      });
    });
  }

  addDEcoration(Size size) =>AnimatedContainer(
    duration: Duration(milliseconds: 800),
    curve: Curves.easeInOutBack,
    margin: EdgeInsets.only(top: moreInfoComponentHeight),
    decoration: BoxDecoration(
      color: Color(0xff76A73B),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      )
    ),
 child: Column(
   mainAxisSize: MainAxisSize.min,
   children: <Widget>[
     addDecorationSearchComponent(size),
     otherItemsToBuy(size),
     priceInfoComponent(size),
   ],
 ),
  );

  addDecorationSearchComponent(size) =>Container(
    margin: EdgeInsets.only(top: 30,left: 20,right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("Add Decorarion",
            style: GoogleFonts.roboto(
              fontStyle: FontStyle.normal, color: Colors.grey[100],fontWeight: FontWeight.bold,)),
        searchField(),

      ],
    ),
  );

  searchField() =>Container(
    width: 83,
    height: 30,
    margin: EdgeInsets.only(right: 15),
    decoration: BoxDecoration(
      color: Color(0xff97C964),
      borderRadius: BorderRadius.circular(20.0)
    ),
    child: Center(
      child: Row(
        children: <Widget>[
          Container(
                margin: EdgeInsets.only(left: 8,right: 2),
            child: Icon(Icons.search,color: Color(0xff274531),size: 18,),),
          Text("Search", style: GoogleFonts.roboto(
   fontStyle: FontStyle.normal, color: Color(0xff274531),fontSize: 12),)
        ],
      ),
    ),
  );

  otherItemsToBuy(size) => Container(
    width: size.width,
    height: 300,
    margin: EdgeInsets.only(top: 20,left: 10),
    child: Wrap(
      children: <Widget>[
        InkWell(
          onTap: (){
            setState(() {
              itemPriceViewVisibility = true;
            });
            animatemimosa();
          },
          child: itemView(_homePageViewModel.flowerList[0].itemUrl,_homePageViewModel.flowerList[0].item),
        ),

        itemView(_homePageViewModel.flowerList[1].itemUrl,_homePageViewModel.flowerList[1].item),
        itemView(_homePageViewModel.flowerList[2].itemUrl,_homePageViewModel.flowerList[2].item),
        itemView(_homePageViewModel.flowerList[3].itemUrl,_homePageViewModel.flowerList[3].item),
        itemView(_homePageViewModel.flowerList[4].itemUrl,_homePageViewModel.flowerList[4].item),
        Container(
          height: 90,
          width: 90,
          margin: EdgeInsets.only(left : 15,bottom: 10,top: 10,right: 10),
          decoration: BoxDecoration(
            color: Color(0xff274531),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Text("See All",
                style: GoogleFonts.roboto(
                  fontStyle: FontStyle.normal, color: Colors.white,fontWeight: FontWeight.bold,)),
          ),
        )
      ],
    ),
  );

  itemView(String s, String t)=> Container(
    margin: EdgeInsets.only(left : 15,bottom: 10,top: 10,right: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(s,width: 90,height: 90,fit: BoxFit.cover,)),
              Positioned(
                  right: 4.0,
                top: 3.0,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Color(0xff274531),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Icon(FontAwesomeIcons.plus,color: Colors.white,size: 10,),
                  ),
                ),
              )
            ],
          ),
           Container(
             margin: EdgeInsets.only(top: 10),
             child: Text(t,
                 style: GoogleFonts.roboto(
                   fontStyle: FontStyle.normal, color: Colors.white,fontWeight: FontWeight.bold,)),
           )
         ],
         ),
  );

  priceInfoComponent(Size size) =>VisibilityDetector(
      key: Key("unique key"),
      onVisibilityChanged: (VisibilityInfo info) {
       setState(() {
         priceInfoMargin = 0.0;
       });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInCirc,
        margin: EdgeInsets.only(top: priceInfoMargin ),
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
          color: Color(0xff274531),
        ),
        child: Column(
          children: <Widget>[
            taxes(),
            itemPriceViewVisibility? itemPrice():Container(),
            total(),
             addToCartView(size),
          ],
        ) ,
      ));

  taxes() =>Container(
    margin: EdgeInsets.only(left: 40,right: 40,top: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text("Classic Bouquet",
              style: GoogleFonts.roboto(
                fontStyle: FontStyle.normal, color: Colors.grey[500])),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text("\$ 34",
              style: GoogleFonts.roboto(
                fontStyle: FontStyle.normal, color: Colors.grey[500],fontSize: 16)),
        )


      ],
    ),
  );

  total() =>Container(
    margin: EdgeInsets.only(left: 40,right: 40,top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text("Sub Total",
              style: GoogleFonts.roboto(
                fontStyle: FontStyle.normal, color: Colors.white,fontWeight: FontWeight.bold,)),
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

  addToCartView(Size size) =>VisibilityDetector(
      key: Key("unique key2"),
      onVisibilityChanged: (VisibilityInfo info) {
        setState(() {
         addToCartMargin = 20.0;
        });
      },
      child: AnimatedContainer(
        curve: Curves.easeInCirc,
        height: 60,
        duration: Duration(milliseconds: 600),
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





      ));

  itemPrice() => Container(

    margin: EdgeInsets.only(left: 40,right: 40,top: 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 800),
        //  curve: Curves.,
          width: mimosaWidth,
          height: mimosaHeight,
          margin: EdgeInsets.only(top: 10),
          child: Text("Mimosa",
              style: GoogleFonts.roboto(
                fontStyle: FontStyle.normal, color: Colors.grey[500])),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 800),
          width: mimosaPriceWidth,
          height: mimosaPriceHeight,
          margin: EdgeInsets.only(top: 10),
          child: Text("\$ 11.04",
              style: GoogleFonts.roboto(
                fontStyle: FontStyle.normal, color: Colors.grey[500],fontSize: 17)),
        )

      ],
    ),
  );




}

class StepProgressView extends StatefulWidget {
  final double _width;
  final List<IconData> _icons;
  final List<String> _titles;
  final int _curStep;
  final Color _activeColor;

  StepProgressView({Key key,
    @required List<IconData> icons,
    @required int curStep,
    List<String> titles,
    @required double width,
    @required Color color}) :
        _icons = icons,
        _titles = titles,
        _curStep = curStep,
        _width = width,
        _activeColor = color,
        assert(curStep > 0 == true && curStep <= icons.length),
        assert(width > 0),
        super(key: key);

  @override
  _StepProgressViewState createState() => _StepProgressViewState();
}

class _StepProgressViewState extends State<StepProgressView> {
  final Color _inactiveColor = Colors.grey;

  final double lineWidth = 4.0;

//  var animatedStepperWidth  = 100.0;

  Widget build (BuildContext context) {
//    Timer(const Duration(microseconds: 0), () {
//      setState(() {
//        animatedStepperWidth =widget._width;
//      });
//    });
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
        padding: EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0,),
        width: widget._width,
        child: Column(
          children: <Widget>[

            Row(
              children: _iconViews(),
            ),
            SizedBox(height: 10,),

            if (widget._titles != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _titleViews(),
              ),

          ],
        ));
  }

  List<Widget> _iconViews() {
    var list = <Widget>[];
    widget._icons.asMap().forEach((i, icon) {
      var circleColor = (i == 0 || widget._curStep > i + 1)
          ? widget._activeColor
          : _inactiveColor;

      var lineColor = widget._curStep > i + 1
          ? widget._activeColor
          : _inactiveColor;

      var iconColor = (i == 0 || widget._curStep > i + 1)
          ? _inactiveColor
          : widget._activeColor;

      list.add(
        //dot with icon view
        Container(
          width: 20.0,
          height: 20.0,
          padding: EdgeInsets.all(0),
        //  child: Icon(icon, color: iconColor,size: 15.0,),
          decoration: new BoxDecoration(
            color: circleColor,
            borderRadius: new BorderRadius.all(new Radius.circular(25.0)),
            border: new Border.all(
              color: Colors.transparent,
              width: 2.0,
            ),
          ),
        ),
      );

      //line between icons
      if (i != widget._icons.length - 1) {
        list.add(
            Expanded(
                child: Container(height: lineWidth, color: lineColor,)
            )
        );
      }
    });

    return list;
  }

  List<Widget> _titleViews() {
    var list = <Widget>[];
    widget._titles.asMap().forEach((i, text) {
      list.add(Text(text,         style: GoogleFonts.roboto(
          fontStyle: FontStyle.normal, color: widget._activeColor,fontWeight: FontWeight.bold)));
    });
    return list;
  }
}