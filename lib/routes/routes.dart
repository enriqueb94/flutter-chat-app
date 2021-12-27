import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/loading_page.dart';
import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/register_page.dart';
import 'package:chat/pages/usuarios_page.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> appRoutes = {
  'usuarios': (_) => const UsuariosPage(),
  'login': (_) => const LoginPage(),
  'register': (_) => const RegisterPage(),
  'chat': (_) => const ChatPage(),
  'loading': (_) => const LoadingPage(),
};
