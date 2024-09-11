import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:indicator/provider/indicator_provider.dart';

class Indicator extends StatefulWidget {
  const Indicator({Key? key}) : super(key: key);

  @override
  _IndicatorState createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ApiProvider>(context, listen: false).getAllData();
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      
      backgroundColor:const Color.fromARGB(255, 69, 104, 245) ,
      leading: const Icon(Icons.arrow_back,color: Colors.white,),
      title: const Text('Brussels',style: TextStyle(color: Colors.white),),
      centerTitle: true,
    ),
    backgroundColor:const Color.fromARGB(255, 69, 104, 245),
    body: Consumer<ApiProvider>(
      builder: (context, apiProvider, child) {
        if (apiProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (apiProvider.model != null) {
          final model = apiProvider.model!;
          return Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text('Looks like the air is Good', style: TextStyle(color: Colors.grey.shade400,fontWeight: FontWeight.bold))),
                   const SizedBox(height: 40),
                    Center(
                      child: Stack(
                        children:[ 
                          Container(
                            
                            height: 400,
                            width: 500,
                          
                            decoration: BoxDecoration(
                                color:Color.fromARGB(255, 55, 85, 200),
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 55, 85, 200),
                                  Color.fromARGB(255, 52, 87, 228),
                                    Color.fromARGB(255, 55, 85, 200),

                              ],
                              
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight
                              )

                            ),
                            ),
                           
                                Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 60),
                                  child: Container(                              
                                    height: 280,
                                    width: 280,
                              decoration:const BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 55, 85, 200),
                                  Color.fromARGB(255, 42, 63, 150),
                                    Color.fromARGB(255, 55, 85, 200),

                              ],
                              
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight
                              ),
                                    color: Color.fromARGB(255, 60, 90, 212),
                                  shape: BoxShape.circle
                                  
                                                              ),
                                                              ),
                                ),
                              ),


                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: CircularPercentIndicator(
                                                            animation: true,
                                                            animationDuration: 1000,
                                                            radius: 170,
                                                            lineWidth: 15,
                                                           percent: double.parse(model.aqi) / 200.0,
                                                            progressColor: Colors.lightGreen,
                                                            backgroundColor:const Color.fromARGB(255, 62, 79, 148) ,
                                                            circularStrokeCap: CircularStrokeCap.round,
                                                            center: Center(
                                                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(model.aqi, style: const TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold)),
                                   const Text('AQI', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                                  ],
                                                              ),
                                                            )
                                                          ),
                                ),
                              ),
                        ]
                      ),
                    ),
                   const SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const Icon(Icons.water_drop, color: Colors.white),
                        const SizedBox(width: 5),
                        Text((model.pm25), style: const TextStyle(color: Colors.white)),
                        const SizedBox(width: 20),
                       const Icon(Icons.heat_pump, color: Colors.white),
                        const SizedBox(width: 5),
                     const   Text('14 * c', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 250,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      children: [
                      const  Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: 65),
                                  child: Text('µg/m3', style: TextStyle(fontSize: 10)),
                                ),
                                Text('No2',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                Text('Good',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        ),
                       const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Text(model.pm25,style:const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                    LinearPercentIndicator(
                      animation: true,
                      barRadius:const Radius.circular(12),
                      animationDuration: 10,
                      lineHeight: 5,
                      percent: double.parse(model.pm25)/200,
                      progressColor: Colors.lightGreen,
                      backgroundColor: Colors.grey.shade400,
                    ),
                   const SizedBox(height: 10,),
                       Row(
                      children: [
                     const   Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Padding(
                                  padding:  EdgeInsets.only(left: 80),
                                  child: Text('µg/m3', style: TextStyle(fontSize: 10)),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left: 20),
                                  child: Text('PM2.5',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left: 20),
                                  child: Text('Above average',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold)),
                                ),
                              ],
                              
                            )
                          ],
                        ),
                       const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Text(model.pm25,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold)
                          ),
                        )
                      ],
                    ),
                    LinearPercentIndicator(
                      animation: true,
                      barRadius: const Radius.circular(12),
                      animationDuration: 10,
                      lineHeight: 5,
                      percent: double.parse(model.pm25)/200,
                      progressColor: Colors.orangeAccent,
                      backgroundColor: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Center(child: Text('No data available', style: TextStyle(color: Colors.white)));
        }
      },
    ),
  );
}


}