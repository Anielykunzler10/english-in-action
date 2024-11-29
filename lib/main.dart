import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: Colors.indigoAccent[200],
          leading: IconButton(
            icon: Image.network(
              'https://static.vecteezy.com/system/resources/previews/013/743/592/non_2x/united-states-flag-round-icon-american-flag-png.png',
              height: 30,
            ),
            onPressed: () {
              // ação de voltar
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              Text(
                'English In Action',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  shadows: [
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 3.0,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQscAntWis432QHDnu3YIt_vOcAlbIZSSlQwWNSAv53c_UxH2g_SVElLCHTkSclLHyTt1c&usqp=CAU',
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8),
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(3.0, 3.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Join us now and start learning!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigoAccent[200],
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(3.0, 3.0),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigoAccent[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    'Login if you already have an account',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, bottom: 24.0),
              child: Icon(
                Icons.language,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void register() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Campos obrigatórios'),
          content: Text('Por favor, preencha todos os campos.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', nameController.text);
      await prefs.setString('email', emailController.text);
      await prefs.setString('password', passwordController.text);

      // Exibir mensagem de sucesso
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Cadastrado com sucesso'),
          content: Text('Bem-vindo, ${nameController.text}!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o diálogo
                Navigator.push(context, MaterialPageRoute(builder: (context) => CourseLevelsScreen())); // Navegar para a próxima tela
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.indigoAccent[100],
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://static.vecteezy.com/system/resources/previews/013/743/592/non_2x/united-states-flag-round-icon-american-flag-png.png',
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'English In Action',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                color: Colors.indigoAccent[200],
              ),
              Expanded(
                child: Center(
                  child: Container(
                    width: 350,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Ótima escolha se inscrever para o curso!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigoAccent[200],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: register,
                          child: Text('Register'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.indigoAccent[200],
                            padding: EdgeInsets.symmetric(vertical: 16),
                            textStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CourseLevelsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Course Level'),
        backgroundColor: Colors.indigoAccent[200],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQscAntWis432QHDnu3YIt_vOcAlbIZSSlQwWNSAv53c_UxH2g_SVElLCHTkSclLHyTt1c&usqp=CAU',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.indigoAccent[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Dica: Estude todos os dias para melhores resultados!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LevelDetailScreen(level: 'Nível 1')),
                        );
                      },
                      child: buildLevelBox('Nível 1'),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LevelDetailScreen(level: 'Nível 2')),
                        );
                      },
                      child: buildLevelBox('Nível 2'),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LevelDetailScreen(level: 'Nível 3')),
                        );
                      },
                      child: buildLevelBox('Nível 3'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLevelBox(String title) {
    return Container(
      width: 300,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.indigoAccent[100],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class LevelDetailScreen extends StatelessWidget {
  final String level;

  LevelDetailScreen({required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(level),
        backgroundColor: Colors.indigoAccent[200],
      ),
      body: Center(
        child: Text(
          'Detalhes do $level',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');
    String? storedPassword = prefs.getString('password');

    if (nameController.text == storedUsername && passwordController.text == storedPassword) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CourseLevelsScreen()));
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro de Login'),
          content: Text('Nome de usuário ou senha incorretos.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.indigoAccent[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tela de Login',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8.0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => login(context),
                    child: Text('Entrar'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigoAccent[200],
                      padding: EdgeInsets.symmetric(vertical: 16),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
