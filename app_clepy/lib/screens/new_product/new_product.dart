import 'package:flutter/material.dart';
import 'package:app_clepy/components/coustom_bottom_nav_bar.dart';
import 'package:app_clepy/components/fade_animation.dart';
import 'package:app_clepy/enums.dart';
import 'package:app_clepy/models/categories.dart';
import 'package:app_clepy/screens/home/home_screen.dart';
import 'package:app_clepy/screens/new_product/components/product_details.dart';



class New_Product extends StatefulWidget {
  const New_Product({ Key? key }) : super(key: key);
  static String routeName = "/newproduct";
  @override
  _New_ProductState createState() => _New_ProductState();
}

class _New_ProductState extends State<New_Product> {
  List<Service> services = [
    Service('Câmeras', 'https://ouch-cdn2.icons8.com/lJkWDFimW4lZRoLVqvh9oZaTJZo3vYLqQ2wy2BDq6Fk/rs:fit:784:595/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvODk2/LzJhNmZlNTY0LTli/MTYtNGVhMi1iODcx/LTYwZGI2NWRjMDkz/ZC5zdmc.png'),
    Service('Eletrônicos', 'https://ouch-cdn2.icons8.com/I8Op7wij4NRfCCbx7Snp35fL5FgEUg-I-xpneMhN-G8/rs:fit:784:694/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNzc4/LzE1M2RjNzUwLTY1/ZjEtNGZkYi05N2U4/LTc1NWRmZjY2NTVh/ZS5zdmc.png'),
    Service('Notebooks', 'https://ouch-cdn2.icons8.com/urWiJUqarpg69NYYUefdtpy0a40Sffai1qT18pkvBxM/rs:fit:784:598/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMTUw/Lzc0ZGJkNzIwLTc5/YWYtNGIzYS05MDZk/LTYyNzg5ZWM4MDg1/NC5zdmc.png'),
    Service('Ferramentas', 'https://img.icons8.com/fluency/2x/drill.png'),
    Service('Costura', 'https://img.icons8.com/fluency/2x/sewing-machine.png'),
  ];

  int selectedService = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: selectedService >= 0 ? FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Product_Details(),
            ),
          );
        },
        child: Icon(Icons.arrow_forward_ios, size: 20,),
        backgroundColor: Colors.blue,
      ) : null,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
                child: FadeAnimation(1.2, Padding(
                  padding: EdgeInsets.only(top: 120.0, right: 20.0, left: 20.0),
                  child: Text(
                    'Qual a categoria do seu equipamento?',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ))
          ];
        },
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: services.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FadeAnimation((1.0 + index) / 4, serviceContainer(services[index].imageURL, services[index].name, index));
                      }
                  ),
                ),
              ]
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.newproduct),
    );
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedService == index)
            selectedService = -1;
          else
            selectedService = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: selectedService == index ? Colors.blue.shade50 : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index ? Colors.blue : Colors.blue.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(image, height: 80),
              SizedBox(height: 20,),
              Text(name, style: TextStyle(fontSize: 20),)
            ]
        ),
      ),
    );
  }
}
