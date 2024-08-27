import 'package:flutter/material.dart';
import 'constants.dart';
import 'product_details.dart';
import 'product_model.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constants.dart';

class ArmChairs extends StatefulWidget {
  ArmChairs({Key ?key}) : super(key: key);

  @override
  _ArmChairsState createState() => _ArmChairsState();
}

class _ArmChairsState extends State<ArmChairs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildProducts(),
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
        'Shop with AR',
        style: GoogleFonts.varelaRound(
          color: ColorConstants.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  
  _buildProducts() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: _buildLeftSide(),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: _buildRightSide(),
          ),
        ],
      ),
    );
  }

  _buildLeftSide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(Constants.chairs.length, (index) {
        if (index.isEven) {
          return _ProductWidget(
            productModel: Constants.chairs[index],
          );
        }

        return Container(
          height: 0,
          width: 0,
        );
      }),
    );
  }

  _buildRightSide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(Constants.chairs.length, (index) {
        if (index.isOdd) {
          return _ProductWidget(
            productModel: Constants.chairs[index],
          );
        }

        return Container(
          height: 0,
          width: 0,
        );
      })
        ..insert(
            0,
            SizedBox(
              height: 50,
            )),
    );
  }
}

class _ProductWidget extends StatelessWidget {
  final ProductModel productModel;
  const _ProductWidget({
    required this.productModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetails(
            productModel: productModel,
          ),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 50,
        ),
        child: Stack(
          clipBehavior: Clip.none, alignment: Alignment.center,
          children: <Widget>[
            Card(
              shadowColor: Colors.grey[300],
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.shade200,
                      Colors.white,
                    ],
                    stops: [0.1, 1],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      productModel.name,
                      style: GoogleFonts.varelaRound(
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -50,
              child: Hero(
                tag: productModel.id.toString(),
                child: Image.asset(
                  productModel.imagePath,
                  height: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
