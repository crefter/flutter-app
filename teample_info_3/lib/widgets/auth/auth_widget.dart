import 'package:flutter/material.dart';
import 'package:vk/Theme/app_button_style.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // titleTextStyle: fontSize(16),
        title: const Text('Трансценденталисты'),
      ),
      body: ListView(
        children: const [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          const _FormWidget(),
          const SizedBox(height: 25),
          const Text(
            'Ваш номер телефона будет использоваться для входа в аккаунт',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(
            height: 25,
          ),
          TextButton(onPressed: () {}, child: const Text('Регистрация')),
          const SizedBox(
            height: 25,
          ),
          const Text(
            // 'Мобильная версия поможет вам оставаться в приложении, даже если вы далеко от компьютера.'
            'Если вы зарегистрировались, но не получили электронное письмо с подтверждением',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(
            height: 25,
          ),
          TextButton(onPressed: () {}, child: const Text('Подтвердить email')),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget();

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText = '';

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;

    if (login == 'admin' && password == 'admin') {
      errorText = null;

      Navigator.of(context).pushNamed('/main_screen');

      print('open app');
    } else {
      errorText = 'Неверный логин или пароль';
    }
    setState(() {});
  }

  void _resetPassword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    // const color = Color.fromARGB(0, 193, 7, 47);
    const textFieldDecorator = InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        fillColor: Colors.red);

    final errorText = this.errorText;
    // isCollapsed: true,
    return Column(
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: const TextStyle(fontSize: 17, color: Colors.red),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
        const Text(
          'Имя пользователя',
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecorator,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Пароль',
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(181, 241, 170, 5),
                ),
                foregroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(230, 0, 0, 0)),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                ),
              ),
              onPressed: _auth,
              child: const Text('Войти'),
            ),
            const SizedBox(
              width: 100,
            ),
            TextButton(
              onPressed: _resetPassword,
              style: AppButtonStyle.linkButton,
              child: const Text('Сбросить пароль'),
            ),
          ],
        )
      ],
    );
  }
}
