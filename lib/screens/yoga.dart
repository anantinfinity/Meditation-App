import 'package:flutter/material.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/widgets/bottom_nav_bar.dart';
import 'package:meditation_app/widgets/search_bar.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types
class yoga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 110,
                    ),
                    Text(
                      "Yoga\nRecommendations",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "3-10 MIN Course",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                        "Live happier and healthier by learning the fundamentals of meditation and mindfulness",
                      ),
                    ),
                    SizedBox(
                      width: size.width * .5, // it just take the 50% width
                      child: SearchBar(),
                    ),
                    SizedBox(height: 70),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        SeassionCard(
                          seassionNum: 1,
                          isDone: true,
                          press: () {
                            const url = 'https://www.youtube.com/watch?v=wN18eRtzhZs&list=PLVwtlQVBhr0srfmlfMoEggZU4Mj2_2-2H&index=1';
                            launch(url);
                          },
                        ),
                        SeassionCard(
                          seassionNum: 2,
                          press: () {
                            const url = 'https://www.youtube.com/watch?v=KIwVHztX03U&list=PLVwtlQVBhr0srfmlfMoEggZU4Mj2_2-2H&index=2';
                            launch(url);
                          },
                        ),
                        SeassionCard(
                          seassionNum: 3,
                          press: () {
                            const url = 'https://www.youtube.com/watch?v=FVJDbfns7Q8&list=PLVwtlQVBhr0srfmlfMoEggZU4Mj2_2-2H&index=3';
                            launch(url);
                          },
                        ),
                        SeassionCard(
                          seassionNum: 4,
                          press: () {
                            const url = 'https://www.youtube.com/watch?v=58hGMKY-yGY&list=PLVwtlQVBhr0srfmlfMoEggZU4Mj2_2-2H&index=4';
                            launch(url);
                          },
                        ),
                        SeassionCard(
                          seassionNum: 5,
                          press: () {
                            const url = 'https://www.youtube.com/watch?v=hyaG5c9I-1M&list=PLVwtlQVBhr0srfmlfMoEggZU4Mj2_2-2H&index=5';
                            launch(url);
                          },
                        ),
                        SeassionCard(
                          seassionNum: 6,
                          press: () {
                            const url = 'https://www.youtube.com/watch?v=n_3nINHXXJQ&list=PLVwtlQVBhr0srfmlfMoEggZU4Mj2_2-2H&index=6';
                            launch(url);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;
  const SeassionCard({
    Key key,
    this.seassionNum,
    this.isDone = false,
    this.press,
    Null Function() onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Session $seassionNum",
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
