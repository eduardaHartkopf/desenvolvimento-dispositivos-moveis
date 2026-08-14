// Fluxo básico do Flutter:
// main() -> runApp -> MyApp() -> MaterialApp -> MyHomePage -> Scaffold -> Tela do Aplicativo 


import 'package:flutter/material.dart'; //importa a biblioteca Designer do Flutter, sem essa biblioteca o dart não saberia coisas como Text, scaffold, etc

void main() { //onde tudo inicia, void não retorna NADA 
  runApp(const MyApp()); //Fala para o flutter iniciar o app sando MyApp
}

class MyApp extends StatelessWidget { //widget chamado MyApp
// Esse extends significa que MyApp herda caracteristicas de um StatelessWidget (coisas que não ficam mudando, exemplo logo da empresa)
  const MyApp({super.key}); //NÃO SEI O QUE FAZ 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { //Essa parte é qual widget vai ser renderizado na tela, nesse caso é o MaterialApp
    return MaterialApp(
      title: 'Flutter Demo', // Essse é o nome do Aplicativo, que aparece no multitarefas do celular
      theme: ThemeData( 
        //THEME: INFORMA O TEMA QUE VAMOS USAR 
        //AQUI COLOCAMOS AS CORES DOS BOTÕES, TEXTOS, CAMPOS, FUNDO, CORES, ETC.
        // ESSE THEMEDATA CONFIGURA O VISUAL PADRÃO DO APP, ELE É O CONSTRUTOR QUE GUARDA 

        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple), 
        //colorScheme: define qual cor vamos usar 
        // ColorScheme.fromSeed: define a cor base do app, nesse caso deepPurple

      ),
      home: const MyHomePage(title: 'O APLICATIVO INICIAR AQUI!'), //É A PRIMEIRA TELA QUE O APLICATIVO VAI MOSTRAR 
    );
  }
}

class MyHomePage extends StatefulWidget { //StatefulWidget: significa que o widget tem estado, ou seja, ele pode mudar de estado, exemplo: um botão que muda de cor quando clicado
//exemplo: carrinho de compras, likes, contadores
  const MyHomePage({super.key, required this.title}); //construtor da classe MyHomePage, que recebe um título como parâmetro

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title; //vai guardar 

  @override
  State<MyHomePage> createState() => _MyHomePageState(); 
  //o MyHomePage esta dizendo "quem vai controlar meu estado é a _MyHomePage"
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold( // estrutura basica visual da tela 
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(// cria o botão + ou o que ficara flutuante na tela 
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.favorite),
      ),
    );
  }
}
