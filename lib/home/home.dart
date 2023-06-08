import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class DiaDosNamoradosScreen extends StatefulWidget {
  @override
  _DiaDosNamoradosScreenState createState() => _DiaDosNamoradosScreenState();
}

class _DiaDosNamoradosScreenState extends State<DiaDosNamoradosScreen> {
  int _loginAttempts = 0;
  bool _loggedIn = false;

  void _login(String username) {
    if (username == '19/12/2020') {
      setState(() {
        _loggedIn = true;
      });
    } else {
      _loginAttempts++;
      if (_loginAttempts >= 3) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Dica'),
              content: Text('UMA DATA ESPECIAL'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erro de Login'),
              content: Text('Usuário inválido. Tente novamente.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _loggedIn ? HomeScreen() : LoginScreen(_login);
  }
}

class LoginScreen extends StatefulWidget {
  final Function(String) onLogin;

  LoginScreen(this.onLogin);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feliz dia dos namorados!'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.pink[50],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/aliancas.jpg'),
                radius: 60,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text.trim();
                  widget.onLogin(username);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Uma forma um tanto que diferente!'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.image)),
              Tab(icon: Icon(Icons.text_fields)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PhotosTab(),
            TextTab(),
          ],
        ),
      ),
    );
  }
}

class PhotosTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              _buildPhoto(
                context,
                'assets/comeco.jpg',
                'Olha só como tudo começou!',
              ),
              SizedBox(height: 16.0),
              _buildPhoto(
                context,
                'assets/anoNovo.jpg',
                'Nem acredito que chegamos até aqui!',
              ),
              SizedBox(height: 16.0),
              _buildPhoto(
                context,
                'assets/semCriatividade.jpg',
                'Obrigado por estar sempre comigo',
              ),
              SizedBox(height: 16.0),
              _buildPhoto(
                context,
                'assets/osNojentos.jpg',
                'Você é a mulher que pedi a Deus',
              ),
              SizedBox(height: 16.0),
              _buildPhoto(
                context,
                'assets/meuAmo.jpg',
                'Você é o meu amor para toda a vida',
              ),
              SizedBox(height: 16.0),
              _buildPhoto(
                context,
                'assets/meuMozi.jpg',
                'Meu mozão, te amo demais',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPhoto(
    BuildContext context,
    String imagePath,
    String caption,
  ) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.pink[100],
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(8.0),
          child: Image.asset(
            imagePath,
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.width * 0.6,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          caption,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.pink[800],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}

class TextTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Text(
          'Amor! Passei aqui para agradecer por ser essa mulher maravilhosa que está sempre comigo, obrigado por me aturar em todos os momentos! Tenho noção que não sou um dos namorados mais perfeitos do mundo, mas saiba que eu te amo demais meu amor. Uma das maiores maravilhas que você pode ter me apresentado foi como é bom ser amado de verdade, quando estou com você parece que tudo que tenho de ruim desaparece em um passe de mágica e nesse dia 12/06/2023, vim aqui para agradecer pela mulher maravilhosa que Deus deu para mim cuidar na minha vida.'
          'Então meu amor, passo aqui para te agradecer por adiantado o final de semana maravilho que tive com você meu amor, porque mesmo estando'
          'fazendo esse aplicativo alguns dias para trás, eu já sabia que iria acontecer tudo que aconteceu.  Espero que você tenha gostado do app e do presente que eu fiz.'
          'Um aplicativo pequeno mas que foi feito com todo amor para te fazer mais feliz, meu amor. Tudo isso é só um começo e vem muito mais por aí.'
          'Espero que estejamos juntos em todos os dias dos namorados daqui para frente. Eu te amo demais e estou ansioso por tudo que ainda vamos viver juntos! Parabéns pelo nosso dia, meu amor!'
          'BEIJOS DO MOMOZÃO!',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.pink[800],
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dia dos Namorados',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: DiaDosNamoradosScreen(),
    );
  }
}
