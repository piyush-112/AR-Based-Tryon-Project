import 'package:ar_try/constants.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'product_details.dart';
import 'product_model.dart';
import 'package:google_fonts/google_fonts.dart';  

import 'color_constants.dart';
  
class ProductDetailsChanged extends StatefulWidget {
  final ProductModel productModel;

  const ProductDetailsChanged({Key ?key, required this.productModel}) : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetailsChanged> {
  final description =
      'The Mia armchair understands your subtle need for beautiful home decor. Upholstered in highly functional yet beautiful linen fabric, this stunning piece can be placed almost anywhere in your home. It features sturdy wooden frame and comfortable pocket coil construction for decadent comfort. Available in many colors that will complement your home\'s specific decor.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildProductImage(),
            _buildAbout(),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        widget.productModel.name,
        style: GoogleFonts.varelaRound(
          color: ColorConstants.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  _buildProductImage() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey.shade200,
            Colors.white,
          ],
          stops: [0.1, 1],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Hero(
        tag: widget.productModel.id.toString(),
        child: SizedBox(
          height: 250,
          child: ModelViewer(
          src: widget.productModel.extraGlb,
          alt: widget.productModel.name,
          autoPlay: true,
          autoRotate: true,
          cameraControls: true,
          ar: true,
      ),
        ),
      ),
    );
  }

  _buildAbout() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.productModel.name,
                      style: GoogleFonts.varelaRound(
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      widget.productModel.productType,
                      style: GoogleFonts.varelaRound(
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children:  <Widget>[
            
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => ProductDetails(productModel: widget.productModel,
                      )
                      )));
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Container(
                      decoration: BoxDecoration(color: widget.productModel.primcolor, shape: BoxShape.circle),
                  ),
                ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Text(
              description,
              style: GoogleFonts.varelaRound(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AvailableColor extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const _AvailableColor({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 40,
        width: 40,
        padding: EdgeInsets.all(isSelected ? 1.5 : 0),
        
        child: Container(
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
      onTap: () {
      }
    );
  }
}
