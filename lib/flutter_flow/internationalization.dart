import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
    String? esText = '',
  }) =>
      [ptText, enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    'gfc0bsx3': {
      'pt': 'Entrar',
      'en': '',
      'es': '',
    },
    'mmfg0ztr': {
      'pt': 'Você faz parte desta comunidade!',
      'en': '',
      'es': '',
    },
    'rub67cnq': {
      'pt': 'Preencha os dados abaixo para acessar sua conta.',
      'en': '',
      'es': '',
    },
    '07jtzdhb': {
      'pt': 'E-mail',
      'en': '',
      'es': '',
    },
    '96eynmki': {
      'pt': 'Senha',
      'en': '',
      'es': '',
    },
    '2nx5fouw': {
      'pt': 'Email invalido!',
      'en': '',
      'es': '',
    },
    'dslcea5t': {
      'pt': 'Digite um email valido!',
      'en': '',
      'es': '',
    },
    'tb7vnovq': {
      'pt': 'Selecione uma opção no menu suspenso',
      'en': '',
      'es': '',
    },
    'ygxp61zm': {
      'pt': 'Senha deve ter pelo menos 8 caracteres.',
      'en': '',
      'es': '',
    },
    'cj0e8izh': {
      'pt': 'Digite pelo menos 8 caracteres',
      'en': '',
      'es': '',
    },
    'n1em0eu1': {
      'pt':
          'Senha deve ter pelo menos 8 caracteres, contendo letras e numeros.',
      'en': '',
      'es': '',
    },
    'c75fo5b0': {
      'pt': 'Selecione uma opção no menu suspenso',
      'en': '',
      'es': '',
    },
    'jg2v63oe': {
      'pt': 'Entrar',
      'en': '',
      'es': '',
    },
    '2k5dtc19': {
      'pt': 'Esqueceu a senha? ',
      'en': '',
      'es': '',
    },
    'h320q25c': {
      'pt': 'Recupere aqui.',
      'en': '',
      'es': '',
    },
    'iozs9btb': {
      'pt': 'Cadastrar',
      'en': '',
      'es': '',
    },
    'g4wkmdw9': {
      'pt': 'Vamos começar preenchendo o formulário abaixo.',
      'en': '',
      'es': '',
    },
    'e70ty92z': {
      'pt': 'Digite o email',
      'en': '',
      'es': '',
    },
    'zk0tny91': {
      'pt': 'Digite a senha',
      'en': '',
      'es': '',
    },
    'zwmx5p5i': {
      'pt': 'Confirme a senha',
      'en': '',
      'es': '',
    },
    'aa2wpul4': {
      'pt': 'Criar usuário',
      'en': '',
      'es': '',
    },
    'vjf41t90': {
      'pt': 'Página inicial',
      'en': 'Home page',
      'es': 'Página de inicio',
    },
  },
  // QuizNecessidades
  {
    'vu4ahc2h': {
      'pt': 'Questionário de Necessidades Especiais',
      'en': '',
      'es': '',
    },
    'kp0tm17c': {
      'pt':
          'Por favor, responda às seguintes perguntas para nos ajudar a entender melhor suas necessidades e fornecer o suporte adequado.',
      'en': '',
      'es': '',
    },
    'tcmo4lqt': {
      'pt': '1. Você tem algum diagnóstico de autismo?',
      'en': '',
      'es': '',
    },
    'rtjit2y0': {
      'pt': 'Sim',
      'en': '',
      'es': '',
    },
    'chubo36w': {
      'pt': 'Não',
      'en': '',
      'es': '',
    },
    'k7kjis5q': {
      'pt': 'Prefiro não responder',
      'en': '',
      'es': '',
    },
    '4r60b11m': {
      'pt': '2. Se sim, qual é o nível de autismo diagnosticado?',
      'en': '',
      'es': '',
    },
    'm18fz8i2': {
      'pt': 'Leve',
      'en': '',
      'es': '',
    },
    '4dtvbujh': {
      'pt': 'Moderado',
      'en': '',
      'es': '',
    },
    '2ap1r2ua': {
      'pt': 'Severo',
      'en': '',
      'es': '',
    },
    'rxns9zzy': {
      'pt': 'Não se aplica',
      'en': '',
      'es': '',
    },
    'w7lqdnef': {
      'pt': '3. Você tem algum grau de surdez?',
      'en': '',
      'es': '',
    },
    '893kulx6': {
      'pt': 'Não',
      'en': '',
      'es': '',
    },
    'w3syzxsr': {
      'pt': 'Leve',
      'en': '',
      'es': '',
    },
    '1x2e4gwy': {
      'pt': 'Moderada',
      'en': '',
      'es': '',
    },
    'dyv4z6rp': {
      'pt': 'Severa',
      'en': '',
      'es': '',
    },
    'hed58grr': {
      'pt': 'Profunda',
      'en': '',
      'es': '',
    },
    'cvr5fi1h': {
      'pt': '4. Você utiliza algum dispositivo auxiliar para audição?',
      'en': '',
      'es': '',
    },
    '7x32aj7e': {
      'pt': 'Não',
      'en': '',
      'es': '',
    },
    '86etttc6': {
      'pt': 'Aparelho auditivo',
      'en': '',
      'es': '',
    },
    '1h6apd3e': {
      'pt': 'Implante coclear',
      'en': '',
      'es': '',
    },
    'jncgs3tm': {
      'pt': 'Outro',
      'en': '',
      'es': '',
    },
    'qmwxqfga': {
      'pt': '5. Você tem alguma necessidade especial de locomoção?',
      'en': '',
      'es': '',
    },
    'em2r74xz': {
      'pt': 'Não',
      'en': '',
      'es': '',
    },
    'aaw224r6': {
      'pt': 'Cadeira de rodas',
      'en': '',
      'es': '',
    },
    'fmpzeuy2': {
      'pt': 'Andador',
      'en': '',
      'es': '',
    },
    'l3y0l0t8': {
      'pt': 'Bengala',
      'en': '',
      'es': '',
    },
    '6mcrfz30': {
      'pt': 'Outro',
      'en': '',
      'es': '',
    },
    'youwring': {
      'pt':
          '6. Você precisa de algum tipo de assistência para realizar atividades diárias?',
      'en': '',
      'es': '',
    },
    '8dkvy5mb': {
      'pt': 'Não',
      'en': '',
      'es': '',
    },
    '463k17wq': {
      'pt': 'Sim, ocasionalmente',
      'en': '',
      'es': '',
    },
    '7jh6lszo': {
      'pt': 'Sim, frequentemente',
      'en': '',
      'es': '',
    },
    'uipuos4e': {
      'pt': 'Sim, sempre',
      'en': '',
      'es': '',
    },
    'iiohpiw5': {
      'pt':
          '7. Há alguma outra necessidade especial que gostaria de mencionar?',
      'en': '',
      'es': '',
    },
    'u7h8muni': {
      'pt': 'Digite aqui...',
      'en': '',
      'es': '',
    },
    '5j7y0nhd': {
      'pt': 'Enviar Respostas',
      'en': '',
      'es': '',
    },
    'fcownsfe': {
      'pt': 'Página inicial',
      'en': 'Home page',
      'es': 'Página de inicio',
    },
  },
  // RelFinOrganizacao
  {
    'ssxuvo3c': {
      'pt': 'Dashboard',
      'en': '',
      'es': '',
    },
    '0mkss47e': {
      'pt': 'Notificar',
      'en': '',
      'es': '',
    },
    'xovvls6w': {
      'pt': 'Organização',
      'en': '',
      'es': '',
    },
    '3c33o5kr': {
      'pt': 'Projetos',
      'en': '',
      'es': '',
    },
    'qq5z4av3': {
      'pt': 'Atividades',
      'en': '',
      'es': '',
    },
    'q176ndhh': {
      'pt': 'Lideres',
      'en': '',
      'es': '',
    },
    'yckhz98v': {
      'pt': 'Equipe',
      'en': '',
      'es': '',
    },
    'rj8qpgep': {
      'pt': 'Colaboradores',
      'en': '',
      'es': '',
    },
    '2y7xa620': {
      'pt': 'Transações financeiras',
      'en': '',
      'es': '',
    },
    '2kwe4wcl': {
      'pt': 'Blockchain',
      'en': '',
      'es': '',
    },
    '63w27amo': {
      'pt': 'Notificações',
      'en': '',
      'es': '',
    },
    'uda46znf': {
      'pt': '22',
      'en': '',
      'es': '',
    },
    'dbgzn8xt': {
      'pt': 'Monitor Financeiro',
      'en': '',
      'es': '',
    },
    '47ri74f2': {
      'pt': 'Luis Fernando',
      'en': '',
      'es': '',
    },
    'nly878pk': {
      'pt': 'admin@email.com',
      'en': '',
      'es': '',
    },
    'p1evle3n': {
      'pt': 'Receitas',
      'en': '',
      'es': '',
    },
    '7m9fsie5': {
      'pt': 'R\$ 2.500,00',
      'en': '',
      'es': '',
    },
    'eygzfphz': {
      'pt': 'Despesas pagas',
      'en': '',
      'es': '',
    },
    'db9y57vh': {
      'pt': 'R\$ 950,00',
      'en': '',
      'es': '',
    },
    '910wagdp': {
      'pt': 'Despesas a pagar',
      'en': '',
      'es': '',
    },
    'wedtzig9': {
      'pt': 'R\$ 1.050,00',
      'en': '',
      'es': '',
    },
    's7jtdgrm': {
      'pt': 'Saldo ',
      'en': '',
      'es': '',
    },
    'xbbzn0u8': {
      'pt': 'R\$ 500,00',
      'en': '',
      'es': '',
    },
    'pirkbjie': {
      'pt': 'Despesas',
      'en': '',
      'es': '',
    },
    '8zsyiby2': {
      'pt': ' Criar Despesa ',
      'en': '',
      'es': '',
    },
    '8ojau03q': {
      'pt': 'Função',
      'en': '',
      'es': '',
    },
    'yxcnfg1l': {
      'pt': 'Recebedor',
      'en': '',
      'es': '',
    },
    'w0a7mjq9': {
      'pt': 'Valor',
      'en': '',
      'es': '',
    },
    '3eq8h269': {
      'pt': 'Status',
      'en': '',
      'es': '',
    },
    '1elkdliz': {
      'pt': 'Pagar',
      'en': '',
      'es': '',
    },
    'ghysbwvp': {
      'pt': 'Administrador',
      'en': '',
      'es': '',
    },
    'h33fr90y': {
      'pt': 'Luis Fernando',
      'en': '',
      'es': '',
    },
    'i978u216': {
      'pt': 'Business Name',
      'en': '',
      'es': '',
    },
    '3dcbao2i': {
      'pt': 'R\$ 600,00',
      'en': '',
      'es': '',
    },
    'a2wtzjlm': {
      'pt': 'Pago',
      'en': '',
      'es': '',
    },
    '5exbhp0z': {
      'pt': 'Líder',
      'en': '',
      'es': '',
    },
    '7bohsp1a': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'dgz4qgh6': {
      'pt': 'Business Name',
      'en': '',
      'es': '',
    },
    '3abgdewd': {
      'pt': 'R\$ 200,00',
      'en': '',
      'es': '',
    },
    '3p71x92i': {
      'pt': 'Pago',
      'en': '',
      'es': '',
    },
    'wjtaq46f': {
      'pt': 'Usuário',
      'en': '',
      'es': '',
    },
    'hu7pcjlw': {
      'pt': 'Randy Peterson',
      'en': '',
      'es': '',
    },
    '9e3mck8u': {
      'pt': 'Business Name',
      'en': '',
      'es': '',
    },
    'tpky6e9n': {
      'pt': 'R\$ 150,00',
      'en': '',
      'es': '',
    },
    't56eohuw': {
      'pt': 'Pago',
      'en': '',
      'es': '',
    },
    'tqboyxzq': {
      'pt': 'Usuário',
      'en': '',
      'es': '',
    },
    'sklmtbs3': {
      'pt': 'Randy Peterson',
      'en': '',
      'es': '',
    },
    'rs7otucj': {
      'pt': 'Business Name',
      'en': '',
      'es': '',
    },
    'traicbxy': {
      'pt': 'R\$ 50,00',
      'en': '',
      'es': '',
    },
    'ukk622db': {
      'pt': 'Pendente',
      'en': '',
      'es': '',
    },
    'xwnsdxul': {
      'pt': 'Líder',
      'en': '',
      'es': '',
    },
    'y0wq3w05': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'r2xwqvfg': {
      'pt': 'Business Name',
      'en': '',
      'es': '',
    },
    'k9jssl6h': {
      'pt': 'R\$ 200,00',
      'en': '',
      'es': '',
    },
    'dse1sfp5': {
      'pt': 'Pendente',
      'en': '',
      'es': '',
    },
    '4t2hca69': {
      'pt': 'Líder',
      'en': '',
      'es': '',
    },
    'aoyi21l6': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    '63d2io7h': {
      'pt': 'Business Name',
      'en': '',
      'es': '',
    },
    'zivc9k98': {
      'pt': 'R\$ 200,00',
      'en': '',
      'es': '',
    },
    '6ksx1w3g': {
      'pt': 'Pendente',
      'en': '',
      'es': '',
    },
    'ss50yae7': {
      'pt': 'Líder',
      'en': '',
      'es': '',
    },
    'gje7jbd3': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    '1ksbu5q8': {
      'pt': 'Business Name',
      'en': '',
      'es': '',
    },
    '8yg5x9cf': {
      'pt': 'R\$ 200,00',
      'en': '',
      'es': '',
    },
    'rhuw4nw8': {
      'pt': 'Pendente',
      'en': '',
      'es': '',
    },
    'kh06p113': {
      'pt': 'Líder',
      'en': '',
      'es': '',
    },
    'icc27fcj': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'u783y8n6': {
      'pt': 'Business Name',
      'en': '',
      'es': '',
    },
    '357p8quy': {
      'pt': 'R\$ 200,00',
      'en': '',
      'es': '',
    },
    'fvspk9w8': {
      'pt': 'Pendente',
      'en': '',
      'es': '',
    },
    '3iml6uis': {
      'pt': 'Líder',
      'en': '',
      'es': '',
    },
    '666d17fd': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    '50zjv4hx': {
      'pt': 'Business Name',
      'en': '',
      'es': '',
    },
    '5vyd57gx': {
      'pt': 'R\$ 200,00',
      'en': '',
      'es': '',
    },
    'hdkb95kl': {
      'pt': 'Pendente',
      'en': '',
      'es': '',
    },
    't459d916': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // CriarNotificacao
  {
    'jz9dt7ya': {
      'pt': 'Notificação',
      'en': '',
      'es': '',
    },
    'aenuwge1': {
      'pt': 'Vamos começar preenchendo o formulário abaixo.',
      'en': '',
      'es': '',
    },
    'h4bs2pwg': {
      'pt': 'Titulo da notificação',
      'en': '',
      'es': '',
    },
    'ibny2gb9': {
      'pt': 'Digite o titulo da notificação ...',
      'en': '',
      'es': '',
    },
    'szrugv9i': {
      'pt': 'Texto da notificação',
      'en': '',
      'es': '',
    },
    'u81rq4y3': {
      'pt': 'Escreva o texto ...',
      'en': '',
      'es': '',
    },
    'jle4hipl': {
      'pt': 'Enviar imediatamente? ',
      'en': '',
      'es': '',
    },
    'dmk3reqv': {
      'pt': 'Sim',
      'en': '',
      'es': '',
    },
    'i0dbryu5': {
      'pt': 'Sim',
      'en': '',
      'es': '',
    },
    '06uhfsja': {
      'pt': 'Não',
      'en': '',
      'es': '',
    },
    '2rz2q0m1': {
      'pt': 'Calendario',
      'en': '',
      'es': '',
    },
    'tv41n9et': {
      'pt': 'DD/MM',
      'en': '',
      'es': '',
    },
    'pmescr7j': {
      'pt': 'HH:MM',
      'en': '',
      'es': '',
    },
    'ffhl92pb': {
      'pt': 'Escolha para quem enviar:',
      'en': '',
      'es': '',
    },
    '9kh3vbui': {
      'pt': 'Projetos',
      'en': '',
      'es': '',
    },
    'upun64xp': {
      'pt': 'Projetos',
      'en': '',
      'es': '',
    },
    'zttc7zwu': {
      'pt': 'Atividades',
      'en': '',
      'es': '',
    },
    'z0y22tav': {
      'pt': 'Colaboradores',
      'en': '',
      'es': '',
    },
    'a2frbl0k': {
      'pt': 'Projetos',
      'en': '',
      'es': '',
    },
    'kcdblg06': {
      'pt': 'Atividades',
      'en': '',
      'es': '',
    },
    'wdfcvk1c': {
      'pt': 'Colaboradores',
      'en': '',
      'es': '',
    },
    'wiaio86m': {
      'pt': 'Enviar notificação\n',
      'en': '',
      'es': '',
    },
    'b0l84exh': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // RecuperarSenha
  {
    'cza5ya7k': {
      'pt': 'Esqueceu \nsua senha?',
      'en': '',
      'es': '',
    },
    't028fi7i': {
      'pt':
          'Enviaremos a você um e-mail com um link para redefinir sua senha. Digite o e-mail associado à sua conta abaixo.',
      'en': '',
      'es': '',
    },
    'knz19fq0': {
      'pt': 'Seu endereço de email...',
      'en': '',
      'es': '',
    },
    '67lmfejs': {
      'pt': 'Digite seu e-mail...',
      'en': '',
      'es': '',
    },
    'if34w4iu': {
      'pt': 'Enviar Link',
      'en': '',
      'es': '',
    },
    'kjwz0u2v': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // MeuPerfil
  {
    'g9ki03v4': {
      'pt': 'Perfil',
      'en': 'Profile',
      'es': 'Perfil',
    },
    '3evtmtkf': {
      'pt': 'INFORMAÇÕES',
      'en': 'INFORMATION',
      'es': 'INFORMACIÓN',
    },
    'rxzzq4fd': {
      'pt': 'Editar dados pessoais',
      'en': 'Edit Personal Data',
      'es': 'Editar datos personales',
    },
    'zs0e13w6': {
      'pt': 'Alterar a senha',
      'en': 'Change password',
      'es': 'Cambiar la contraseña',
    },
    'jkeneffh': {
      'pt': 'Perguntas Frequentes',
      'en': 'Tutorial',
      'es': 'Tutorial',
    },
    'kspzhga5': {
      'pt': 'Reportar defeito (BUG)',
      'en': 'Report defect (BUG)',
      'es': 'Informar defecto (ERROR)',
    },
    'gsiqzqsj': {
      'pt': 'Sugerir nova funcionalidade',
      'en': 'Suggest new functionality',
      'es': 'Sugerir nueva funcionalidad',
    },
    'uilsx682': {
      'pt': 'Claro',
      'en': 'Light ',
      'es': 'Claro',
    },
    'lt3f7o2b': {
      'pt': 'Escuro',
      'en': 'Dark',
      'es': 'Oscuro',
    },
    '6lrqc3uh': {
      'pt': 'SMS',
      'en': 'SMS',
      'es': 'SMS',
    },
    '3xzvwg9p': {
      'pt': 'Receber notificações por SMS.',
      'en': 'Receive notifications via SMS.',
      'es': 'Recibe notificaciones vía SMS.',
    },
    'ppcrqx96': {
      'pt': 'E-MAIL',
      'en': 'EMAIL',
      'es': 'CORREO ELECTRÓNICO',
    },
    'l424emhv': {
      'pt': 'Receber notificações por E-MAIL.',
      'en': 'Receive notifications by EMAIL.',
      'es': 'Reciba notificaciones por CORREO ELECTRÓNICO.',
    },
    'l1jdo6pq': {
      'pt':
          'As notificações serão enviados por SMS, e-mail e no proprio aplicativo.',
      'en':
          'Notifications will be sent via SMS, email and in the application itself.',
      'es':
          'Las notificaciones se enviarán vía SMS, correo electrónico y en la propia aplicación.',
    },
    '7baoghxe': {
      'pt': 'Escolha o idioma: ',
      'en': 'Choose language:',
      'es': 'Elige lengua:',
    },
    '2ggrvj6u': {
      'pt': 'SAIR DO SISTEMA',
      'en': '',
      'es': '',
    },
    'gfxdwb9l': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // PgAdmin
  {
    'tradilcc': {
      'pt': 'Administrador\n',
      'en': '',
      'es': '',
    },
    'nc5h6nvw': {
      'pt': 'ORGANIZAÇÃO',
      'en': '',
      'es': '',
    },
    'x7pbmu3m': {
      'pt': 'AGENDAR \nATIVIDADE',
      'en': '',
      'es': '',
    },
    'wbrd2dao': {
      'pt': 'RELATÓRIO \nFINANCEIRO',
      'en': '',
      'es': '',
    },
    '8aihq99k': {
      'pt': 'RELATÓRIO\nOPERACIONAL',
      'en': '',
      'es': '',
    },
    'belhbt5m': {
      'pt': 'GERENCIAR\nEQUIPE',
      'en': '',
      'es': '',
    },
    'bg8cglty': {
      'pt': 'ENVIAR\nNOTIFICAÇÃO',
      'en': '',
      'es': '',
    },
    'm0v8acbf': {
      'pt': 'GERENCIAR\nMATERIAL',
      'en': '',
      'es': '',
    },
    'iw0mcnha': {
      'pt': 'MEUS\nTREINAMENTOS',
      'en': '',
      'es': '',
    },
    '6mgodp1a': {
      'pt': 'GERENCIAR\nTREINAMENTO',
      'en': '',
      'es': '',
    },
    '864ggxp5': {
      'pt': 'AGENDAR\nTREINAMENTO',
      'en': '',
      'es': '',
    },
    'dcozfvmz': {
      'pt': 'ACESSO',
      'en': '',
      'es': '',
    },
    'f6izvtyh': {
      'pt': 'NOMEAR LIDER',
      'en': '',
      'es': '',
    },
    'qr4vtzng': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // AlterarSenha
  {
    'rktuyqwk': {
      'pt': 'Alterar Senha',
      'en': '',
      'es': '',
    },
    'facxmp0g': {
      'pt': 'Digite a senha atual e depois crie e confirme a nova senha.',
      'en': '',
      'es': '',
    },
    'uxq7pq3l': {
      'pt': 'Digite a senha atual',
      'en': '',
      'es': '',
    },
    '6sblhcqb': {
      'pt': 'Digite a nova senha',
      'en': '',
      'es': '',
    },
    'wem15vrw': {
      'pt': 'Confirme a nova senha',
      'en': '',
      'es': '',
    },
    'lpj9g6qa': {
      'pt': 'ALTERAR SENHA',
      'en': '',
      'es': '',
    },
    'apb6u2yp': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // EditarUsuario
  {
    '1thnopm8': {
      'pt': 'Dados do usuário',
      'en': '',
      'es': '',
    },
    'z9zmz2cs': {
      'pt': 'Digite os dados e confirme para alterar.',
      'en': '',
      'es': '',
    },
    'zb8vtvph': {
      'pt': 'Nome Completo',
      'en': '',
      'es': '',
    },
    'lu1f5xci': {
      'pt': 'Digite seu nome completo',
      'en': '',
      'es': '',
    },
    'm1hdwkah': {
      'pt': 'CPF',
      'en': '',
      'es': '',
    },
    '4yadfghu': {
      'pt': 'Email',
      'en': '',
      'es': '',
    },
    'vak4u861': {
      'pt': 'Telefone',
      'en': '',
      'es': '',
    },
    'sw5k4jn7': {
      'pt': 'Endereço',
      'en': '',
      'es': '',
    },
    'j5nlod24': {
      'pt': 'Digite seu endereço',
      'en': '',
      'es': '',
    },
    'yoj4908x': {
      'pt': 'Carregar foto de perfil',
      'en': '',
      'es': '',
    },
    'y4lf0urv': {
      'pt': 'Atualizar dados',
      'en': '',
      'es': '',
    },
    'sp3ifyvb': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // VerHistorico
  {
    'rkcep1rj': {
      'pt': 'Histórico',
      'en': '',
      'es': '',
    },
    'sv86h5kr': {
      'pt': 'Veja suas atividades passadas e acompanhe seu progresso.',
      'en': '',
      'es': '',
    },
    'n9rkpmnf': {
      'pt': 'Projeto 1',
      'en': '',
      'es': '',
    },
    'ulbeigfk': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'e50fqrnr': {
      'pt': 'Atividade 1',
      'en': '',
      'es': '',
    },
    'hk3jd4f7': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'fuj9tc29': {
      'pt': 'Atividade 2',
      'en': '',
      'es': '',
    },
    'x7jsqvfn': {
      'pt': 'Projeto 2',
      'en': '',
      'es': '',
    },
    'zmscb88n': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'z42cnsca': {
      'pt': 'Atividade 1',
      'en': '',
      'es': '',
    },
    'vg521frl': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'wkt2ryki': {
      'pt': 'Atividade 2',
      'en': '',
      'es': '',
    },
    'm7emlsa9': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'lqsw80qh': {
      'pt': 'Atividade 3',
      'en': '',
      'es': '',
    },
    'l8r630rr': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'cntqwa7a': {
      'pt': 'Atividade 4',
      'en': '',
      'es': '',
    },
    'zza6jpkd': {
      'pt': 'Projeto 3',
      'en': '',
      'es': '',
    },
    '27l3hdjt': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '2w658uw0': {
      'pt': 'Atividade 1',
      'en': '',
      'es': '',
    },
    '3rw56034': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'cpt9m1ng': {
      'pt': 'Atividade 2',
      'en': '',
      'es': '',
    },
    '5da78gjv': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'igg41lr4': {
      'pt': 'Atividade 3',
      'en': '',
      'es': '',
    },
    'g0kgum66': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '14a9a9rz': {
      'pt': 'Atividade 4',
      'en': '',
      'es': '',
    },
    'drc87l1v': {
      'pt': 'Projeto 4',
      'en': '',
      'es': '',
    },
    'tmholl76': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '1zf6b6h2': {
      'pt': 'Atividade 1',
      'en': '',
      'es': '',
    },
    'qe2gaycp': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'f9h7xtdo': {
      'pt': 'Atividade 2',
      'en': '',
      'es': '',
    },
    'ord6sxb0': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'dp1vts6q': {
      'pt': 'Atividade 3',
      'en': '',
      'es': '',
    },
    '8kpzvp9q': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'jxsz7999': {
      'pt': 'Atividade 4',
      'en': '',
      'es': '',
    },
    'avuw1n3k': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'o28zoore': {
      'pt': 'Atividade 5',
      'en': '',
      'es': '',
    },
    'i9i4ry36': {
      'pt': 'Gerar Relatório',
      'en': '',
      'es': '',
    },
    'tjuzi151': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // RelatorioPessoal
  {
    '2oxe5ved': {
      'pt': 'Relatório Pessoal',
      'en': '',
      'es': '',
    },
    'xl1r3vhe': {
      'pt': 'Resumo de sua colaboração na comunidade',
      'en': '',
      'es': '',
    },
    'lbeyrokb': {
      'pt': 'Meus Projetos',
      'en': '',
      'es': '',
    },
    'rw7pnun4': {
      'pt': '8',
      'en': '',
      'es': '',
    },
    'ps661lzk': {
      'pt': 'Ativ. realizadas',
      'en': '',
      'es': '',
    },
    'd1vynl1j': {
      'pt': '22',
      'en': '',
      'es': '',
    },
    'c8xh6jh3': {
      'pt': 'Horas Voluntárias',
      'en': '',
      'es': '',
    },
    '45o2urkx': {
      'pt': '20,5 h',
      'en': '',
      'es': '',
    },
    '3meqkcbr': {
      'pt': 'Montante Doado',
      'en': '',
      'es': '',
    },
    '4bf6ywvh': {
      'pt': 'R\$ 950,00',
      'en': '',
      'es': '',
    },
    'a9ij8xgv': {
      'pt': 'Receita total dos projetos',
      'en': '',
      'es': '',
    },
    '4wx7nzhq': {
      'pt': 'R\$ 50.000,00',
      'en': '',
      'es': '',
    },
    'w5r6tl58': {
      'pt': '1,9%',
      'en': '',
      'es': '',
    },
    'tt91sx1d': {
      'pt': 'Minha contribuição',
      'en': '',
      'es': '',
    },
    'n0zd71zp': {
      'pt': 'Despesa total dos projetos',
      'en': '',
      'es': '',
    },
    'hdts9v9z': {
      'pt': 'R\$ 40.500,00',
      'en': '',
      'es': '',
    },
    '6in5kwig': {
      'pt': '9%',
      'en': '',
      'es': '',
    },
    'u4oj61f8': {
      'pt': 'Saldo disponivel',
      'en': '',
      'es': '',
    },
    'oztna88v': {
      'pt': 'Total de colaboradores\nenvolvidos nos meus projetos',
      'en': '',
      'es': '',
    },
    'me29y7do': {
      'pt': '150',
      'en': '',
      'es': '',
    },
    'xm9424i3': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // ListaProjetos
  {
    '15ifdgwz': {
      'pt': 'Lista de Projetos',
      'en': '',
      'es': '',
    },
    '7qtaoj1g': {
      'pt': 'Escolha um projeto para ver mais informações.',
      'en': '',
      'es': '',
    },
    'pom49u2c': {
      'pt': 'Projetos',
      'en': '',
      'es': '',
    },
    '8xalnhor': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '3iqmfp9s': {
      'pt': 'Academia na praça',
      'en': '',
      'es': '',
    },
    'kc5j82sl': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'o6qjsvj5': {
      'pt': 'Preparação para o ENEM',
      'en': '',
      'es': '',
    },
    'o7gp5x11': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '3fu4qndn': {
      'pt': 'Escola Biblica de ferias',
      'en': '',
      'es': '',
    },
    'pmex5n00': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'jinurnjv': {
      'pt': 'Coral da terceira idade',
      'en': '',
      'es': '',
    },
    '6b5eaudb': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'yezstv1q': {
      'pt': 'Doação de roupas usadas',
      'en': '',
      'es': '',
    },
    '5gd68ru8': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'vdghpziy': {
      'pt': 'Clube de leitura',
      'en': '',
      'es': '',
    },
    '3po6p5iw': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '9xnispbo': {
      'pt': 'Sopão da solidariedade',
      'en': '',
      'es': '',
    },
    'gd4dvwdw': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'urx5zd6k': {
      'pt': 'Doação de cestas basicas',
      'en': '',
      'es': '',
    },
    'zi68kwd5': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // VerProjeto
  {
    's6u56bvj': {
      'pt': 'Projeto',
      'en': '',
      'es': '',
    },
    '2kkn0j9e': {
      'pt': 'Academia na praça',
      'en': '',
      'es': '',
    },
    'zwgo3od9': {
      'pt': 'Responsavel: Emily Rambo',
      'en': '',
      'es': '',
    },
    '2xrj9iur': {
      'pt':
          'Oferecemos aulas gratuitas para a comunidade, visando promover saúde física e mental. Nossas atividades incluem exercícios diversos para todas as idades e níveis de condicionamento físico. \nJunte-se a nós para cuidar do seu bem-estar e fazer parte de uma comunidade saudável e ativa!',
      'en': '',
      'es': '',
    },
    'ozgxmdjq': {
      'pt': 'Solicitar participação',
      'en': '',
      'es': '',
    },
    't1ymbcld': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // Tutorial
  {
    'jvllvkia': {
      'pt': 'Tutorial',
      'en': '',
      'es': '',
    },
    'txnzm5lr': {
      'pt': 'Como criar uma \norganização?',
      'en': '',
      'es': '',
    },
    '54qna3q1': {
      'pt': 'Como nomear \num lider?',
      'en': '',
      'es': '',
    },
    'l9in4ft9': {
      'pt': 'Como criar \num projeto?',
      'en': '',
      'es': '',
    },
    'h5gcj512': {
      'pt': 'Como agenda \numa atividade?',
      'en': '',
      'es': '',
    },
    'znk5xkkv': {
      'pt': 'Como editar os \ndados do usuário?',
      'en': '',
      'es': '',
    },
    'mw0s0puv': {
      'pt': 'Como agenda \numa atividade?',
      'en': '',
      'es': '',
    },
    '1q2kuavi': {
      'pt': 'Como sugerir \nmelhorias?',
      'en': '',
      'es': '',
    },
    '9v6atggx': {
      'pt': 'Como reportar \num problema?',
      'en': '',
      'es': '',
    },
    'lrufjvmd': {
      'pt': 'Quero participar \nde um projeto.',
      'en': '',
      'es': '',
    },
    'nxadcmw4': {
      'pt': 'Como doar para \num projeto?',
      'en': '',
      'es': '',
    },
    'k5jvvad2': {
      'pt': 'Como excluir \nminha conta?',
      'en': '',
      'es': '',
    },
    'sn9c9buq': {
      'pt': 'Como gerar\num relatorio?',
      'en': '',
      'es': '',
    },
    '2g5ly3fr': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // ReportarBUG
  {
    'py7rt00l': {
      'pt': 'Informar um erro \nna aplicação',
      'en': '',
      'es': '',
    },
    'c5yf26tf': {
      'pt': 'Preencha o formulário abaixo para reportar um erro na aplicação.',
      'en': '',
      'es': '',
    },
    'hnxwfubd': {
      'pt': 'Nome do erro...',
      'en': '',
      'es': '',
    },
    'fh4t5gfz': {
      'pt': 'Breve descrição do que está acontecendo...',
      'en': '',
      'es': '',
    },
    'gzzxix4e': {
      'pt': 'Carregar captura de tela',
      'en': '',
      'es': '',
    },
    'wmtsemxq': {
      'pt': 'Cimunicar um erro',
      'en': '',
      'es': '',
    },
    'lshx5a5a': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
    'ltiuny9a': {
      'pt': 'Exit',
      'en': '',
      'es': '',
    },
    'rnfxi8bl': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // SugerirFuncionalidade
  {
    'l9ol52me': {
      'pt': 'Sugerir uma nova\nfuncionalidade',
      'en': '',
      'es': '',
    },
    'dw5mag15': {
      'pt':
          'Preencha o formulário abaixo para sugerir uma nova funcionalidade na aplicação.',
      'en': '',
      'es': '',
    },
    'q76x2hw8': {
      'pt': 'Nome da funcionalidade...',
      'en': '',
      'es': '',
    },
    'o21f4zk6': {
      'pt':
          'Por favor, compartilhe uma breve descrição de como você espera que nossa aplicação o ajude. Queremos garantir que nossa solução atenda às suas expectativas da melhor forma possível.',
      'en': '',
      'es': '',
    },
    'dra7ussh': {
      'pt': 'Carregar uma imagem',
      'en': '',
      'es': '',
    },
    'e31zy2vm': {
      'pt': 'Carregar um documento',
      'en': '',
      'es': '',
    },
    's5mt527v': {
      'pt': 'Cimunicar um erro',
      'en': '',
      'es': '',
    },
    '82fcrhkl': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
    'n5aqgopq': {
      'pt': 'Exit',
      'en': '',
      'es': '',
    },
    'w31dwo9h': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // VerProjetoAceito
  {
    '2vgb6ezf': {
      'pt': 'Projeto',
      'en': '',
      'es': '',
    },
    'nev9dibl': {
      'pt': 'Academia na praça',
      'en': '',
      'es': '',
    },
    'zcylpj64': {
      'pt': 'Responsavel: Emily Rambo',
      'en': '',
      'es': '',
    },
    'capl94bu': {
      'pt':
          'Junte-se a nós para uma manhã cheia de energia e saúde. Desfrute de uma variedade de atividades físicas ao ar livre, incluindo corrida, alongamento, exercícios de resistência e muito mais. Convide seus amigos, familiares e vizinhos para se juntarem a essa experiência divertida e revitalizante. Não perca a oportunidade de se exercitar, socializar e aproveitar o ar fresco da nossa praça comunitária!',
      'en': '',
      'es': '',
    },
    'r6kw0uh5': {
      'pt': 'Atividades',
      'en': '',
      'es': '',
    },
    'rqxhs1hk': {
      'pt': 'Doar',
      'en': '',
      'es': '',
    },
    '8p5qvywh': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // PgLider
  {
    'bbd14n2q': {
      'pt': 'Líder',
      'en': '',
      'es': '',
    },
    'id8molvb': {
      'pt': 'GERENCIAR\nATIVIDADE',
      'en': '',
      'es': '',
    },
    'wr0yt0ed': {
      'pt': 'AGENDAR \nATIVIDADE',
      'en': '',
      'es': '',
    },
    'j5hnbdgn': {
      'pt': 'GERENCIAR\nEQUIPE',
      'en': '',
      'es': '',
    },
    '605s9jxo': {
      'pt': 'ENVIAR\nNOTIFICAÇÃO',
      'en': '',
      'es': '',
    },
    'r5xgdobu': {
      'pt': 'GERENCIAR\nMATERIAL',
      'en': '',
      'es': '',
    },
    'on662cry': {
      'pt': 'MEUS\nTREINAMENTOS',
      'en': '',
      'es': '',
    },
    '753gvnub': {
      'pt': 'GERENCIAR\nTREINAMENTO',
      'en': '',
      'es': '',
    },
    'naqgmkh2': {
      'pt': 'AGENDAR\nTREINAMENTO',
      'en': '',
      'es': '',
    },
    'ayx800ob': {
      'pt': 'FINANCEIRO',
      'en': '',
      'es': '',
    },
    'xs5dh3qc': {
      'pt': 'RELATÓRIOS',
      'en': '',
      'es': '',
    },
    '6ufq3p59': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // MenuDoacoes
  {
    '077ec70r': {
      'pt': 'Doações',
      'en': '',
      'es': '',
    },
    'el5ss23t': {
      'pt': 'Faça suas contribuições:',
      'en': '',
      'es': '',
    },
    'mp7n1y8v': {
      'pt': 'Doação Financeira',
      'en': '',
      'es': '',
    },
    'lxw97kq6': {
      'pt': 'Doar Alimentos',
      'en': '',
      'es': '',
    },
    'f7nqb53j': {
      'pt': 'Doar Roupas',
      'en': '',
      'es': '',
    },
    'wu50o0ef': {
      'pt': 'Doar Livros',
      'en': '',
      'es': '',
    },
    '5kayxiln': {
      'pt': 'Doar Bens',
      'en': '',
      'es': '',
    },
    '0ya6clbv': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // HomePage
  {
    's5xo7cjs': {
      'pt': 'Convenção Regional IAP-SEAL',
      'en': '',
      'es': '',
    },
    'ovgrkgkb': {
      'pt': 'Grupo \"OS PIONEIROS\"',
      'en': '',
      'es': '',
    },
    'rymf64kp': {
      'pt':
          'O Grupo \"Os Pioneiros\" é um ministério da Igreja Adventista da Promessa voltado ao desenvolvimento de jovens e adultos comprometidos com a fé cristã e com a missão de servir a comunidade. Inspirado no escotismo, o GOP promove atividades de cidadania, liderança e crescimento espiritual, preparando seus membros para serem cidadãos ativos e servos dedicados na obra de Deus. Atuamos em áreas como acampamentos, treinamentos, e projetos sociais, proporcionando experiências transformadoras que fortalecem o caráter e o compromisso com o evangelho.',
      'en': '',
      'es': '',
    },
    't7ehk46v': {
      'pt': 'Ministério de Ação Humanitéria',
      'en': '',
      'es': '',
    },
    'c8e63b3x': {
      'pt':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut sapien vel orci interdum pretium. Etiam non lorem in ipsum sollicitudin egestas. Sed viverra tempor ex ut sagittis. Integer ultricies, lacus vel luctus dignissim, enim magna aliquam ligula, ut tempor eros augue non elit. Fusce congue orci id nibh aliquet, vel suscipit libero finibus. Curabitur condimentum lacus a arcu mattis egestas. Aenean varius ipsum eget lacus pretium dapibus. Aliquam malesuada orci non sapien rhoncus dictum. Etiam maximus magna sit amet purus elementum hendrerit. Curabitur fermentum eleifend leo sit amet tincidunt. Praesent varius quis ante a venenatis. Aenean mollis sagittis pharetra. Donec ac lobortis elit. Fusce lobortis urna justo, a placerat eros placerat at. Curabitur eu urna sem.',
      'en': '',
      'es': '',
    },
    'oiupbbqf': {
      'pt': 'Ministério de Jovens',
      'en': '',
      'es': '',
    },
    'qr0ndhuy': {
      'pt':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut sapien vel orci interdum pretium. Etiam non lorem in ipsum sollicitudin egestas. Sed viverra tempor ex ut sagittis. Integer ultricies, lacus vel luctus dignissim, enim magna aliquam ligula, ut tempor eros augue non elit. Fusce congue orci id nibh aliquet, vel suscipit libero finibus. Curabitur condimentum lacus a arcu mattis egestas. Aenean varius ipsum eget lacus pretium dapibus. Aliquam malesuada orci non sapien rhoncus dictum. Etiam maximus magna sit amet purus elementum hendrerit. Curabitur fermentum eleifend leo sit amet tincidunt. Praesent varius quis ante a venenatis. Aenean mollis sagittis pharetra. Donec ac lobortis elit. Fusce lobortis urna justo, a placerat eros placerat at. Curabitur eu urna sem.',
      'en': '',
      'es': '',
    },
    'ahkwn4na': {
      'pt': 'Ministério de Educação Cristã',
      'en': '',
      'es': '',
    },
    'gxbzkqwr': {
      'pt':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut sapien vel orci interdum pretium. Etiam non lorem in ipsum sollicitudin egestas. Sed viverra tempor ex ut sagittis. Integer ultricies, lacus vel luctus dignissim, enim magna aliquam ligula, ut tempor eros augue non elit. Fusce congue orci id nibh aliquet, vel suscipit libero finibus. Curabitur condimentum lacus a arcu mattis egestas. Aenean varius ipsum eget lacus pretium dapibus. Aliquam malesuada orci non sapien rhoncus dictum. Etiam maximus magna sit amet purus elementum hendrerit. Curabitur fermentum eleifend leo sit amet tincidunt. Praesent varius quis ante a venenatis. Aenean mollis sagittis pharetra. Donec ac lobortis elit. Fusce lobortis urna justo, a placerat eros placerat at. Curabitur eu urna sem.',
      'en': '',
      'es': '',
    },
    '2h1x20ix': {
      'pt': 'Engajamento nos Projetos',
      'en': '',
      'es': '',
    },
    '6nprb7do': {
      'pt': 'MEUS CURSOS',
      'en': '',
      'es': '',
    },
    'ss7lf5pf': {
      'pt': 'MINHAS ATIVIDADES',
      'en': '',
      'es': '',
    },
    'f6vm5szz': {
      'pt': 'DOAÇÕES',
      'en': '',
      'es': '',
    },
    'evo0qzim': {
      'pt': 'AGENDA',
      'en': '',
      'es': '',
    },
    'x5sby7z9': {
      'pt': 'MENU',
      'en': '',
      'es': '',
    },
    'hwg04fvx': {
      'pt': 'Inicio',
      'en': 'Home',
      'es': '',
    },
  },
  // ListarCursos
  {
    'coz4n1si': {
      'pt': 'Lista dos Cursos',
      'en': '',
      'es': '',
    },
    '4zvvfoey': {
      'pt': 'Pesquisar todas as tarefas...',
      'en': '',
      'es': '',
    },
    'hnhrvxpa': {
      'pt': 'Lista dos treinamentos requeridos.',
      'en': '',
      'es': '',
    },
    'ako65b7v': {
      'pt': 'Todos',
      'en': '',
      'es': '',
    },
    'l9r7lxsg': {
      'pt': 'Iniciados',
      'en': '',
      'es': '',
    },
    'xu7xof8p': {
      'pt': 'Pendentes',
      'en': '',
      'es': '',
    },
    'qw3iqu46': {
      'pt': 'Concluidos',
      'en': '',
      'es': '',
    },
    '5zhxugx2': {
      'pt': 'Todos',
      'en': '',
      'es': '',
    },
    'tzis5ffp': {
      'pt': 'All',
      'en': '',
      'es': '',
    },
    'g7xc9pv2': {
      'pt': 'Nome do treinamento',
      'en': '',
      'es': '',
    },
    't0nlt6zj': {
      'pt': 'Responsável',
      'en': '',
      'es': '',
    },
    '4i0dunqx': {
      'pt': 'Due Date',
      'en': '',
      'es': '',
    },
    'kxtb9pmo': {
      'pt': 'Status',
      'en': '',
      'es': '',
    },
    'wvqqgjje': {
      'pt': 'Curso do GOP: Aprendiz',
      'en': '',
      'es': '',
    },
    'ldmtwh77': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'qmasv49c': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'yi7fy3ni': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    '8214u9u1': {
      'pt': 'Progresso',
      'en': '',
      'es': '',
    },
    'nt2hvouu': {
      'pt': 'Curso de Diaconato',
      'en': '',
      'es': '',
    },
    'luybocqx': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    'eunobkwa': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    'g09t3219': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'b26idhah': {
      'pt': 'Progresso',
      'en': '',
      'es': '',
    },
    '0h1dnqw7': {
      'pt': 'Curso do GOP: Companheiro',
      'en': '',
      'es': '',
    },
    'ozhe8pqe': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'kgzg2ea0': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'ij20ettm': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'rsp8rvi3': {
      'pt': 'Pendente',
      'en': '',
      'es': '',
    },
    'c3re4x6h': {
      'pt': 'Curso de Primeiros Socorros e Segurança',
      'en': '',
      'es': '',
    },
    'p2nhevl2': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'yw5gmryz': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'yh8olwxn': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'nzu6o55f': {
      'pt': 'Pendente',
      'en': '',
      'es': '',
    },
    'gm80jtdg': {
      'pt': 'Capacitação em Diversidade e Inclusão',
      'en': '',
      'es': '',
    },
    '5mp6r2zr': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'x9d9oc0f': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'np4b2c0n': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'ikph68f5': {
      'pt': 'Concluida',
      'en': '',
      'es': '',
    },
    '6a996rhn': {
      'pt': 'Curso do GOP: Explorador',
      'en': '',
      'es': '',
    },
    'lnu63gj7': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'csjwto1c': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'jlyq3042': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'trbhqcjr': {
      'pt': 'Concluida',
      'en': '',
      'es': '',
    },
    'y2u4x3df': {
      'pt': 'Curso do GOP: Aventureiro',
      'en': '',
      'es': '',
    },
    'ha9vnb5f': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'oad0tw2m': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    '8kg7aavu': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'vs9hwaau': {
      'pt': 'Concluida',
      'en': '',
      'es': '',
    },
    'fm086k9a': {
      'pt': 'Curso do GOP: Discipulos',
      'en': '',
      'es': '',
    },
    '4awivfc6': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'dc96z2cs': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    '0lxjm2yh': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    '23usv35l': {
      'pt': 'Concluida',
      'en': '',
      'es': '',
    },
    'fuy24eh4': {
      'pt': 'Orientações para Recepcionistas',
      'en': '',
      'es': '',
    },
    'dou3z57r': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'e6owg4wn': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'jrb7370s': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'w4wikpd5': {
      'pt': 'Concluida',
      'en': '',
      'es': '',
    },
    'bp7vn9ob': {
      'pt': 'Orientações para Pregadores Iniciantes',
      'en': '',
      'es': '',
    },
    'f9enhsk4': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    '2d61nlqb': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'h2322kwy': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'w83idhiw': {
      'pt': 'Concluida',
      'en': '',
      'es': '',
    },
    'mt2vdt7x': {
      'pt': 'Estudo sobre o Apocalipse',
      'en': '',
      'es': '',
    },
    '9llu0n4w': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    '15xepndy': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'zbn0kqwr': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'cjacwdbz': {
      'pt': 'Concluida',
      'en': '',
      'es': '',
    },
    '8mjh444t': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // CompartilharProjeto
  {
    'fvk6l33l': {
      'pt': 'Divulgue!',
      'en': '',
      'es': '',
    },
    'z40d8fto': {
      'pt':
          'Oferecemos aulas gratuitas para a comunidade, visando promover saúde física e mental. Nossas atividades incluem exercícios diversos para todas as idades e níveis de condicionamento físico. ',
      'en': '',
      'es': '',
    },
    'ci3f8htx': {
      'pt': 'Faça um comentário',
      'en': '',
      'es': '',
    },
    'an38u23f': {
      'pt':
          'Sua voz é importante! Conte-nos o que achou desse projeto e ajude na divulgação.',
      'en': '',
      'es': '',
    },
    '96yxb7wv': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // AvisoCompartilhar
  {
    'vig7n1di': {
      'pt': 'Compartilhado com sucesso!',
      'en': '',
      'es': '',
    },
    'c500fhm0': {
      'pt': 'OK',
      'en': '',
      'es': '',
    },
    'cx82rkb0': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // GerenciarProjeto
  {
    'jo2ya72b': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // ListarRequisitos
  {
    'udld5d2z': {
      'pt': 'Requisitos',
      'en': '',
      'es': '',
    },
    'gddfcctf': {
      'pt': 'Lista dos treinamentos disponiveis.',
      'en': '',
      'es': '',
    },
    'sdm1clig': {
      'pt': 'Pesquisar um treinamento ...',
      'en': '',
      'es': '',
    },
    'yvioka0a': {
      'pt': 'Nome do treinamento',
      'en': '',
      'es': '',
    },
    '90mjd6oz': {
      'pt': 'Responsável',
      'en': '',
      'es': '',
    },
    '7maj23c3': {
      'pt': 'Due Date',
      'en': '',
      'es': '',
    },
    'tn8y5mrw': {
      'pt': 'Requisito',
      'en': '',
      'es': '',
    },
    'oqi1egfv': {
      'pt': 'Orientações sobre Empatia e Sensibilidade Social',
      'en': '',
      'es': '',
    },
    '5g97bmff': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'tkictncf': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    '0mjf3bq8': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'jm8udxp0': {
      'pt': 'Curso de Primeiros Socorros e Segurança',
      'en': '',
      'es': '',
    },
    '1hmbg0xa': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'v4bt8qon': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'r4rum1db': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    '1fh33npj': {
      'pt': 'Capacitação em Comunicação Interpessoal',
      'en': '',
      'es': '',
    },
    'm4xzfwf4': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    '7wlnj883': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    'o2rja21a': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    '7nj8gojt': {
      'pt': 'Oficina de Liderança e Trabalho em Equipe',
      'en': '',
      'es': '',
    },
    'ibsk0jby': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'b9tkm985': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    '2m7la5w0': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'wka3b95a': {
      'pt': 'Capacitação em Diversidade e Inclusão',
      'en': '',
      'es': '',
    },
    'k906ncb0': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'rbp96pwb': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    '0c0loaev': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    '4oe60n7v': {
      'pt': 'Orientações para Facilitação de Atividades',
      'en': '',
      'es': '',
    },
    't11yigvo': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'q3rvn7ft': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'kzqbjh4f': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'mltkzuhv': {
      'pt': 'Definir Requisitos',
      'en': '',
      'es': '',
    },
    '6xsx50we': {
      'pt': 'Pesquisar um treinamento ...',
      'en': '',
      'es': '',
    },
    '6hsnbzsu': {
      'pt': 'Nome do treinamento',
      'en': '',
      'es': '',
    },
    '4hxv01cp': {
      'pt': 'Responsável',
      'en': '',
      'es': '',
    },
    '1dbiyvzv': {
      'pt': 'Due Date',
      'en': '',
      'es': '',
    },
    'g1d8wp81': {
      'pt': 'Requisito',
      'en': '',
      'es': '',
    },
    '3c88e9ly': {
      'pt': 'Orientações sobre Empatia e Sensibilidade Social',
      'en': '',
      'es': '',
    },
    'sznooaqo': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'cyutbchi': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'tfv2ad27': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    '3o58q35p': {
      'pt': 'Curso de Primeiros Socorros e Segurança',
      'en': '',
      'es': '',
    },
    'vwrz5xec': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'tpk0c6ke': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    't0t48adx': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'u4ww2n2u': {
      'pt': 'Capacitação em Comunicação Interpessoal',
      'en': '',
      'es': '',
    },
    'j98zt7qu': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    'jva91eaw': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    '96lo238n': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'rjsdu4xp': {
      'pt': 'Oficina de Liderança e Trabalho em Equipe',
      'en': '',
      'es': '',
    },
    '9amp49hf': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'quz5j5yh': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'tb0t3gbk': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'o477z94d': {
      'pt': 'Capacitação em Diversidade e Inclusão',
      'en': '',
      'es': '',
    },
    'y4voe3g1': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'jd0gp7gi': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'zwgel9a2': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'bn36wr08': {
      'pt': 'Orientações para Facilitação de Atividades',
      'en': '',
      'es': '',
    },
    'i30r2ntq': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    '6va4bar5': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'vaxe90wu': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'db6qx83m': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // HomeOrganizacao
  {
    '8lvwtjqn': {
      'pt': 'Organização',
      'en': '',
      'es': '',
    },
    '8hq8bzqn': {
      'pt': 'Criar',
      'en': '',
      'es': '',
    },
    'd2zis05d': {
      'pt': 'CNPJ da Organização',
      'en': '',
      'es': '',
    },
    '7dqqgs61': {
      'pt': 'Digite o CNPJ da organização ...',
      'en': '',
      'es': '',
    },
    '72gzpv49': {
      'pt': 'Nome da Organização',
      'en': '',
      'es': '',
    },
    'v1dzvk84': {
      'pt': 'Digite o nome da organização ...',
      'en': '',
      'es': '',
    },
    'yrafyl7c': {
      'pt': 'Nome abreviado / Apelido',
      'en': '',
      'es': '',
    },
    'mngdphw9': {
      'pt': 'Digite o nome para exibição no sistema',
      'en': '',
      'es': '',
    },
    'qh2emgog': {
      'pt': 'Descrição da Organização',
      'en': '',
      'es': '',
    },
    'z4bvk3rp': {
      'pt': 'Escreva uma breve descrição ...',
      'en': '',
      'es': '',
    },
    'lczccrmh': {
      'pt': 'Insira o logotipo da organização: ',
      'en': '',
      'es': '',
    },
    'fdljvxiu': {
      'pt': 'Carregar imagem do projeto',
      'en': '',
      'es': '',
    },
    '8bwl1w69': {
      'pt': 'Possui uma sede? ',
      'en': '',
      'es': '',
    },
    'lspdsm9b': {
      'pt': 'Não.',
      'en': '',
      'es': '',
    },
    'zcnr3zyd': {
      'pt': 'Sim.',
      'en': '',
      'es': '',
    },
    'dblmavwi': {
      'pt': 'Endereço da sede',
      'en': '',
      'es': '',
    },
    '5putpyi0': {
      'pt': 'Digite o endereço da sede ...',
      'en': '',
      'es': '',
    },
    'fngxcs0g': {
      'pt': 'Qual o tipo da organização? ',
      'en': '',
      'es': '',
    },
    '2u5666uh': {
      'pt': 'Convenção',
      'en': '',
      'es': '',
    },
    '5mjxtf20': {
      'pt': 'Convenção',
      'en': '',
      'es': '',
    },
    '7ewdaz57': {
      'pt': 'Igreja com CNPJ',
      'en': '',
      'es': '',
    },
    'adt29mi8': {
      'pt': 'Criar organização',
      'en': '',
      'es': '',
    },
    'h9wlh8wo': {
      'pt': 'Editar',
      'en': '',
      'es': '',
    },
    'pvvtw9cn': {
      'pt': 'CNPJ da Organização',
      'en': '',
      'es': '',
    },
    'vr8jpa24': {
      'pt': 'Digite o CNPJ da organização ...',
      'en': '',
      'es': '',
    },
    'eaw8cq27': {
      'pt': 'Nome da Organização',
      'en': '',
      'es': '',
    },
    '92u2wa4y': {
      'pt': 'Digite o nome da organização ...',
      'en': '',
      'es': '',
    },
    'cwjt2wbg': {
      'pt': 'Nome abreviado / Apelido',
      'en': '',
      'es': '',
    },
    'u8zcrrpw': {
      'pt': 'Digite o nome para exibição no sistema',
      'en': '',
      'es': '',
    },
    'b1j4lnlm': {
      'pt': 'Descrição da Organização',
      'en': '',
      'es': '',
    },
    'zmeb02s8': {
      'pt': 'Escreva uma breve descrição ...',
      'en': '',
      'es': '',
    },
    'dimylkh5': {
      'pt': 'Insira o logotipo da organização: ',
      'en': '',
      'es': '',
    },
    '6a54fl8e': {
      'pt': 'Carregar imagem do projeto',
      'en': '',
      'es': '',
    },
    '9k2g31zx': {
      'pt': 'Possui uma sede? ',
      'en': '',
      'es': '',
    },
    'xzjbkrut': {
      'pt': 'Não.',
      'en': '',
      'es': '',
    },
    'uztknt4y': {
      'pt': 'Sim.',
      'en': '',
      'es': '',
    },
    '9h1hju17': {
      'pt': 'Endereço da sede',
      'en': '',
      'es': '',
    },
    'voadhn2q': {
      'pt': 'Digite o endereço da sede ...',
      'en': '',
      'es': '',
    },
    'g3to9urv': {
      'pt': 'Qual o tipo da organização? ',
      'en': '',
      'es': '',
    },
    'jayzpyom': {
      'pt': 'Convenção',
      'en': '',
      'es': '',
    },
    'u8b3yjjn': {
      'pt': 'Convenção',
      'en': '',
      'es': '',
    },
    'vuwjspzo': {
      'pt': 'Igreja com CNPJ',
      'en': '',
      'es': '',
    },
    'fc7z9bm8': {
      'pt': 'Salvar alterações',
      'en': '',
      'es': '',
    },
    'tj1x7oyq': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // AgendarAtividade
  {
    'x7uyscfu': {
      'pt': 'Agendamento',
      'en': '',
      'es': '',
    },
    '03k0oj0u': {
      'pt': 'Nome da Atividade',
      'en': '',
      'es': '',
    },
    'gfus5mj9': {
      'pt': 'Escolha uma atividade ...',
      'en': '',
      'es': '',
    },
    'lp6p9nx4': {
      'pt': 'Responsavel pela atividade',
      'en': '',
      'es': '',
    },
    'kvvxfukh': {
      'pt': 'Escolha o responsavel pelo projeto ...',
      'en': '',
      'es': '',
    },
    'qrtiulbt': {
      'pt': 'Local da realização',
      'en': '',
      'es': '',
    },
    'j2wb5xwv': {
      'pt': 'Digite o local e/ou endereço  ...',
      'en': '',
      'es': '',
    },
    '205ax5el': {
      'pt': 'Data de inicio:',
      'en': '',
      'es': '',
    },
    'xbgye08e': {
      'pt': 'Calendario',
      'en': '',
      'es': '',
    },
    'r8losa0x': {
      'pt': 'DD/MM/AAAA\n',
      'en': '',
      'es': '',
    },
    'b7iwaawk': {
      'pt': 'HH:MM',
      'en': '',
      'es': '',
    },
    'v6r3obrf': {
      'pt': 'Data de termino:',
      'en': '',
      'es': '',
    },
    'eafbfs0y': {
      'pt': 'Calendario',
      'en': '',
      'es': '',
    },
    '74kemw1i': {
      'pt': 'DD/MM/AAAA\n',
      'en': '',
      'es': '',
    },
    '82022h3q': {
      'pt': 'HH:MM',
      'en': '',
      'es': '',
    },
    '897pygo4': {
      'pt': 'Salvar',
      'en': '',
      'es': '',
    },
    '0fs6rife': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // Calendario
  {
    'd5red93t': {
      'pt': 'Calendário',
      'en': '',
      'es': '',
    },
    'v7m4upvc': {
      'pt': 'Salvar',
      'en': '',
      'es': '',
    },
    '9f3aoboe': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // DoacaoFinanceira
  {
    'z4ow5adf': {
      'pt': 'Doação Financeira',
      'en': '',
      'es': '',
    },
    'k070soby': {
      'pt': 'Escolha um projeto para contribuir:',
      'en': '',
      'es': '',
    },
    'ld6zcct9': {
      'pt': 'Academia na praça',
      'en': '',
      'es': '',
    },
    'jssgjhiq': {
      'pt': 'Academia na praça',
      'en': '',
      'es': '',
    },
    'ews4mx3p': {
      'pt': 'Sopa solidária',
      'en': '',
      'es': '',
    },
    'z6v448op': {
      'pt': 'Informatica para a melhor idade',
      'en': '',
      'es': '',
    },
    'aaujosj7': {
      'pt': 'Forma de pagamento:',
      'en': '',
      'es': '',
    },
    'g3x2friv': {
      'pt': 'Cartão',
      'en': '',
      'es': '',
    },
    '9b4a3d6p': {
      'pt': 'PIX',
      'en': '',
      'es': '',
    },
    '7yicfjf6': {
      'pt': 'Cartão',
      'en': '',
      'es': '',
    },
    '53mf8ab2': {
      'pt': 'Contribuição será recorrente?',
      'en': '',
      'es': '',
    },
    '3bqzn5ky': {
      'pt': 'Sim.',
      'en': '',
      'es': '',
    },
    'ynnfiuxq': {
      'pt': 'Sim.',
      'en': '',
      'es': '',
    },
    'w2xywoip': {
      'pt': 'Não. Parcela unica!',
      'en': '',
      'es': '',
    },
    'k1pk1tpl': {
      'pt': 'Detalhes da contribuição',
      'en': '',
      'es': '',
    },
    'fjzs3oi2': {
      'pt': 'Valor da parcela',
      'en': '',
      'es': '',
    },
    'qji09rjy': {
      'pt': 'R\$ 10.00',
      'en': '',
      'es': '',
    },
    'k8bxk4v8': {
      'pt': 'Quantidade de parcelas',
      'en': '',
      'es': '',
    },
    'kobq9zjs': {
      'pt': '12',
      'en': '',
      'es': '',
    },
    'ae2xqx0q': {
      'pt': 'Total da doação: ',
      'en': '',
      'es': '',
    },
    'es6kqlcn': {
      'pt': 'R\$ 120.00',
      'en': '',
      'es': '',
    },
    'mvkzqm9t': {
      'pt': 'Copiar dados para o PIX',
      'en': '',
      'es': '',
    },
    'ucvjroar': {
      'pt': 'Escolha o tipo do cartão:',
      'en': '',
      'es': '',
    },
    'xbsluc8a': {
      'pt': 'Crédito.',
      'en': '',
      'es': '',
    },
    'fw0p9mtu': {
      'pt': 'Débito.',
      'en': '',
      'es': '',
    },
    'jpje257e': {
      'pt': 'Crédito.',
      'en': '',
      'es': '',
    },
    'wd28tie1': {
      'pt': 'Detalhes da contribuição',
      'en': '',
      'es': '',
    },
    'b6bnwarw': {
      'pt': 'Valor da parcela',
      'en': '',
      'es': '',
    },
    'jxnd4blo': {
      'pt': 'R\$ 10.00',
      'en': '',
      'es': '',
    },
    'blthf29j': {
      'pt': 'Quantidade de parcelas',
      'en': '',
      'es': '',
    },
    'sqa46dpm': {
      'pt': '12',
      'en': '',
      'es': '',
    },
    'p3z1w3op': {
      'pt': 'Total da doação: ',
      'en': '',
      'es': '',
    },
    'jsdj94ys': {
      'pt': 'R\$ 120.00',
      'en': '',
      'es': '',
    },
    'x10f9ozz': {
      'pt': 'Confirmar contribuição',
      'en': '',
      'es': '',
    },
    'mlmamm3t': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // modeloCopy
  {
    'ggyrggcm': {
      'pt': 'Pagamento com cartão',
      'en': '',
      'es': '',
    },
    'matd2z4r': {
      'pt': 'Preencha os dados abaixo para fazer sua doação.',
      'en': '',
      'es': '',
    },
    'd0v5hjdo': {
      'pt': 'Detalhes da contribuição',
      'en': '',
      'es': '',
    },
    '5w25sw7o': {
      'pt': 'Valor da parcela',
      'en': '',
      'es': '',
    },
    'pkbh6to4': {
      'pt': 'R\$ 10.00',
      'en': '',
      'es': '',
    },
    'znlbxotx': {
      'pt': 'Quantidade de parcelas',
      'en': '',
      'es': '',
    },
    '1evzolsg': {
      'pt': '2',
      'en': '',
      'es': '',
    },
    'aby1zy97': {
      'pt': 'Total da doação: ',
      'en': '',
      'es': '',
    },
    '9holf5f1': {
      'pt': 'R\$ 20.00',
      'en': '',
      'es': '',
    },
    'f92ymkj0': {
      'pt': 'Confirmar Contribuição',
      'en': '',
      'es': '',
    },
    'kyiv2esq': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // CriarCurso
  {
    'enmft03w': {
      'pt': 'Novo Treinamento',
      'en': '',
      'es': '',
    },
    'dw7sagyk': {
      'pt': 'Titulo do treinamento',
      'en': '',
      'es': '',
    },
    'o7sjinke': {
      'pt': 'Digite um nome para o treinamento ...',
      'en': '',
      'es': '',
    },
    'p18q1s9y': {
      'pt': 'Responsavel pelo treinamento',
      'en': '',
      'es': '',
    },
    '9vue1pr0': {
      'pt': 'Lider responsavel pelo treinamento...',
      'en': '',
      'es': '',
    },
    'l2degeu4': {
      'pt': 'Descrição',
      'en': '',
      'es': '',
    },
    'jmx850ae': {
      'pt': 'Digite uma breve apresentação ...',
      'en': '',
      'es': '',
    },
    'bmhzrv6t': {
      'pt': 'Incluir Materiais',
      'en': '',
      'es': '',
    },
    's1n6sx93': {
      'pt': 'Criar treinamento',
      'en': '',
      'es': '',
    },
    'fl6xnh5u': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // IncluirMaterialCurso
  {
    'd1tpmwxc': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // EditarMaterialCurso
  {
    'jz1ui88m': {
      'pt': 'Material para treinamento',
      'en': '',
      'es': '',
    },
    'qaj5nz9t': {
      'pt': 'Identificação do material',
      'en': '',
      'es': '',
    },
    '2lfrc3ld': {
      'pt': 'Digite um nome para o material ...',
      'en': '',
      'es': '',
    },
    '27r3bbux': {
      'pt': 'Autor do material',
      'en': '',
      'es': '',
    },
    'urupvbu6': {
      'pt': 'Nome do criador do conteudo ...',
      'en': '',
      'es': '',
    },
    'rsoxe8xk': {
      'pt': 'Qual o tipo do material? ',
      'en': '',
      'es': '',
    },
    'r6oecbus': {
      'pt': 'Apostila em PDF',
      'en': '',
      'es': '',
    },
    'bwdlvrea': {
      'pt': 'Aula em video ',
      'en': '',
      'es': '',
    },
    'ezgej3j6': {
      'pt': 'Apresentações de slides',
      'en': '',
      'es': '',
    },
    'v1a1k269': {
      'pt': 'Recursos de áudio',
      'en': '',
      'es': '',
    },
    'utw8pyaf': {
      'pt': 'Download do material',
      'en': '',
      'es': '',
    },
    '6lag0obe': {
      'pt': 'Qual o criterio de avaliação? ',
      'en': '',
      'es': '',
    },
    'rw67mubt': {
      'pt': 'Assistir ao conteudo',
      'en': '',
      'es': '',
    },
    'rjt5vfdh': {
      'pt': 'Questionario',
      'en': '',
      'es': '',
    },
    '6se0unau': {
      'pt': 'Escrever resumo',
      'en': '',
      'es': '',
    },
    'ndrxehti': {
      'pt': 'Assinar termo de conhecimento',
      'en': '',
      'es': '',
    },
    'lpukl13j': {
      'pt': 'Download da avaliação\n (opcional)',
      'en': '',
      'es': '',
    },
    'tq9rxlv8': {
      'pt': 'Atualizar Material',
      'en': '',
      'es': '',
    },
    '9yfj9wy8': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // ListarMaterial
  {
    'jie6kq9z': {
      'pt': 'Materiais',
      'en': '',
      'es': '',
    },
    'o1xhupdf': {
      'pt': 'Lista dos materiais',
      'en': '',
      'es': '',
    },
    'jvm7f696': {
      'pt': 'Pesquisar todas as tarefas...',
      'en': '',
      'es': '',
    },
    'bmxqp7ay': {
      'pt': 'Nome do material',
      'en': '',
      'es': '',
    },
    '3v95v15n': {
      'pt': 'Autor',
      'en': '',
      'es': '',
    },
    'lf9qexxu': {
      'pt': 'Incluido',
      'en': '',
      'es': '',
    },
    't95erl7w': {
      'pt': 'Tipo',
      'en': '',
      'es': '',
    },
    'sdt3in3l': {
      'pt': 'Orientações sobre Empatia e Sensibilidade Social',
      'en': '',
      'es': '',
    },
    'd12a4kxn': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    '0x9pdpcq': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    '6odt8mvd': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    '7lp7sz4r': {
      'pt': 'Pago',
      'en': '',
      'es': '',
    },
    'dslvubz9': {
      'pt': 'Curso de Primeiros Socorros e Segurança',
      'en': '',
      'es': '',
    },
    '3xwkj0cd': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    '6gcxj9v1': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'u6si6aw2': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'jmnyz7l4': {
      'pt': 'Pago',
      'en': '',
      'es': '',
    },
    '0iz9f2ot': {
      'pt': 'Capacitação em Comunicação Interpessoal',
      'en': '',
      'es': '',
    },
    't6yici42': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    'c02g4y34': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    'sdh8ve2r': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'stbszcyo': {
      'pt': 'Gratis',
      'en': '',
      'es': '',
    },
    'c2jz7kec': {
      'pt': 'Oficina de Liderança e Trabalho em Equipe',
      'en': '',
      'es': '',
    },
    '3x16vnr4': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'r1t70vbp': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'uxkh7zbg': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'mjs1u4sv': {
      'pt': 'Gratis',
      'en': '',
      'es': '',
    },
    'dq2icxuv': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // AnexarMaterial
  {
    'w5daih6s': {
      'pt': 'Material',
      'en': '',
      'es': '',
    },
    '9fh5czme': {
      'pt': 'Lista dos materiais disponiveis.',
      'en': '',
      'es': '',
    },
    'y07y72f2': {
      'pt': 'Pesquisar um treinamento ...',
      'en': '',
      'es': '',
    },
    '2oi5sjia': {
      'pt': 'Nome do material',
      'en': '',
      'es': '',
    },
    'pwjdlxq8': {
      'pt': 'Autor',
      'en': '',
      'es': '',
    },
    '3bmxnfje': {
      'pt': 'Due Date',
      'en': '',
      'es': '',
    },
    's96uh182': {
      'pt': 'Anexar',
      'en': '',
      'es': '',
    },
    'poplqv9k': {
      'pt': 'Orientações sobre Empatia e Sensibilidade Social',
      'en': '',
      'es': '',
    },
    'vxyz09gn': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'cw017g8n': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'c9vyh7h1': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'cs5zqz3x': {
      'pt': 'Curso de Primeiros Socorros e Segurança',
      'en': '',
      'es': '',
    },
    'hon2krwg': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'zsq3z6p7': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'lqlb8vyu': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'i8hmtllx': {
      'pt': 'Capacitação em Comunicação Interpessoal',
      'en': '',
      'es': '',
    },
    'kbe0lxs7': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    'kpjy588r': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    'iuqqwd5y': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'rkpi4dh2': {
      'pt': 'Oficina de Liderança e Trabalho em Equipe',
      'en': '',
      'es': '',
    },
    'jgabqqf0': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'zapn083q': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    '1bjyo8vk': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    '3l80t6ab': {
      'pt': 'Capacitação em Diversidade e Inclusão',
      'en': '',
      'es': '',
    },
    'zdq0k84p': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'iw4pmhtz': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'cw9yy90p': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'qfltq1br': {
      'pt': 'Orientações para Facilitação de Atividades',
      'en': '',
      'es': '',
    },
    '5dd4jvf5': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    '8l0i5b9v': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    '3ndu0226': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    '8g8818lh': {
      'pt': 'Carregar material selecionado',
      'en': '',
      'es': '',
    },
    'v10h578f': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // DoacaoAlimento
  {
    'vo3ce054': {
      'pt': 'Doação Alimento',
      'en': '',
      'es': '',
    },
    'sjzzha2y': {
      'pt': 'Escolha um projeto para contribuir:',
      'en': '',
      'es': '',
    },
    'vmfr81mt': {
      'pt': 'Academia na praça',
      'en': '',
      'es': '',
    },
    'k6l94ogi': {
      'pt': 'Sopa solidária',
      'en': '',
      'es': '',
    },
    'cttaqj6x': {
      'pt': 'Informatica para a melhor idade',
      'en': '',
      'es': '',
    },
    'f9vdlsff': {
      'pt': 'Qual o tipo do alimento',
      'en': '',
      'es': '',
    },
    'd46am0qc': {
      'pt': 'Tipo do alimento',
      'en': '',
      'es': '',
    },
    '22jdb1sf': {
      'pt': 'Escolha o tipo de alimento ...',
      'en': '',
      'es': '',
    },
    'iowxdixo': {
      'pt': 'Unidade do alimento',
      'en': '',
      'es': '',
    },
    'g2p7y1nx': {
      'pt': 'Quilo, Litro, Caixa, Unidade ...',
      'en': '',
      'es': '',
    },
    'q28sxjm8': {
      'pt': 'Quantidade doada',
      'en': '',
      'es': '',
    },
    'zoz5czpu': {
      'pt': 'Digite a quantidade doada ...',
      'en': '',
      'es': '',
    },
    'swpqa8ww': {
      'pt': 'Valor dos alimentos',
      'en': '',
      'es': '',
    },
    'h2hgi7nu': {
      'pt': 'Digite um valor para a doação',
      'en': '',
      'es': '',
    },
    'jv43ibs6': {
      'pt': 'Concluir doação',
      'en': '',
      'es': '',
    },
    'f2h89rls': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // DoacaoLivro
  {
    '0nj8e95j': {
      'pt': 'Doação Livro',
      'en': '',
      'es': '',
    },
    '3b6yexpy': {
      'pt': 'Escolha um projeto para contribuir:',
      'en': '',
      'es': '',
    },
    '3fm885jc': {
      'pt': 'Academia na praça',
      'en': '',
      'es': '',
    },
    'hlxof1km': {
      'pt': 'Sopa solidária',
      'en': '',
      'es': '',
    },
    'kitjug90': {
      'pt': 'Informatica para a melhor idade',
      'en': '',
      'es': '',
    },
    'jn7nyxka': {
      'pt': 'Descreva o livro',
      'en': '',
      'es': '',
    },
    'lov2s55p': {
      'pt': 'Titulo',
      'en': '',
      'es': '',
    },
    '0pyhj07r': {
      'pt': 'Titulo do livro ...',
      'en': '',
      'es': '',
    },
    'uy22armh': {
      'pt': 'Valor do livro',
      'en': '',
      'es': '',
    },
    'ijctu42q': {
      'pt': 'Digite um valor para a doação',
      'en': '',
      'es': '',
    },
    'zmgtfxge': {
      'pt': 'Concluir doação',
      'en': '',
      'es': '',
    },
    'o0235m3x': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // DoacaoBem
  {
    'pmr0wlfi': {
      'pt': 'Doação Bem',
      'en': '',
      'es': '',
    },
    '747tp2wj': {
      'pt': 'Escolha um projeto para contribuir:',
      'en': '',
      'es': '',
    },
    '5yf4ywmz': {
      'pt': 'Academia na praça',
      'en': '',
      'es': '',
    },
    'olzkd7mu': {
      'pt': 'Sopa solidária',
      'en': '',
      'es': '',
    },
    '5b0if10t': {
      'pt': 'Informatica para a melhor idade',
      'en': '',
      'es': '',
    },
    'y1pjr1mb': {
      'pt': 'Descreva o bem',
      'en': '',
      'es': '',
    },
    'ok1phwfe': {
      'pt': 'Descrição do bem',
      'en': '',
      'es': '',
    },
    'b6fxsrn8': {
      'pt': 'Escreva uma breve descrição ...',
      'en': '',
      'es': '',
    },
    '0i9yfsj7': {
      'pt': 'Valor do bem',
      'en': '',
      'es': '',
    },
    'mkvhp8u7': {
      'pt': 'Digite um valor para a doação',
      'en': '',
      'es': '',
    },
    '9jwdnq3d': {
      'pt': 'Concluir doação',
      'en': '',
      'es': '',
    },
    'bqyj5zwa': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // DoacaoRoupa
  {
    'h762r80a': {
      'pt': 'Doação Roupa',
      'en': '',
      'es': '',
    },
    '4r21y9sj': {
      'pt': 'Escolha um projeto para contribuir:',
      'en': '',
      'es': '',
    },
    '6s5u1jn5': {
      'pt': 'Academia na praça',
      'en': '',
      'es': '',
    },
    'bjqq84vm': {
      'pt': 'Sopa solidária',
      'en': '',
      'es': '',
    },
    'kcgbaggb': {
      'pt': 'Informatica para a melhor idade',
      'en': '',
      'es': '',
    },
    '7mvphgkq': {
      'pt': 'Qual o tipo da roupa',
      'en': '',
      'es': '',
    },
    'y2snpl1m': {
      'pt': 'Quantidade e peças',
      'en': '',
      'es': '',
    },
    's1mhcwjj': {
      'pt': 'Digite a quantidade doada ...',
      'en': '',
      'es': '',
    },
    'f32dv6b8': {
      'pt': 'Valor das roupas',
      'en': '',
      'es': '',
    },
    'uafzjczj': {
      'pt': 'Digite um valor para a doação',
      'en': '',
      'es': '',
    },
    't19bmx2o': {
      'pt': 'Concluir doação',
      'en': '',
      'es': '',
    },
    'i05e0l7j': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // RegistroFinanceiro
  {
    'hvhdx3zx': {
      'pt': 'FINANCEIRO',
      'en': '',
      'es': '',
    },
    'y8ed9i6i': {
      'pt': 'Lista das transações registradas.',
      'en': '',
      'es': '',
    },
    '1h9sw329': {
      'pt': 'Todas',
      'en': '',
      'es': '',
    },
    'rp41tfmh': {
      'pt': 'Recebimento',
      'en': '',
      'es': '',
    },
    '4obs5hg5': {
      'pt': 'Pagamento',
      'en': '',
      'es': '',
    },
    'jgt16z8v': {
      'pt': 'Pesquisar transações ...',
      'en': '',
      'es': '',
    },
    'r6op82cq': {
      'pt': 'Data',
      'en': '',
      'es': '',
    },
    '0e0ja5no': {
      'pt': 'Responsável',
      'en': '',
      'es': '',
    },
    '332frcjz': {
      'pt': 'Descrição',
      'en': '',
      'es': '',
    },
    'y5yvu2n4': {
      'pt': 'Valor',
      'en': '',
      'es': '',
    },
    'wp609az1': {
      'pt': 'Registro',
      'en': '',
      'es': '',
    },
    'nulxtt4k': {
      'pt': '02/03/2024',
      'en': '',
      'es': '',
    },
    'sn8zft9n': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'q8738506': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'ra0qt3ep': {
      'pt': 'Pagamento de combustivel',
      'en': '',
      'es': '',
    },
    '48ci746a': {
      'pt': '50,00',
      'en': '',
      'es': '',
    },
    'duj931xe': {
      'pt': '03/03/2024',
      'en': '',
      'es': '',
    },
    'pl93llar': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    'dwrnbku8': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    'iymyl40e': {
      'pt': 'Material de limpeza',
      'en': '',
      'es': '',
    },
    'u5i3bcsz': {
      'pt': '10,00',
      'en': '',
      'es': '',
    },
    'ko2xvutd': {
      'pt': '04/03/2024',
      'en': '',
      'es': '',
    },
    'e86nliwm': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'v2qo3mor': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'b0mo0x5n': {
      'pt': 'Pagamento de Combuistivel',
      'en': '',
      'es': '',
    },
    'j4umd066': {
      'pt': '50,00',
      'en': '',
      'es': '',
    },
    '29gnhug4': {
      'pt': '05/03/2024',
      'en': '',
      'es': '',
    },
    '2has3p8a': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    '6a31r5pr': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    'mfwmfs8b': {
      'pt': 'Lanche',
      'en': '',
      'es': '',
    },
    'wz7yxkug': {
      'pt': '10,00',
      'en': '',
      'es': '',
    },
    'zw5t2cwm': {
      'pt': '05/03/2024',
      'en': '',
      'es': '',
    },
    'fvcpcvcj': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    '51o95yp3': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    'i1pg5zdp': {
      'pt': 'Lanche',
      'en': '',
      'es': '',
    },
    'znj2ruqh': {
      'pt': '10,00',
      'en': '',
      'es': '',
    },
    '77ckh5cq': {
      'pt': '05/03/2024',
      'en': '',
      'es': '',
    },
    'dmhiqbzb': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    'qoslg81g': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    'omq962il': {
      'pt': 'Lanche',
      'en': '',
      'es': '',
    },
    'y411df2f': {
      'pt': '10,00',
      'en': '',
      'es': '',
    },
    'kvjwr5hl': {
      'pt': '05/03/2024',
      'en': '',
      'es': '',
    },
    'k6q6chjd': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    'lo6e2iuk': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    'rz896je0': {
      'pt': 'Lanche',
      'en': '',
      'es': '',
    },
    'bykafr0u': {
      'pt': '10,00',
      'en': '',
      'es': '',
    },
    'ozusichs': {
      'pt': '05/03/2024',
      'en': '',
      'es': '',
    },
    '2oyeb52e': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    '9an1y924': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    '1w5gdyyi': {
      'pt': 'Lanche',
      'en': '',
      'es': '',
    },
    've0txbmi': {
      'pt': '10,00',
      'en': '',
      'es': '',
    },
    '8mduiyi4': {
      'pt': '05/03/2024',
      'en': '',
      'es': '',
    },
    's9bbgknh': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    '9d966689': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    'ij92aasp': {
      'pt': 'Lanche',
      'en': '',
      'es': '',
    },
    '3yrw4w9b': {
      'pt': '10,00',
      'en': '',
      'es': '',
    },
    'os95nwoz': {
      'pt': '05/03/2024',
      'en': '',
      'es': '',
    },
    'o3m3v7p5': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    'fapgdcox': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    '4b5oz0m2': {
      'pt': 'Lanche',
      'en': '',
      'es': '',
    },
    'a84rt4af': {
      'pt': '10,00',
      'en': '',
      'es': '',
    },
    'iwfibi8u': {
      'pt': '05/03/2024',
      'en': '',
      'es': '',
    },
    'i0hsuvxu': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    'pwkksn1h': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    'n94bs6dn': {
      'pt': 'Lanche',
      'en': '',
      'es': '',
    },
    'hcwtx4sn': {
      'pt': '10,00',
      'en': '',
      'es': '',
    },
    'eusa2xlz': {
      'pt': '06/03/2024',
      'en': '',
      'es': '',
    },
    '7ebm9w96': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    'qabatapm': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    '6jrhy6bg': {
      'pt': 'Lanche',
      'en': '',
      'es': '',
    },
    'p9z4c3yt': {
      'pt': '10,00',
      'en': '',
      'es': '',
    },
    'y3dmqzb4': {
      'pt': '07/03/2024',
      'en': '',
      'es': '',
    },
    'iw5zvv3b': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    'r19zt09m': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    'tgjwdtr8': {
      'pt': 'Lanche',
      'en': '',
      'es': '',
    },
    '28dyiw1s': {
      'pt': '10,00',
      'en': '',
      'es': '',
    },
    'uw61ufik': {
      'pt': '07/03/2024',
      'en': '',
      'es': '',
    },
    'f0wktsng': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    'x6igcrbz': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    'lne53q3n': {
      'pt': 'Lanche',
      'en': '',
      'es': '',
    },
    '30lyv75s': {
      'pt': '10,00',
      'en': '',
      'es': '',
    },
    'byx4u3p1': {
      'pt': '07/03/2024',
      'en': '',
      'es': '',
    },
    'yh38ja8w': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    'k40nvxcb': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    'cwgjy1dv': {
      'pt': 'Lanche',
      'en': '',
      'es': '',
    },
    'cz17gev6': {
      'pt': '10,00',
      'en': '',
      'es': '',
    },
    '4qc5610g': {
      'pt': '07/03/2024',
      'en': '',
      'es': '',
    },
    '8hfkrd5w': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    '2r4drowl': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    'xtb6pviz': {
      'pt': 'Lanche',
      'en': '',
      'es': '',
    },
    'hb21sjef': {
      'pt': '10,00',
      'en': '',
      'es': '',
    },
    'um9x68am': {
      'pt': 'Salvar alterações',
      'en': '',
      'es': '',
    },
    'ktv24b96': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // EscolherProjetos
  {
    'fbv0zpbb': {
      'pt': 'Projetos',
      'en': '',
      'es': '',
    },
    '4anjh7h5': {
      'pt': 'Escolha os projetos:',
      'en': '',
      'es': '',
    },
    'cow4yvjs': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '5jyaj5rj': {
      'pt': 'Academia na praça',
      'en': '',
      'es': '',
    },
    '4mpnwp4j': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'fxzyzfar': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'u3ck2lxe': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'ewwa4ic9': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'q8jmkcpl': {
      'pt': 'Preparação para o ENEM',
      'en': '',
      'es': '',
    },
    '6vxg21ef': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'k4l7t4fc': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'y6q1xwiv': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'zwvhyk0l': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '0c04n2l2': {
      'pt': 'Escola Biblica de ferias',
      'en': '',
      'es': '',
    },
    'te23yoy1': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'wo5q99uy': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'v3wj8tof': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'e391qo8i': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'bzazh454': {
      'pt': 'Coral da terceira idade',
      'en': '',
      'es': '',
    },
    '74iwwwg6': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'b7wvdf07': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    '5490i5tt': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'hpyn9ug5': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'trbona51': {
      'pt': 'Doação de roupas usadas',
      'en': '',
      'es': '',
    },
    '3c6wqaht': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'gavbzi8m': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'hep2tm55': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'srkpnmyp': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'gvf2yftj': {
      'pt': 'Clube de leitura',
      'en': '',
      'es': '',
    },
    'u43l713b': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'n1973xvw': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'p90r6rxp': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '85nhhfuq': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'n424yq2c': {
      'pt': 'Sopão da solidariedade',
      'en': '',
      'es': '',
    },
    'ajtdk7c6': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'v3ctmabc': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    '54ad2xm9': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'v6yan9iu': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '9lgg0jzo': {
      'pt': 'Doação de cestas basicas',
      'en': '',
      'es': '',
    },
    '429b75rq': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '7vci3tzf': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'l5nx20os': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'hwyrw7sp': {
      'pt': 'Confirmar seleção',
      'en': '',
      'es': '',
    },
    '3qk3lgzb': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // EscolherAtividades
  {
    'wj4g8s3x': {
      'pt': 'Atividades',
      'en': '',
      'es': '',
    },
    'p97p1eja': {
      'pt': 'Escolha as atividades:',
      'en': '',
      'es': '',
    },
    'g8ylouyg': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '0vktx9iy': {
      'pt': 'Reunião de Planejamento',
      'en': '',
      'es': '',
    },
    '3jr7r18g': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'wn8yil58': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'ps2yhhqa': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'xqngzjh4': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'm86izfho': {
      'pt': 'Arrecadação de livros',
      'en': '',
      'es': '',
    },
    'dpgj0u4g': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'mwpc34wx': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'dkpugtxk': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '0g5bligd': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'i42mpt7j': {
      'pt': 'Distribuição do sopão',
      'en': '',
      'es': '',
    },
    'ucjzhm7g': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '4kfn3fp9': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    '39esic1r': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    's796yowb': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'niea15xj': {
      'pt': 'Divulgação do projeto',
      'en': '',
      'es': '',
    },
    '5ud00s2b': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'vw4s6hbt': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'htydpd7f': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'o4wp6o14': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'r43vtwpj': {
      'pt': 'Leitura em grupo',
      'en': '',
      'es': '',
    },
    'hqjbyor6': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'h5tb35eh': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'teljshay': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '7bra3rc9': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'hr8zuwk7': {
      'pt': 'Arrecadar alimentos',
      'en': '',
      'es': '',
    },
    'qu7ivpgz': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'i4o6xbs2': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'v5gszxod': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '8ll2uk72': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'bt4cwfjl': {
      'pt': 'Limpar a praça',
      'en': '',
      'es': '',
    },
    '1hqqvfvz': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'v7qorjvp': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    '6nycxvo6': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '8c5dv0z5': {
      'pt': 'Confirmar seleção',
      'en': '',
      'es': '',
    },
    'hbxljbpt': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // EscolherColaboradores
  {
    'kqp7fi7k': {
      'pt': 'Colaboradores',
      'en': '',
      'es': '',
    },
    'qgshkdcc': {
      'pt': 'Escolha os colaboradores:',
      'en': '',
      'es': '',
    },
    'ztwphfxi': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'gvn163a1': {
      'pt': 'Luis Fernando',
      'en': '',
      'es': '',
    },
    '7gbj561m': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'rqdxo3og': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'wmq3t867': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    't86fbeei': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '9595xr70': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'l1swj450': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '3383evrm': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'pscsxvmz': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'ids6wjnn': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '4deflznr': {
      'pt': 'Clarice Lispector',
      'en': '',
      'es': '',
    },
    '6dxukj3l': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '4axu4uzg': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'jrtm7pwd': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'm6apn76f': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'indbb0q4': {
      'pt': 'Graciliano Ramos',
      'en': '',
      'es': '',
    },
    'rxdb247r': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '04wx2tgv': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    '5o4q53vv': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '6dv75jte': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '67ebf7v3': {
      'pt': 'Guimarães Rosa',
      'en': '',
      'es': '',
    },
    'sr2uwwfc': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'v8ht9859': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'xq1k8v6u': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'yneo2vu8': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'q06y5lyn': {
      'pt': 'Jorge Amado',
      'en': '',
      'es': '',
    },
    'q3coaqfk': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'vsm70lr0': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'r8i88pyu': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'kqkl0ohb': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'zj9q7kgf': {
      'pt': 'Monteiro Lobato',
      'en': '',
      'es': '',
    },
    'hpnsd60c': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'h7uoc3ym': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'c68u8zcl': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'aa5q4sch': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'r4pk7sh2': {
      'pt': 'Cecília Meireles',
      'en': '',
      'es': '',
    },
    'pccmc030': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    't8dw5sa2': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    '6grfitr4': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'z1pi11x9': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'jw8kqfae': {
      'pt': 'Érico Veríssimo',
      'en': '',
      'es': '',
    },
    '2a4gnpgb': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'ofxl53qr': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'isjz1ufw': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'ljvvnb1a': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'ky9sz4q4': {
      'pt': 'Manuel Bandeira',
      'en': '',
      'es': '',
    },
    'p1n08t94': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '6bob931q': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'mc5q6br2': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '3a1k8eax': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'o6hgmo9h': {
      'pt': 'Machado de Assis',
      'en': '',
      'es': '',
    },
    '592lek4u': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '29kvcza4': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'kh4juqsm': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'v3tv5354': {
      'pt': 'Confirmar seleção',
      'en': '',
      'es': '',
    },
    'apf5fof0': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // AvisoNotificacaoEnviada
  {
    'zx4chlyq': {
      'pt': 'Notificação enviada com sucesso!',
      'en': '',
      'es': '',
    },
    'fyy2zbgb': {
      'pt': 'OK',
      'en': '',
      'es': '',
    },
    'nhf569wa': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // MinhasNotificacoes
  {
    '1q6ittmi': {
      'pt': 'Notificações',
      'en': '',
      'es': '',
    },
    'chfhfym5': {
      'pt': 'Leia e exclua as notificações recebidas:',
      'en': '',
      'es': '',
    },
    'bqc4d6hh': {
      'pt': 'Luis Fernando: ',
      'en': '',
      'es': '',
    },
    'ost4yqyr': {
      'pt': 'Alteração do local da atividade. ',
      'en': '',
      'es': '',
    },
    'exnki5r6': {
      'pt':
          'Gostaríamos de informar que houve uma mudança no local da atividade que estava agendada anteriormente para [Data] às [Horário]. Devido a circunstâncias imprevistas, a atividade agora será realizada em um novo local.\nNovo Local: [Localização][Endereço][Cidade, Estado]\nPedimos desculpas por qualquer inconveniente que essa mudança possa causar. Estamos comprometidos em garantir que você tenha uma experiência suave e proveitosa durante a atividade.\n\nSe tiver alguma dúvida ou precisar de mais informações, não hesite em nos contatar pelo telefone [Número de Contato] ou por e-mail em [Endereço de E-mail].',
      'en': '',
      'es': '',
    },
    '690b6gmz': {
      'pt': 'Luis Fernando: ',
      'en': '',
      'es': '',
    },
    '05tsfo58': {
      'pt': 'Alteração do local da atividade. ',
      'en': '',
      'es': '',
    },
    'q9i6gd9n': {
      'pt':
          'Gostaríamos de informar que houve uma mudança no local da atividade que estava agendada anteriormente para [Data] às [Horário]. Devido a circunstâncias imprevistas, a atividade agora será realizada em um novo local.\nNovo Local: [Localização][Endereço][Cidade, Estado]\nPedimos desculpas por qualquer inconveniente que essa mudança possa causar. Estamos comprometidos em garantir que você tenha uma experiência suave e proveitosa durante a atividade.\n\nSe tiver alguma dúvida ou precisar de mais informações, não hesite em nos contatar pelo telefone [Número de Contato] ou por e-mail em [Endereço de E-mail].',
      'en': '',
      'es': '',
    },
    'zmgvt9qj': {
      'pt': 'Luis Fernando: ',
      'en': '',
      'es': '',
    },
    'kj7ew6nb': {
      'pt': 'Alteração do local da atividade. ',
      'en': '',
      'es': '',
    },
    'vju4xz7y': {
      'pt':
          'Gostaríamos de informar que houve uma mudança no local da atividade que estava agendada anteriormente para [Data] às [Horário]. Devido a circunstâncias imprevistas, a atividade agora será realizada em um novo local.\nNovo Local: [Localização][Endereço][Cidade, Estado]\nPedimos desculpas por qualquer inconveniente que essa mudança possa causar. Estamos comprometidos em garantir que você tenha uma experiência suave e proveitosa durante a atividade.\n\nSe tiver alguma dúvida ou precisar de mais informações, não hesite em nos contatar pelo telefone [Número de Contato] ou por e-mail em [Endereço de E-mail].',
      'en': '',
      'es': '',
    },
    'srpaqi4x': {
      'pt': 'Luis Fernando: ',
      'en': '',
      'es': '',
    },
    '1op0hcqw': {
      'pt': 'Alteração do local da atividade. ',
      'en': '',
      'es': '',
    },
    'sy7lj1ym': {
      'pt':
          'Gostaríamos de informar que houve uma mudança no local da atividade que estava agendada anteriormente para [Data] às [Horário]. Devido a circunstâncias imprevistas, a atividade agora será realizada em um novo local.\nNovo Local: [Localização][Endereço][Cidade, Estado]\nPedimos desculpas por qualquer inconveniente que essa mudança possa causar. Estamos comprometidos em garantir que você tenha uma experiência suave e proveitosa durante a atividade.\n\nSe tiver alguma dúvida ou precisar de mais informações, não hesite em nos contatar pelo telefone [Número de Contato] ou por e-mail em [Endereço de E-mail].',
      'en': '',
      'es': '',
    },
    'fg98nomn': {
      'pt': 'Luis Fernando: ',
      'en': '',
      'es': '',
    },
    'p8lf9jys': {
      'pt': 'Alteração do local da atividade. ',
      'en': '',
      'es': '',
    },
    'xxefxju4': {
      'pt':
          'Gostaríamos de informar que houve uma mudança no local da atividade que estava agendada anteriormente para [Data] às [Horário]. Devido a circunstâncias imprevistas, a atividade agora será realizada em um novo local.\nNovo Local: [Localização][Endereço][Cidade, Estado]\nPedimos desculpas por qualquer inconveniente que essa mudança possa causar. Estamos comprometidos em garantir que você tenha uma experiência suave e proveitosa durante a atividade.\n\nSe tiver alguma dúvida ou precisar de mais informações, não hesite em nos contatar pelo telefone [Número de Contato] ou por e-mail em [Endereço de E-mail].',
      'en': '',
      'es': '',
    },
    'wlpx2b3k': {
      'pt': 'Limpar notificações',
      'en': '',
      'es': '',
    },
    'qk8wqutj': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // AvisoNotificacaoApagada
  {
    'vnxdb79v': {
      'pt': 'Notificações apagadas com sucesso!',
      'en': '',
      'es': '',
    },
    'ucbyyxjm': {
      'pt': 'OK',
      'en': '',
      'es': '',
    },
    '3n5luph4': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // RelatorioAtividade
  {
    'a20twt1b': {
      'pt': 'Relatório da \nAtividade',
      'en': '',
      'es': '',
    },
    'xs8sicez': {
      'pt': 'Escolha uma atividade',
      'en': '',
      'es': '',
    },
    '81fullwj': {
      'pt': 'Digite um nome para a atividade ...',
      'en': '',
      'es': '',
    },
    'agfnrmmh': {
      'pt': 'Aula do CETAP',
      'en': '',
      'es': '',
    },
    'jz35j0w8': {
      'pt': 'Nome: ',
      'en': '',
      'es': '',
    },
    'dtbd8mm7': {
      'pt': 'Aula do CETAP',
      'en': '',
      'es': '',
    },
    'xjqq51ks': {
      'pt': 'Responsável: ',
      'en': '',
      'es': '',
    },
    'fwrkko4f': {
      'pt': 'Pastor Ronaldo',
      'en': '',
      'es': '',
    },
    'fv1uffqi': {
      'pt': 'Area de atuação: ',
      'en': '',
      'es': '',
    },
    'rd49qwa6': {
      'pt': 'Educação',
      'en': '',
      'es': '',
    },
    'krtjnplv': {
      'pt': 'Data inicio: ',
      'en': '',
      'es': '',
    },
    'tg5rkmh0': {
      'pt': '26/10/2024 14:00 h',
      'en': '',
      'es': '',
    },
    '6lo037uz': {
      'pt': 'Data de conclusão: ',
      'en': '',
      'es': '',
    },
    'cwh9n8w2': {
      'pt': '27/10/2024 15:00 h',
      'en': '',
      'es': '',
    },
    '5o02rp9h': {
      'pt': 'Equipe',
      'en': '',
      'es': '',
    },
    'a65xwvxk': {
      'pt': 'M. Ensino',
      'en': '',
      'es': '',
    },
    'xj5talto': {
      'pt': 'Participantes',
      'en': '',
      'es': '',
    },
    '3n72xbcb': {
      'pt': '65',
      'en': '',
      'es': '',
    },
    'i7n4gq3l': {
      'pt': 'Hora Voluntária',
      'en': '',
      'es': '',
    },
    '3xl240qz': {
      'pt': '3 h',
      'en': '',
      'es': '',
    },
    'lmdmr736': {
      'pt': 'Valor investido',
      'en': '',
      'es': '',
    },
    'bh6yi3vl': {
      'pt': 'R\$ 100,00',
      'en': '',
      'es': '',
    },
    'sr6am4sv': {
      'pt': 'Requisitos da atividade:',
      'en': '',
      'es': '',
    },
    '6lx2zbx6': {
      'pt': 'Informações sobre o projeto',
      'en': '',
      'es': '',
    },
    'm5otu7c9': {
      'pt': 'Informações sobre o projeto',
      'en': '',
      'es': '',
    },
    'ny90ni9g': {
      'pt': 'Orientação sobre priemiros socorros',
      'en': '',
      'es': '',
    },
    'lx84md3k': {
      'pt': 'Orientação sobre priemiros socorros',
      'en': '',
      'es': '',
    },
    'p0c77ii7': {
      'pt': 'Lista de participação',
      'en': '',
      'es': '',
    },
    'pi3gi21m': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // GerenciarCurso
  {
    '62o2xoj4': {
      'pt': 'Treinamento',
      'en': '',
      'es': '',
    },
    'tz2sthhj': {
      'pt': 'O que deseja fazer ',
      'en': '',
      'es': '',
    },
    '7cwjgyeu': {
      'pt': 'Criar',
      'en': '',
      'es': '',
    },
    'yeczael5': {
      'pt': 'Criar',
      'en': '',
      'es': '',
    },
    'n8pny22l': {
      'pt': 'Editar',
      'en': '',
      'es': '',
    },
    '68ul76bt': {
      'pt': 'Nome do treinamento',
      'en': '',
      'es': '',
    },
    'r4gm332j': {
      'pt': 'Digite um nome para o treinamento ...',
      'en': '',
      'es': '',
    },
    'mcufq42l': {
      'pt': 'Responsavel pelo treinamento',
      'en': '',
      'es': '',
    },
    'dcuyt8tl': {
      'pt': 'Lider responsavel pelo treinamento...',
      'en': '',
      'es': '',
    },
    '7be8d3lp': {
      'pt': 'Descrição',
      'en': '',
      'es': '',
    },
    'tjeuived': {
      'pt': 'Digite uma breve descrição ...',
      'en': '',
      'es': '',
    },
    'h5cu3niu': {
      'pt': 'Incluir Materiais',
      'en': '',
      'es': '',
    },
    '6r86mw1p': {
      'pt': 'Criar treinamento',
      'en': '',
      'es': '',
    },
    'gh9ifd32': {
      'pt': 'Treinamento',
      'en': '',
      'es': '',
    },
    'lkesgvxk': {
      'pt': 'Escolha um treinamento ...',
      'en': '',
      'es': '',
    },
    '1q9onde8': {
      'pt': 'Nome do treinamento',
      'en': '',
      'es': '',
    },
    'w43nfdso': {
      'pt': 'Digite um nome para o treinamento ...',
      'en': '',
      'es': '',
    },
    'uaakm5zb': {
      'pt': 'Responsavel pelo treinamento',
      'en': '',
      'es': '',
    },
    '07a3qaqa': {
      'pt': 'Lider responsavel pelo treinamento...',
      'en': '',
      'es': '',
    },
    'jk7j16w2': {
      'pt': 'Descrição',
      'en': '',
      'es': '',
    },
    'y71no9zr': {
      'pt': 'Digite uma breve descrição ...',
      'en': '',
      'es': '',
    },
    'jn6n341q': {
      'pt': 'Incluir Materiais',
      'en': '',
      'es': '',
    },
    'zgc9w4f3': {
      'pt': 'Editar treinamento',
      'en': '',
      'es': '',
    },
    'mvekd4ke': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // AgendarEncontroPresencial
  {
    '61axf07u': {
      'pt': 'Agendamento do\nTreinamento',
      'en': '',
      'es': '',
    },
    'vtvyyjmp': {
      'pt': 'Nome do Treinamento',
      'en': '',
      'es': '',
    },
    'ayslr0pm': {
      'pt': 'Escolha um treinamento ...',
      'en': '',
      'es': '',
    },
    's92bksk4': {
      'pt': 'Responsavel pelo treinamento',
      'en': '',
      'es': '',
    },
    'l3rkp5cx': {
      'pt': 'Escolha o responsavel pelo treinamento ...',
      'en': '',
      'es': '',
    },
    'za3fze40': {
      'pt': 'Local da realização',
      'en': '',
      'es': '',
    },
    '1u86mdph': {
      'pt': 'Digite o link ou endereço  ...',
      'en': '',
      'es': '',
    },
    'o8ez49m9': {
      'pt': 'Data de inicio:',
      'en': '',
      'es': '',
    },
    'y4d8f1hw': {
      'pt': 'Calendario',
      'en': '',
      'es': '',
    },
    'wmb6aq5y': {
      'pt': 'DD/MM/AAAA\n',
      'en': '',
      'es': '',
    },
    'o0swica9': {
      'pt': 'HH:MM',
      'en': '',
      'es': '',
    },
    'q47pag9n': {
      'pt': 'Data de termino:',
      'en': '',
      'es': '',
    },
    'bp3wkqjg': {
      'pt': 'Calendario',
      'en': '',
      'es': '',
    },
    'gc62m35g': {
      'pt': 'DD/MM/AAAA\n',
      'en': '',
      'es': '',
    },
    'qkz9vcma': {
      'pt': 'HH:MM',
      'en': '',
      'es': '',
    },
    'r9tfcuhb': {
      'pt': 'Salvar',
      'en': '',
      'es': '',
    },
    'x3x1p8pg': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // GerenciarMaterial
  {
    'szpus8jv': {
      'pt': 'Material para treinamento',
      'en': '',
      'es': '',
    },
    'nabr90p0': {
      'pt': 'O que deseja fazer ',
      'en': '',
      'es': '',
    },
    '559dwysq': {
      'pt': 'Criar',
      'en': '',
      'es': '',
    },
    'v8vmd5yw': {
      'pt': 'Criar',
      'en': '',
      'es': '',
    },
    'lok0q4bf': {
      'pt': 'Editar',
      'en': '',
      'es': '',
    },
    'fozwr6gi': {
      'pt': 'Identificação do material',
      'en': '',
      'es': '',
    },
    'tkr6w7vk': {
      'pt': 'Digite um nome para o material ...',
      'en': '',
      'es': '',
    },
    'q70jc7bo': {
      'pt': 'Autor do material',
      'en': '',
      'es': '',
    },
    '3m64jy8p': {
      'pt': 'Nome do criador do conteudo ...',
      'en': '',
      'es': '',
    },
    '6oxu63s5': {
      'pt': 'Qual o tipo do material? ',
      'en': '',
      'es': '',
    },
    '9eaex9j1': {
      'pt': 'Apostila em PDF',
      'en': '',
      'es': '',
    },
    'u1wrnrq2': {
      'pt': 'Aula em video ',
      'en': '',
      'es': '',
    },
    'ge6pnn4o': {
      'pt': 'Apresentações de slides',
      'en': '',
      'es': '',
    },
    'z9osqzts': {
      'pt': 'Recursos de áudio',
      'en': '',
      'es': '',
    },
    'bxewhntz': {
      'pt': 'Download do material',
      'en': '',
      'es': '',
    },
    'h6t4eh1u': {
      'pt': 'Qual o criterio de avaliação? ',
      'en': '',
      'es': '',
    },
    'dum8tmo7': {
      'pt': 'Assistir ao conteudo',
      'en': '',
      'es': '',
    },
    'h70cgl35': {
      'pt': 'Questionario',
      'en': '',
      'es': '',
    },
    'ih0vr9nq': {
      'pt': 'Escrever resumo',
      'en': '',
      'es': '',
    },
    'eaudh2hl': {
      'pt': 'Assinar termo de conhecimento',
      'en': '',
      'es': '',
    },
    '8sp4boh2': {
      'pt': 'Download da avaliação\n (opcional)',
      'en': '',
      'es': '',
    },
    'o0t1kdqw': {
      'pt': 'Qual o tipo do material? ',
      'en': '',
      'es': '',
    },
    'tytk74ms': {
      'pt': 'Apostila em PDF',
      'en': '',
      'es': '',
    },
    'gb2uaoh3': {
      'pt': 'Aula em video ',
      'en': '',
      'es': '',
    },
    '3m1g8aif': {
      'pt': 'Apresentações de slides',
      'en': '',
      'es': '',
    },
    'xsd3xf40': {
      'pt': 'Recursos de áudio',
      'en': '',
      'es': '',
    },
    '6arexm6f': {
      'pt': 'Download do material',
      'en': '',
      'es': '',
    },
    '6wj4ilww': {
      'pt': 'Qual o criterio de avaliação? ',
      'en': '',
      'es': '',
    },
    'zmw596c8': {
      'pt': 'Assistir ao conteudo',
      'en': '',
      'es': '',
    },
    'nv8u6rtw': {
      'pt': 'Questionario',
      'en': '',
      'es': '',
    },
    '4etzydxv': {
      'pt': 'Escrever resumo',
      'en': '',
      'es': '',
    },
    'tihhdw9u': {
      'pt': 'Assinar termo de conhecimento',
      'en': '',
      'es': '',
    },
    '39dtgkxd': {
      'pt': 'Download da avaliação\n (opcional)',
      'en': '',
      'es': '',
    },
    'll7uthpt': {
      'pt': 'Incluir Material',
      'en': '',
      'es': '',
    },
    'hhsqibrs': {
      'pt': 'Material para Treinamento',
      'en': '',
      'es': '',
    },
    'hy5ndvt0': {
      'pt': 'Escolha um material...',
      'en': '',
      'es': '',
    },
    'b2k8no2r': {
      'pt': 'Identificação do material',
      'en': '',
      'es': '',
    },
    'qlcs043g': {
      'pt': 'Digite um nome para o material ...',
      'en': '',
      'es': '',
    },
    'uyd1cbfd': {
      'pt': 'Autor do material',
      'en': '',
      'es': '',
    },
    'qtpobi92': {
      'pt': 'Nome do criador do conteudo ...',
      'en': '',
      'es': '',
    },
    'zqre3yz6': {
      'pt': 'Qual o tipo do material? ',
      'en': '',
      'es': '',
    },
    'w2lch25t': {
      'pt': 'Apostila em PDF',
      'en': '',
      'es': '',
    },
    'vas7gowc': {
      'pt': 'Aula em video ',
      'en': '',
      'es': '',
    },
    'g4swtcoy': {
      'pt': 'Apresentações de slides',
      'en': '',
      'es': '',
    },
    'kiapjlg6': {
      'pt': 'Recursos de áudio',
      'en': '',
      'es': '',
    },
    '1ljrz4rb': {
      'pt': 'Download do material',
      'en': '',
      'es': '',
    },
    'rfkui0t7': {
      'pt': 'Qual o criterio de avaliação? ',
      'en': '',
      'es': '',
    },
    'kz0psqmy': {
      'pt': 'Assistir ao conteudo',
      'en': '',
      'es': '',
    },
    'nmx9x0a8': {
      'pt': 'Questionario',
      'en': '',
      'es': '',
    },
    'm5zsfm2p': {
      'pt': 'Escrever resumo',
      'en': '',
      'es': '',
    },
    'x98z2afc': {
      'pt': 'Assinar termo de conhecimento',
      'en': '',
      'es': '',
    },
    'o3jh5q6m': {
      'pt': 'Download da avaliação\n (opcional)',
      'en': '',
      'es': '',
    },
    'xkldbw6f': {
      'pt': 'Qual o tipo do material? ',
      'en': '',
      'es': '',
    },
    'pupxwhk6': {
      'pt': 'Apostila em PDF',
      'en': '',
      'es': '',
    },
    'n8bs4c7f': {
      'pt': 'Aula em video ',
      'en': '',
      'es': '',
    },
    'inmsomqi': {
      'pt': 'Apresentações de slides',
      'en': '',
      'es': '',
    },
    'frl0mxpu': {
      'pt': 'Recursos de áudio',
      'en': '',
      'es': '',
    },
    'zps4iey5': {
      'pt': 'Download do material',
      'en': '',
      'es': '',
    },
    'l9bivccx': {
      'pt': 'Qual o criterio de avaliação? ',
      'en': '',
      'es': '',
    },
    'sqtqun4l': {
      'pt': 'Assistir ao conteudo',
      'en': '',
      'es': '',
    },
    'xz30zzng': {
      'pt': 'Questionario',
      'en': '',
      'es': '',
    },
    'rs3bypl7': {
      'pt': 'Escrever resumo',
      'en': '',
      'es': '',
    },
    'ax41u2gz': {
      'pt': 'Assinar termo de conhecimento',
      'en': '',
      'es': '',
    },
    'kvllxogd': {
      'pt': 'Download da avaliação\n (opcional)',
      'en': '',
      'es': '',
    },
    'wflnqv6g': {
      'pt': 'Incluir Material',
      'en': '',
      'es': '',
    },
    'b1fep4j1': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // GerenciarEquipe
  {
    'maz7esgx': {
      'pt': 'Equipe',
      'en': '',
      'es': '',
    },
    'bsbiikon': {
      'pt': 'Lideres do projeto',
      'en': '',
      'es': '',
    },
    'ej56tcp7': {
      'pt': 'UserName',
      'en': '',
      'es': '',
    },
    '6s2ownm2': {
      'pt': 'Remove',
      'en': '',
      'es': '',
    },
    'k1e5mgom': {
      'pt': 'UserName',
      'en': '',
      'es': '',
    },
    '08h0el4p': {
      'pt': 'Remove',
      'en': '',
      'es': '',
    },
    't89m4dud': {
      'pt': 'UserName',
      'en': '',
      'es': '',
    },
    'gdwwf33z': {
      'pt': 'Remove',
      'en': '',
      'es': '',
    },
    'vnmqjl5k': {
      'pt': 'Membros da Equipe',
      'en': '',
      'es': '',
    },
    'la7c9s1k': {
      'pt': 'Username',
      'en': '',
      'es': '',
    },
    '4sq1az4y': {
      'pt': 'user@domainname.com',
      'en': '',
      'es': '',
    },
    'haeei7cc': {
      'pt': 'Aceitar',
      'en': '',
      'es': '',
    },
    '2425nztm': {
      'pt': 'Excluir',
      'en': '',
      'es': '',
    },
    '01nk1g0f': {
      'pt': 'Username',
      'en': '',
      'es': '',
    },
    '1yvbgwjc': {
      'pt': 'user@domainname.com',
      'en': '',
      'es': '',
    },
    'il6f0qc9': {
      'pt': 'Aceitar',
      'en': '',
      'es': '',
    },
    'uc2es9km': {
      'pt': 'Excluir',
      'en': '',
      'es': '',
    },
    'mjiu0es4': {
      'pt': 'Username',
      'en': '',
      'es': '',
    },
    'vwx5ax8p': {
      'pt': 'user@domainname.com',
      'en': '',
      'es': '',
    },
    'etk2av9l': {
      'pt': 'Aceitar',
      'en': '',
      'es': '',
    },
    'w5su7iiq': {
      'pt': 'Excluir',
      'en': '',
      'es': '',
    },
    'qjse74ia': {
      'pt': 'Username',
      'en': '',
      'es': '',
    },
    'ya26ag7b': {
      'pt': 'user@domainname.com',
      'en': '',
      'es': '',
    },
    'k6b30o1b': {
      'pt': 'Aceitar',
      'en': '',
      'es': '',
    },
    'ayv0t3b7': {
      'pt': 'Excluir',
      'en': '',
      'es': '',
    },
    'b3qdalur': {
      'pt': 'Username',
      'en': '',
      'es': '',
    },
    '1kezsvg1': {
      'pt': 'user@domainname.com',
      'en': '',
      'es': '',
    },
    'l1uhcgr4': {
      'pt': 'Aceitar',
      'en': '',
      'es': '',
    },
    'yt4a741s': {
      'pt': 'Excluir',
      'en': '',
      'es': '',
    },
    'xwk0cvw6': {
      'pt': 'Username',
      'en': '',
      'es': '',
    },
    'muzrmsga': {
      'pt': 'user@domainname.com',
      'en': '',
      'es': '',
    },
    '3gz66xzw': {
      'pt': 'Aceitar',
      'en': '',
      'es': '',
    },
    'n4fq2sb3': {
      'pt': 'Excluir',
      'en': '',
      'es': '',
    },
    'jj1qbxmw': {
      'pt': 'Username',
      'en': '',
      'es': '',
    },
    '964ldv5w': {
      'pt': 'user@domainname.com',
      'en': '',
      'es': '',
    },
    'z3df620l': {
      'pt': 'Aceitar',
      'en': '',
      'es': '',
    },
    'lj9yrjt6': {
      'pt': 'Excluir',
      'en': '',
      'es': '',
    },
    '54f4qvzc': {
      'pt': 'Username',
      'en': '',
      'es': '',
    },
    'od82ygzm': {
      'pt': 'user@domainname.com',
      'en': '',
      'es': '',
    },
    'q3c2d4v9': {
      'pt': 'Aceitar',
      'en': '',
      'es': '',
    },
    '882q0rz9': {
      'pt': 'Excluir',
      'en': '',
      'es': '',
    },
    'vg1ld0i8': {
      'pt': 'Username',
      'en': '',
      'es': '',
    },
    '4j9nelv8': {
      'pt': 'user@domainname.com',
      'en': '',
      'es': '',
    },
    '27wje0j8': {
      'pt': 'Aceitar',
      'en': '',
      'es': '',
    },
    't2jmfkw8': {
      'pt': 'Excluir',
      'en': '',
      'es': '',
    },
    '90zrek7p': {
      'pt': 'Username',
      'en': '',
      'es': '',
    },
    'si5s5ouh': {
      'pt': 'user@domainname.com',
      'en': '',
      'es': '',
    },
    '0do5lu67': {
      'pt': 'Aceitar',
      'en': '',
      'es': '',
    },
    '0sb83n3n': {
      'pt': 'Excluir',
      'en': '',
      'es': '',
    },
    'dhwbzdor': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // ListaParticipantes
  {
    'lxeoc9do': {
      'pt': 'Lista de Participação',
      'en': '',
      'es': '',
    },
    'w9knhtko': {
      'pt': 'Confirme a participação:',
      'en': '',
      'es': '',
    },
    '9y1kv7wy': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    's8py71qf': {
      'pt': 'Luis Fernando',
      'en': '',
      'es': '',
    },
    '0u0vcykt': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'yofd5hed': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'f47mluvh': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '0bfqts0j': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '8tqq6qx9': {
      'pt': 'Clarice Lispector',
      'en': '',
      'es': '',
    },
    '261ptcz8': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'jr5bu9jh': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'b4ye32nv': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'x9sotr1y': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '4e9la1zw': {
      'pt': 'Graciliano Ramos',
      'en': '',
      'es': '',
    },
    'fe6w8xux': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'aqt7wn4e': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'evm1u47y': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'vbr6jdom': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'pcwok4e8': {
      'pt': 'Guimarães Rosa',
      'en': '',
      'es': '',
    },
    '9yps85ib': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'fy7s4h5y': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'uqwxp9v2': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'ig2w0n3o': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '9ula4byz': {
      'pt': 'Jorge Amado',
      'en': '',
      'es': '',
    },
    '664qrkxc': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'rmexz4ly': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    '0zivbc2q': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'z75xgmqs': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'xothdfi1': {
      'pt': 'Monteiro Lobato',
      'en': '',
      'es': '',
    },
    'bsq2xcf5': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'm4qxahee': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'nt8nwyom': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'rasudnf9': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '2yj2tkmi': {
      'pt': 'Cecília Meireles',
      'en': '',
      'es': '',
    },
    '8k9ac1gg': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '88x4y4pk': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'y6qf5flo': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '8irudumt': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '4lav5nju': {
      'pt': 'Érico Veríssimo',
      'en': '',
      'es': '',
    },
    'pjgp9inq': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'ia4yxlfc': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'lmcebr7c': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'hi247vxu': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'uqdlpz8l': {
      'pt': 'Manuel Bandeira',
      'en': '',
      'es': '',
    },
    '7qopgl2v': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'gdx2xu7k': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    '1n0cv6bw': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'ior0rnce': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'xp735y3g': {
      'pt': 'Machado de Assis',
      'en': '',
      'es': '',
    },
    'i1sttq5m': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'dllpse68': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    '6zved0cy': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'sdpa9hiq': {
      'pt': 'Confirmar',
      'en': '',
      'es': '',
    },
    'upl690ld': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // RelatorioProjeto
  {
    'w46pt2r3': {
      'pt': 'Relatório do Projeto',
      'en': '',
      'es': '',
    },
    'mtv1fydx': {
      'pt': 'Escolha uma projeto',
      'en': '',
      'es': '',
    },
    's3loea9v': {
      'pt': 'Digite o nome do projeto ...',
      'en': '',
      'es': '',
    },
    '1pms58az': {
      'pt': 'Academia na praça',
      'en': '',
      'es': '',
    },
    '04jxdmpc': {
      'pt': 'Responsável: ',
      'en': '',
      'es': '',
    },
    'vphewn95': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'uf1mjqnz': {
      'pt': 'Area de atuação: ',
      'en': '',
      'es': '',
    },
    'easxc2np': {
      'pt': 'Saúde',
      'en': '',
      'es': '',
    },
    'ma29nr3c': {
      'pt': 'Data inicio: ',
      'en': '',
      'es': '',
    },
    'wn6v40tt': {
      'pt': '01/03/2024 15:00 h',
      'en': '',
      'es': '',
    },
    't5dnm1an': {
      'pt': 'Status: ',
      'en': '',
      'es': '',
    },
    '4qn33pxq': {
      'pt': 'Ativo',
      'en': '',
      'es': '',
    },
    '2yuy29ki': {
      'pt': 'Resumo das atividades',
      'en': '',
      'es': '',
    },
    'zq32xwth': {
      'pt': 'Agendadas',
      'en': '',
      'es': '',
    },
    'a3h1o8ci': {
      'pt': '12',
      'en': '',
      'es': '',
    },
    'b0ek9sa9': {
      'pt': 'Executando',
      'en': '',
      'es': '',
    },
    '7y319o27': {
      'pt': '12',
      'en': '',
      'es': '',
    },
    'lsmwm7bw': {
      'pt': 'Concluidas',
      'en': '',
      'es': '',
    },
    '7xlvc8z1': {
      'pt': '12',
      'en': '',
      'es': '',
    },
    'xkjb3n2o': {
      'pt': 'Participantes',
      'en': '',
      'es': '',
    },
    'tz0k3y2y': {
      'pt': '65',
      'en': '',
      'es': '',
    },
    'atv7wrpt': {
      'pt': 'Hora Voluntária',
      'en': '',
      'es': '',
    },
    '5ys4k2qo': {
      'pt': '3 h',
      'en': '',
      'es': '',
    },
    'ncysk58p': {
      'pt': 'Relatório por atividade',
      'en': '',
      'es': '',
    },
    'y5ce3vq1': {
      'pt': 'Resumo das finanças',
      'en': '',
      'es': '',
    },
    'tospwjuw': {
      'pt': 'Valor arrecadado',
      'en': '',
      'es': '',
    },
    'm4gmoa9j': {
      'pt': 'R\$ 150,00',
      'en': '',
      'es': '',
    },
    'lfyz38xt': {
      'pt': 'Valor investido',
      'en': '',
      'es': '',
    },
    'cpuhmgdu': {
      'pt': 'R\$ 150,00',
      'en': '',
      'es': '',
    },
    'hr9ebn2z': {
      'pt': 'Saldo financeiro',
      'en': '',
      'es': '',
    },
    'lxhtklya': {
      'pt': 'R\$ 150,00',
      'en': '',
      'es': '',
    },
    'pl38ygtc': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // ListarEquipe
  {
    'o9rjjniw': {
      'pt': 'Projetos',
      'en': '',
      'es': '',
    },
    't4vh4q9e': {
      'pt': 'Escolha os projetos:',
      'en': '',
      'es': '',
    },
    'dj04b0fw': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'ixbjrbq3': {
      'pt': 'Academia na praça',
      'en': '',
      'es': '',
    },
    'n2u5leqr': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'w0dvy9wm': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    's81tbmy2': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'cuqwmep6': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'i38q7xjf': {
      'pt': 'Preparação para o ENEM',
      'en': '',
      'es': '',
    },
    'gb0z0js6': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '050mm5ym': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'phcscsrz': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'l3h1s0ow': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'qz9c4kke': {
      'pt': 'Escola Biblica de ferias',
      'en': '',
      'es': '',
    },
    'e6w40rsj': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'yxyxsflb': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    '27y5fln6': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'zob5apjk': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '3tbfxnf0': {
      'pt': 'Coral da terceira idade',
      'en': '',
      'es': '',
    },
    'ts9izsuw': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'i8vn4pme': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'b9lquts5': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'bi3ze1mi': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '6spiwvta': {
      'pt': 'Doação de roupas usadas',
      'en': '',
      'es': '',
    },
    'xqtwlbrv': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'd4ts0qeg': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'ielf435b': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'p3acycw5': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'znicvp00': {
      'pt': 'Clube de leitura',
      'en': '',
      'es': '',
    },
    'bqldt2gt': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'd13efc82': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'bthixocn': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'a9xark6z': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'depp2k0l': {
      'pt': 'Sopão da solidariedade',
      'en': '',
      'es': '',
    },
    'jqmh2xph': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'my11k5at': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'spj4t1iw': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    '66sn679f': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '67vm3br7': {
      'pt': 'Doação de cestas basicas',
      'en': '',
      'es': '',
    },
    'sw3fbuck': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    's9q3icbl': {
      'pt': 'S',
      'en': '',
      'es': '',
    },
    'vznpa2xd': {
      'pt': 'N',
      'en': '',
      'es': '',
    },
    'nzep2m6q': {
      'pt': 'Confirmar seleção',
      'en': '',
      'es': '',
    },
    '3zw256kx': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // NomearLideres
  {
    'xnfk76ly': {
      'pt': 'Lideres',
      'en': '',
      'es': '',
    },
    'q5p9scin': {
      'pt': 'Marque e confirme a nomeação:',
      'en': '',
      'es': '',
    },
    'xm73w11k': {
      'pt': 'Buscar participantes',
      'en': '',
      'es': '',
    },
    'l7k19i1b': {
      'pt': 'Digite o nome do colaborador ...',
      'en': '',
      'es': '',
    },
    '1h0yowhu': {
      'pt': 'Friend Name',
      'en': '',
      'es': '',
    },
    'joqr2271': {
      'pt': 'City, State',
      'en': '',
      'es': '',
    },
    'mk6dflkv': {
      'pt': 'Friend Name',
      'en': '',
      'es': '',
    },
    '99i8gej1': {
      'pt': 'City, State',
      'en': '',
      'es': '',
    },
    'ucw4q3l4': {
      'pt': 'Friend Name',
      'en': '',
      'es': '',
    },
    'f2wx4wzx': {
      'pt': 'City, State',
      'en': '',
      'es': '',
    },
    'gxysajrl': {
      'pt': 'Friend Name',
      'en': '',
      'es': '',
    },
    'er5f8ju2': {
      'pt': 'City, State',
      'en': '',
      'es': '',
    },
    '348sf5fb': {
      'pt': 'Friend Name',
      'en': '',
      'es': '',
    },
    '25ntsgkf': {
      'pt': 'City, State',
      'en': '',
      'es': '',
    },
    'k5tq7vyl': {
      'pt': 'Friend Name',
      'en': '',
      'es': '',
    },
    '7yx0ugsd': {
      'pt': 'City, State',
      'en': '',
      'es': '',
    },
    'we8wwr47': {
      'pt': 'Friend Name',
      'en': '',
      'es': '',
    },
    '4diyqwil': {
      'pt': 'City, State',
      'en': '',
      'es': '',
    },
    'plyxton6': {
      'pt': 'Friend Name',
      'en': '',
      'es': '',
    },
    'hkwyoomh': {
      'pt': 'City, State',
      'en': '',
      'es': '',
    },
    'l4j7oeng': {
      'pt': 'Friend Name',
      'en': '',
      'es': '',
    },
    'ljaet1ih': {
      'pt': 'City, State',
      'en': '',
      'es': '',
    },
    '5r0rnatf': {
      'pt': 'Friend Name',
      'en': '',
      'es': '',
    },
    'nze7gtst': {
      'pt': 'City, State',
      'en': '',
      'es': '',
    },
    '9x7ztugz': {
      'pt': 'Friend Name',
      'en': '',
      'es': '',
    },
    '5kksi9os': {
      'pt': 'City, State',
      'en': '',
      'es': '',
    },
    '2udieg6r': {
      'pt': 'Confirmar',
      'en': '',
      'es': '',
    },
    'edevewlg': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // AvisoDoacaoConfirmada
  {
    'q9or32tn': {
      'pt': 'Doação confirmada!\n\nAgardecemos sua colaboração.',
      'en': 'Donation confirmed!\n\nWe appreciate your collaboration.',
      'es': '',
    },
    '0cd67vg3': {
      'pt': 'OK',
      'en': 'OK',
      'es': 'DE ACUERDO',
    },
    'vc96etpk': {
      'pt': 'Pagina inicial',
      'en': 'Home Page',
      'es': '',
    },
  },
  // HomePioneiros
  {
    '4opu5om3': {
      'pt': 'Grupo \"OS PIONEIROS\"',
      'en': '',
      'es': '',
    },
    'h1mjzkgp': {
      'pt': 'MANUAL \nDOS\nPIONEIROS',
      'en': '',
      'es': '',
    },
    'uehzi64j': {
      'pt': 'NOTIFICAÇÕES',
      'en': '',
      'es': '',
    },
    'ajq2lmip': {
      'pt': 'CURSOS \nDE \nFORMAÇÃO',
      'en': '',
      'es': '',
    },
    '9sxeamh2': {
      'pt': 'RELATÓRIO\nPESSOAL',
      'en': '',
      'es': '',
    },
    'ba1g14rj': {
      'pt': 'AGENDA \nDE \nATIVIDADES',
      'en': '',
      'es': '',
    },
    'v670flvc': {
      'pt': 'OPÇÕES',
      'en': '',
      'es': '',
    },
    'z483dm5w': {
      'pt': 'Página inicial',
      'en': 'Home page',
      'es': 'Página de inicio',
    },
  },
  // ManualPioneiros
  {
    '7g1lqrz3': {
      'pt': 'Grupo \"OS PIONEIROS\"',
      'en': '',
      'es': '',
    },
    'foln2y4t': {
      'pt': 'Página inicial',
      'en': 'Home page',
      'es': 'Página de inicio',
    },
  },
  // CursosFormacao
  {
    'xh3yz3ac': {
      'pt': 'Grupo \"OS PIONEIROS\"',
      'en': '',
      'es': '',
    },
    'b2v05q4v': {
      'pt': 'Jornada de Formação',
      'en': '',
      'es': '',
    },
    'lgij4kze': {
      'pt': '21%',
      'en': '',
      'es': '',
    },
    'nztk5v5n': {
      'pt': 'Explorador (10 anos)',
      'en': '',
      'es': '',
    },
    'k2j7wir2': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'se482ntz': {
      'pt': 'Aventureiro (11 anos)',
      'en': '',
      'es': '',
    },
    'sqiucony': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'hw4zo5xx': {
      'pt': 'Discipulo (12 anos)',
      'en': '',
      'es': '',
    },
    'ql1fa122': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'k1ewdu2s': {
      'pt': '4',
      'en': '',
      'es': '',
    },
    '9p2xe2xu': {
      'pt': 'Aprendiz (13 anos)',
      'en': '',
      'es': '',
    },
    'gffu45kj': {
      'pt': 'Em andamento',
      'en': '',
      'es': '',
    },
    '30j887m3': {
      'pt': '5',
      'en': '',
      'es': '',
    },
    'kohodv3r': {
      'pt': 'Companheiro (14 anos)',
      'en': '',
      'es': '',
    },
    '6fk3ce8p': {
      'pt': 'Bloqueado',
      'en': '',
      'es': '',
    },
    'mev7dvh7': {
      'pt': '6',
      'en': '',
      'es': '',
    },
    '8ekngxad': {
      'pt': 'Conselheiro (15 anos)',
      'en': '',
      'es': '',
    },
    'nr3zdnms': {
      'pt': 'Bloqueado',
      'en': '',
      'es': '',
    },
    'u8ftgvcw': {
      'pt': '7',
      'en': '',
      'es': '',
    },
    'pocd7okr': {
      'pt': 'Mestre (16 anos)',
      'en': '',
      'es': '',
    },
    'ajg82a7a': {
      'pt': 'Bloqueado',
      'en': '',
      'es': '',
    },
    'vd3k8xpw': {
      'pt': '8',
      'en': '',
      'es': '',
    },
    'lkk8nl8l': {
      'pt': 'Guardião (17 anos)',
      'en': '',
      'es': '',
    },
    'um5orgxd': {
      'pt': 'Bloqueado',
      'en': '',
      'es': '',
    },
    'c0l6vty8': {
      'pt': '9',
      'en': '',
      'es': '',
    },
    'bjc3wlvq': {
      'pt': 'Líder (18 anos)',
      'en': '',
      'es': '',
    },
    'm6tgccuq': {
      'pt': 'Bloqueado',
      'en': '',
      'es': '',
    },
    '07mvlr1n': {
      'pt': '10',
      'en': '',
      'es': '',
    },
    'ng42hyun': {
      'pt': 'Mentor (19 anos)',
      'en': '',
      'es': '',
    },
    'nbbq4wyi': {
      'pt': 'Bloqueado',
      'en': '',
      'es': '',
    },
    'jsl49xof': {
      'pt': '11',
      'en': '',
      'es': '',
    },
    '017pw798': {
      'pt': 'Guia (20 anos)',
      'en': '',
      'es': '',
    },
    'ptzr6lqa': {
      'pt': 'Bloqueado',
      'en': '',
      'es': '',
    },
    '8cj8i2f4': {
      'pt': '12',
      'en': '',
      'es': '',
    },
    'nln8mhug': {
      'pt': 'Comandante (21 anos)',
      'en': '',
      'es': '',
    },
    '91m6xz2x': {
      'pt': 'Bloqueado',
      'en': '',
      'es': '',
    },
    'kyzud01t': {
      'pt': '13',
      'en': '',
      'es': '',
    },
    'oxfnb47h': {
      'pt': 'Embaixador (22 anos)',
      'en': '',
      'es': '',
    },
    '0l5ufv4m': {
      'pt': 'Bloqueado',
      'en': '',
      'es': '',
    },
    's15qc0ux': {
      'pt': '14',
      'en': '',
      'es': '',
    },
    'd434txok': {
      'pt': 'Patriarca/Matriarca (23 anos)',
      'en': '',
      'es': '',
    },
    'ujo5l3rt': {
      'pt': 'Bloqueado',
      'en': '',
      'es': '',
    },
  },
  // CursoDiscipulo
  {
    '6580vs96': {
      'pt': 'Grupo \"OS PIONEIROS\"',
      'en': '',
      'es': '',
    },
    '1enxkbqn': {
      'pt': 'Nível: Discipulo',
      'en': '',
      'es': '',
    },
    '8v78w1g5': {
      'pt': '100%',
      'en': '',
      'es': '',
    },
    'bzvp4fhm': {
      'pt': 'Requisitos',
      'en': '',
      'es': '',
    },
    'fml9bjdl': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'a7n6ac7n': {
      'pt': 'Vida devocional',
      'en': '',
      'es': '',
    },
    'rb260ng9': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'c0fknebx': {
      'pt': 'Arte do Mato / Buschcraft',
      'en': '',
      'es': '',
    },
    '82dogi4h': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'otsnesma': {
      'pt': 'Voluntariado',
      'en': '',
      'es': '',
    },
    '7567dswf': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'ew9ibkx6': {
      'pt': 'Discipulado',
      'en': '',
      'es': '',
    },
    'l268xjac': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'q1z3b9kh': {
      'pt': 'Promessista',
      'en': '',
      'es': '',
    },
    'jg75se05': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'df47w3me': {
      'pt': 'Cidadania',
      'en': '',
      'es': '',
    },
    '5fpihj5f': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'xfulevh7': {
      'pt': 'Comunhão cristã',
      'en': '',
      'es': '',
    },
    '41p8he96': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
  },
  // CursoExplorador
  {
    '7ts5h7fi': {
      'pt': 'Grupo \"OS PIONEIROS\"',
      'en': '',
      'es': '',
    },
    'lydze7fl': {
      'pt': 'Nível: Explorador',
      'en': '',
      'es': '',
    },
    'tro2i0oh': {
      'pt': '100%',
      'en': '',
      'es': '',
    },
    '1pm5u3dw': {
      'pt': 'Requisitos',
      'en': '',
      'es': '',
    },
    'e3xc53yq': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'f38la54s': {
      'pt': 'Vida devocional',
      'en': '',
      'es': '',
    },
    'ugi7zdma': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'lbpivusn': {
      'pt': 'Arte do Mato / Buschcraft',
      'en': '',
      'es': '',
    },
    'vnwe4nh1': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'qomw5gon': {
      'pt': 'Voluntariado',
      'en': '',
      'es': '',
    },
    'w8o2oteo': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    '1j1sc6ve': {
      'pt': 'Discipulado',
      'en': '',
      'es': '',
    },
    'cg3942gs': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    '38cw971n': {
      'pt': 'Promessista',
      'en': '',
      'es': '',
    },
    'to2qk4d5': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'vcpzvvve': {
      'pt': 'Cidadania',
      'en': '',
      'es': '',
    },
    'uh05tjl4': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'c0gfzctn': {
      'pt': 'Comunhão cristã',
      'en': '',
      'es': '',
    },
    'rt66hoie': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
  },
  // CursoAventureiro
  {
    'wkz08e19': {
      'pt': 'Grupo \"OS PIONEIROS\"',
      'en': '',
      'es': '',
    },
    '1f6lp0o4': {
      'pt': 'Nível: Discipulo',
      'en': '',
      'es': '',
    },
    'p2kd3uly': {
      'pt': '100%',
      'en': '',
      'es': '',
    },
    'y7vu4weu': {
      'pt': 'Requisitos',
      'en': '',
      'es': '',
    },
    'l4mf9by5': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    '0gnc2t58': {
      'pt': 'Vida devocional',
      'en': '',
      'es': '',
    },
    'z625lu0b': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'kzphsss8': {
      'pt': 'Arte do Mato / Buschcraft',
      'en': '',
      'es': '',
    },
    'jjjcrdbk': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    '3cn89bmu': {
      'pt': 'Voluntariado',
      'en': '',
      'es': '',
    },
    'qgfxiuch': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'rst4dx2f': {
      'pt': 'Discipulado',
      'en': '',
      'es': '',
    },
    'nv8mi3ge': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'skf0ruem': {
      'pt': 'Promessista',
      'en': '',
      'es': '',
    },
    '2bl5mvpf': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'lb9kxpta': {
      'pt': 'Cidadania',
      'en': '',
      'es': '',
    },
    'lckld7qv': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
    'x3y8j8u2': {
      'pt': 'Comunhão cristã',
      'en': '',
      'es': '',
    },
    'tzg9kuhy': {
      'pt': 'Concluído',
      'en': '',
      'es': '',
    },
  },
  // CursoAprendiz
  {
    'xx8cjwuz': {
      'pt': 'Grupo \"OS PIONEIROS\"',
      'en': '',
      'es': '',
    },
    'espb0dyy': {
      'pt': 'Nível: Aprendiz',
      'en': '',
      'es': '',
    },
    '3ctxyxte': {
      'pt': '10%',
      'en': '',
      'es': '',
    },
    'p9fmiveh': {
      'pt': '1',
      'en': '',
      'es': '',
    },
    'r9hn4jk3': {
      'pt': 'Requisitos',
      'en': '',
      'es': '',
    },
    'zd5ty5hs': {
      'pt': 'Em andamento',
      'en': '',
      'es': '',
    },
    '71gawr77': {
      'pt': '2',
      'en': '',
      'es': '',
    },
    'qlazesov': {
      'pt': 'Vida Devocional',
      'en': '',
      'es': '',
    },
    'grdq52sn': {
      'pt': 'Em andamento',
      'en': '',
      'es': '',
    },
    'ien32y3q': {
      'pt': '3',
      'en': '',
      'es': '',
    },
    'iav4y7qx': {
      'pt': 'Arte do Mato / Buschcraft',
      'en': '',
      'es': '',
    },
    'g63c3mas': {
      'pt': 'Em andamento',
      'en': '',
      'es': '',
    },
    'h33mmjis': {
      'pt': '4',
      'en': '',
      'es': '',
    },
    't98mb2ee': {
      'pt': 'Voluntariado',
      'en': '',
      'es': '',
    },
    'zeycp4m7': {
      'pt': 'Em andamento',
      'en': '',
      'es': '',
    },
    'ee9cyc27': {
      'pt': '5',
      'en': '',
      'es': '',
    },
    'uqaupros': {
      'pt': 'Discipulado',
      'en': '',
      'es': '',
    },
    '1voel8yy': {
      'pt': 'Em andamento',
      'en': '',
      'es': '',
    },
    'pwe17qzc': {
      'pt': '6',
      'en': '',
      'es': '',
    },
    'odvka1cv': {
      'pt': 'Promessista',
      'en': '',
      'es': '',
    },
    '1ef8iqiu': {
      'pt': 'Em andamento',
      'en': '',
      'es': '',
    },
    'ajh3kedf': {
      'pt': '7',
      'en': '',
      'es': '',
    },
    's7pn6he3': {
      'pt': 'Cidadania',
      'en': '',
      'es': '',
    },
    '6023rn0b': {
      'pt': 'Em andamento',
      'en': '',
      'es': '',
    },
    'ka5bt47w': {
      'pt': '8',
      'en': '',
      'es': '',
    },
    'z4knppab': {
      'pt': 'Comunhão cristã',
      'en': '',
      'es': '',
    },
    'rf8ohrqq': {
      'pt': 'Em andamento',
      'en': '',
      'es': '',
    },
  },
  // QuizMusicos
  {
    '7y1bukwz': {
      'pt': 'Questionário sobre habilidades artisticas',
      'en': '',
      'es': '',
    },
    'wtegqzm3': {
      'pt':
          'Por favor, responda às seguintes perguntas para nos ajudar a entender melhor suas necessidades e fornecer o suporte adequado.',
      'en': '',
      'es': '',
    },
    'mlj1suhu': {
      'pt': '1. Como voce participa do ministerio de musica e artes na igreja?',
      'en': '',
      'es': '',
    },
    '4r07betr': {
      'pt': 'Não participo.',
      'en': '',
      'es': '',
    },
    '5a8rfeqv': {
      'pt': 'Vocal',
      'en': '',
      'es': '',
    },
    't7w7214z': {
      'pt': 'Musico',
      'en': '',
      'es': '',
    },
    'x9y3rx8o': {
      'pt': 'Coreografia',
      'en': '',
      'es': '',
    },
    'hsbxjbvv': {
      'pt': 'Controle do som',
      'en': '',
      'es': '',
    },
    '9dqxfnle': {
      'pt': 'Controle das mídias',
      'en': '',
      'es': '',
    },
    '37adr431': {
      'pt': 'Teatro',
      'en': '',
      'es': '',
    },
    'hvzk2ns5': {
      'pt': '2. Como voce avalia sua performance?',
      'en': '',
      'es': '',
    },
    'p3z41rrh': {
      'pt': 'Iniciante',
      'en': '',
      'es': '',
    },
    'pyt01knx': {
      'pt': 'Intermediario',
      'en': '',
      'es': '',
    },
    'u41gs99u': {
      'pt': 'Experiente',
      'en': '',
      'es': '',
    },
    '9eu3u1g9': {
      'pt': '3. Quantos anos de participação?',
      'en': '',
      'es': '',
    },
    '0xpnbbb3': {
      'pt': 'Ainda estudando',
      'en': '',
      'es': '',
    },
    '8fqrrsyk': {
      'pt': 'Menos de um ano',
      'en': '',
      'es': '',
    },
    'axfpzsnh': {
      'pt': 'Entre 1 e 3 anos',
      'en': '',
      'es': '',
    },
    '80letrkz': {
      'pt': '4 anos ou +',
      'en': '',
      'es': '',
    },
    'gepckkrz': {
      'pt': '4. De quem é o instrumento que voce usa no ministrio de louvor?',
      'en': '',
      'es': '',
    },
    'hsmd66cv': {
      'pt': 'Não uso',
      'en': '',
      'es': '',
    },
    'qgrsub9o': {
      'pt': 'Igreja',
      'en': '',
      'es': '',
    },
    'h7eyu4w5': {
      'pt': 'Proprio',
      'en': '',
      'es': '',
    },
    'fc51i872': {
      'pt': '5. Qual o seu timbre de voz?',
      'en': '',
      'es': '',
    },
    '9pv0ksv5': {
      'pt': 'Não canto',
      'en': '',
      'es': '',
    },
    '9wgdevce': {
      'pt': 'Soprano',
      'en': '',
      'es': '',
    },
    'zwduhft2': {
      'pt': 'Mezzo-soprano',
      'en': '',
      'es': '',
    },
    'a3cv1k3u': {
      'pt': 'Contralto',
      'en': '',
      'es': '',
    },
    '3y74q7ui': {
      'pt': 'Tenor',
      'en': '',
      'es': '',
    },
    'ghlyk3tt': {
      'pt':
          '6. Você precisa de algum tipo de assistência para realizar atividades diárias?',
      'en': '',
      'es': '',
    },
    'qeo1mvqd': {
      'pt': 'Não',
      'en': '',
      'es': '',
    },
    'rhgqjgf9': {
      'pt': 'Sim, ocasionalmente',
      'en': '',
      'es': '',
    },
    'qtamw52q': {
      'pt': 'Sim, frequentemente',
      'en': '',
      'es': '',
    },
    'htzuqmn2': {
      'pt': 'Sim, sempre',
      'en': '',
      'es': '',
    },
    'qns53tn4': {
      'pt':
          '7. Há alguma outra necessidade especial que gostaria de mencionar?',
      'en': '',
      'es': '',
    },
    'y0okcvan': {
      'pt': 'Digite aqui...',
      'en': '',
      'es': '',
    },
    'k39uef8c': {
      'pt': 'Enviar Respostas',
      'en': '',
      'es': '',
    },
    'f041fri3': {
      'pt': 'Página inicial',
      'en': 'Home page',
      'es': 'Página de inicio',
    },
  },
  // NivelAcesso
  {
    '6wd574nh': {
      'pt': 'Gerenciar Níveis de Acesso',
      'en': '',
      'es': '',
    },
    'zd4vk5ef': {
      'pt': 'PESQUISAR',
      'en': '',
      'es': '',
    },
    'zkdu3u9p': {
      'pt': 'Todos',
      'en': '',
      'es': '',
    },
    'gfcdf4dd': {
      'pt': 'Visitante',
      'en': '',
      'es': '',
    },
    'g2268qji': {
      'pt': 'Colaborador',
      'en': '',
      'es': '',
    },
    '8vtyg6om': {
      'pt': 'Voluntário',
      'en': '',
      'es': '',
    },
    '74n6jnvr': {
      'pt': 'Funcionário',
      'en': '',
      'es': '',
    },
    'u63p6268': {
      'pt': 'Líder',
      'en': '',
      'es': '',
    },
    'rrbedw4r': {
      'pt': 'Gerente',
      'en': '',
      'es': '',
    },
    'h9g29tzq': {
      'pt': 'Administrador',
      'en': '',
      'es': '',
    },
    'c7h0c6lr': {
      'pt': 'João Silva',
      'en': '',
      'es': '',
    },
    'jalscmtq': {
      'pt': 'joao.silva@email.com',
      'en': '',
      'es': '',
    },
    'o9j9upy7': {
      'pt': 'Colaborador',
      'en': '',
      'es': '',
    },
    'd66k1lpa': {
      'pt': 'João Silva',
      'en': '',
      'es': '',
    },
    '2bi1duwv': {
      'pt': 'joao.silva@email.com',
      'en': '',
      'es': '',
    },
    'ir2b8sdy': {
      'pt': 'Colaborador',
      'en': '',
      'es': '',
    },
    'bjx7c67k': {
      'pt': 'João Silva',
      'en': '',
      'es': '',
    },
    'pmjuqw1a': {
      'pt': 'joao.silva@email.com',
      'en': '',
      'es': '',
    },
    'hkdt0ta5': {
      'pt': 'Colaborador',
      'en': '',
      'es': '',
    },
    'y0fh44jv': {
      'pt': 'João Silva',
      'en': '',
      'es': '',
    },
    'sikm8z77': {
      'pt': 'joao.silva@email.com',
      'en': '',
      'es': '',
    },
    '9ixbtupe': {
      'pt': 'Colaborador',
      'en': '',
      'es': '',
    },
    '2iayiasd': {
      'pt': 'João Silva',
      'en': '',
      'es': '',
    },
    '1lvs1ktu': {
      'pt': 'joao.silva@email.com',
      'en': '',
      'es': '',
    },
    'kmdhomc6': {
      'pt': 'Colaborador',
      'en': '',
      'es': '',
    },
    'wevdtor5': {
      'pt': 'João Silva',
      'en': '',
      'es': '',
    },
    'zu6ihstg': {
      'pt': 'joao.silva@email.com',
      'en': '',
      'es': '',
    },
    '2n2xs16u': {
      'pt': 'Colaborador',
      'en': '',
      'es': '',
    },
    '6gkgwl5s': {
      'pt': 'Maria Santos',
      'en': '',
      'es': '',
    },
    '8urrw7md': {
      'pt': 'maria.santos@email.com',
      'en': '',
      'es': '',
    },
    '5vuoioxl': {
      'pt': 'Líder',
      'en': '',
      'es': '',
    },
    '67tfcwls': {
      'pt': 'Maria Santos',
      'en': '',
      'es': '',
    },
    'j2hzxx2t': {
      'pt': 'maria.santos@email.com',
      'en': '',
      'es': '',
    },
    'ne4r30j3': {
      'pt': 'Líder',
      'en': '',
      'es': '',
    },
    '78zljfek': {
      'pt': 'Carlos Oliveira',
      'en': '',
      'es': '',
    },
    'mpw110z3': {
      'pt': 'carlos.oliveira@email.com',
      'en': '',
      'es': '',
    },
    'x4y0af9t': {
      'pt': 'Administrador',
      'en': '',
      'es': '',
    },
    'zppf8nu6': {
      'pt': 'ALTERAR',
      'en': '',
      'es': '',
    },
    'oz6q8t34': {
      'pt': 'Alterar Nível de Acesso',
      'en': '',
      'es': '',
    },
    'x63rx5jn': {
      'pt': 'Email do Usuário',
      'en': '',
      'es': '',
    },
    'o6od9i38': {
      'pt': 'Digite o email do usuário',
      'en': '',
      'es': '',
    },
    '0wgqh0a3': {
      'pt': 'Novo Nível de Acesso',
      'en': '',
      'es': '',
    },
    'tl9t1qpx': {
      'pt': 'Selecionar',
      'en': '',
      'es': '',
    },
    'qyhifiis': {
      'pt': 'Atualizar Nível de Acesso',
      'en': '',
      'es': '',
    },
  },
  // DashboardOrganizacao
  {
    'fcibnc1y': {
      'pt': 'Monitor Financeiro',
      'en': '',
      'es': '',
    },
    'd6yuzqiw': {
      'pt': 'Notificar',
      'en': '',
      'es': '',
    },
    '6tdyc8bb': {
      'pt': 'Organização',
      'en': '',
      'es': '',
    },
    'wurvgg55': {
      'pt': 'Projetos',
      'en': '',
      'es': '',
    },
    'd6h672nc': {
      'pt': 'Atividades',
      'en': '',
      'es': '',
    },
    '600jzddc': {
      'pt': 'Lideres',
      'en': '',
      'es': '',
    },
    'uf973azr': {
      'pt': 'Equipe',
      'en': '',
      'es': '',
    },
    'ez7aptf6': {
      'pt': 'Colaboradores',
      'en': '',
      'es': '',
    },
    '2ysdngws': {
      'pt': 'Transações financeiras',
      'en': '',
      'es': '',
    },
    'j2e0uu0q': {
      'pt': 'Blockchain',
      'en': '',
      'es': '',
    },
    'wqqjfmni': {
      'pt': 'Notificações',
      'en': '',
      'es': '',
    },
    'lmq3q3lf': {
      'pt': '22',
      'en': '',
      'es': '',
    },
    'nl08x2wa': {
      'pt': 'DASHBOARD ORGANIZAÇÃO',
      'en': '',
      'es': '',
    },
    'jnqfllnw': {
      'pt': 'Luis Fernando',
      'en': '',
      'es': '',
    },
    '2xgnyj19': {
      'pt': 'admin@email.com',
      'en': '',
      'es': '',
    },
    'jk81xosa': {
      'pt': 'CONVENÇÃO SEAL',
      'en': '',
      'es': '',
    },
    'ab791bcq': {
      'pt': 'IAP JOÃO ALVES',
      'en': '',
      'es': '',
    },
    'u2kp75o4': {
      'pt': 'IAP SIQUEIRA CAMPOS',
      'en': '',
      'es': '',
    },
    'tmgdvw9p': {
      'pt': 'IAP SANTOS DUMONT',
      'en': '',
      'es': '',
    },
    '86glsntk': {
      'pt': 'IAP ITABAIANA',
      'en': '',
      'es': '',
    },
    '71c4xvlt': {
      'pt': 'IAP CIDADE NOVA',
      'en': '',
      'es': '',
    },
    'zhkp9yku': {
      'pt': 'IAP COROA DO MEIO',
      'en': '',
      'es': '',
    },
    'ylzqgcae': {
      'pt': 'CONVENÇÃO SEAL',
      'en': '',
      'es': '',
    },
    'q4atjz3p': {
      'pt': 'Agendadas',
      'en': '',
      'es': '',
    },
    'junuttew': {
      'pt': 'Aula do CETAP',
      'en': '',
      'es': '',
    },
    'ymmfxeyx': {
      'pt': 'Ministério de Ensino SEAL',
      'en': '',
      'es': '',
    },
    'b9f96bfa': {
      'pt': '26/10/2024',
      'en': '',
      'es': '',
    },
    'uv2f3ch8': {
      'pt': 'Falta: 1 dia',
      'en': '',
      'es': '',
    },
    '4hsyvqio': {
      'pt': 'Treinamento de Capelania',
      'en': '',
      'es': '',
    },
    'a4pwb93g': {
      'pt': 'Secretária \nde Inclusão',
      'en': '',
      'es': '',
    },
    '0kysv09s': {
      'pt': '02/11/2024',
      'en': '',
      'es': '',
    },
    'lq8mtslh': {
      'pt': 'Faltam: 9 dias',
      'en': '',
      'es': '',
    },
    'd9l2xczf': {
      'pt': 'Reunião da Junta Geral',
      'en': '',
      'es': '',
    },
    'p4wu1d8u': {
      'pt': 'Diretoria IAP/GERAL',
      'en': '',
      'es': '',
    },
    'abyqk8m9': {
      'pt': '22/11/2024',
      'en': '',
      'es': '',
    },
    'ivy3xnof': {
      'pt': 'Faltam: 28 dias',
      'en': '',
      'es': '',
    },
    'fch4bogl': {
      'pt': 'Assembleia Geral da IAP',
      'en': '',
      'es': '',
    },
    'pmrjlt9q': {
      'pt': 'Diretoria IAP/GERAL',
      'en': '',
      'es': '',
    },
    'oqxmvfv0': {
      'pt': '23/11/2024',
      'en': '',
      'es': '',
    },
    'y9k68m1g': {
      'pt': 'Faltam: 29 dias',
      'en': '',
      'es': '',
    },
    'un3x0w9b': {
      'pt': 'Encontro de Mulheres',
      'en': '',
      'es': '',
    },
    '8xygukqd': {
      'pt': 'Ministério de Mulheres S',
      'en': '',
      'es': '',
    },
    'zzkgd3bk': {
      'pt': '07/12/2024',
      'en': '',
      'es': '',
    },
    'rcd0rl4k': {
      'pt': 'Faltam: 69 dias',
      'en': '',
      'es': '',
    },
    '9qnufhul': {
      'pt': 'Encontro de Jovens',
      'en': '',
      'es': '',
    },
    '0wyavnmb': {
      'pt': 'Ministerio de Jovens SE',
      'en': '',
      'es': '',
    },
    'dcuj8s8v': {
      'pt': '14/122024',
      'en': '',
      'es': '',
    },
    'sn2soazb': {
      'pt': 'Faltam: 59 dias',
      'en': '',
      'es': '',
    },
    'i8ozcwj0': {
      'pt': 'Aniversário da IAP',
      'en': '',
      'es': '',
    },
    'ggy5b6sp': {
      'pt': 'Diretoria IAP/SEAL',
      'en': '',
      'es': '',
    },
    'imd9oude': {
      'pt': '25/01/2025',
      'en': '',
      'es': '',
    },
    'n0w7gc4g': {
      'pt': 'Faltam: 69 dias',
      'en': '',
      'es': '',
    },
    'nr69v8s7': {
      'pt': 'Iniciadas',
      'en': '',
      'es': '',
    },
    'apo0zlqn': {
      'pt': 'Campanha Anual de Missoes',
      'en': '',
      'es': '',
    },
    '1a3ep6yy': {
      'pt': 'Ministério de \nProclamação SEAL',
      'en': '',
      'es': '',
    },
    '7gc3gaxc': {
      'pt': 'Progress: 60%',
      'en': '',
      'es': '',
    },
    'cu8ynx56': {
      'pt': 'Coral para Assembleia Geral',
      'en': '',
      'es': '',
    },
    'ae98itlo': {
      'pt': 'Ministerio\nViva Mais SEAL',
      'en': '',
      'es': '',
    },
    'kzr59hwd': {
      'pt': 'Progress: 40%',
      'en': '',
      'es': '',
    },
    'ke3xot5w': {
      'pt': 'Ensaios  da Banda para A.Geral',
      'en': '',
      'es': '',
    },
    '9izjxanh': {
      'pt': 'Ministério de \nMusica e Artes SE',
      'en': '',
      'es': '',
    },
    'nf4x5413': {
      'pt': 'Progress: 40%',
      'en': '',
      'es': '',
    },
    'qab2tov1': {
      'pt': 'Equipe de recepção A.Geral',
      'en': '',
      'es': '',
    },
    'y0y82fc0': {
      'pt': 'Diretoria IAP/GERAL',
      'en': '',
      'es': '',
    },
    'bh6z0ngj': {
      'pt': 'Progress: 40%',
      'en': '',
      'es': '',
    },
    'roa98jln': {
      'pt': 'Concluídas',
      'en': '',
      'es': '',
    },
    'uy0axspi': {
      'pt': 'Batismo',
      'en': '',
      'es': '',
    },
    'fo5slibu': {
      'pt': 'Campo 1',
      'en': '',
      'es': '',
    },
    'z86qdz9c': {
      'pt': 'Concluída: 19/10/2024',
      'en': '',
      'es': '',
    },
    'cse0ox3m': {
      'pt': 'Prog A voz do Cenaculo - ep151',
      'en': '',
      'es': '',
    },
    '1tuknrti': {
      'pt': 'Ministério \nde Midias',
      'en': '',
      'es': '',
    },
    'n1lit5gn': {
      'pt': 'Concluída: 13/10/2024',
      'en': '',
      'es': '',
    },
    '7jjmmuws': {
      'pt': 'Encontro de Pastores e familia',
      'en': '',
      'es': '',
    },
    'b719xu70': {
      'pt': 'Ministério de \nVida Pastoral',
      'en': '',
      'es': '',
    },
    '1y12ag3z': {
      'pt': 'Concluída: 13/10/2024',
      'en': '',
      'es': '',
    },
    '822efzog': {
      'pt': 'Treinamento Sonorizacao',
      'en': '',
      'es': '',
    },
    'mt7zyqry': {
      'pt': 'Analysis',
      'en': '',
      'es': '',
    },
    '0cf34qd1': {
      'pt': 'Concluída: 21/09/2024',
      'en': '',
      'es': '',
    },
    'vvmudxba': {
      'pt': 'Encontro das SARAS',
      'en': '',
      'es': '',
    },
    'thjrkofl': {
      'pt': 'Ministério de \nMulheres SE',
      'en': '',
      'es': '',
    },
    '7g3gebrt': {
      'pt': 'Concluída: 21/09/2024',
      'en': '',
      'es': '',
    },
    'k28b75qd': {
      'pt': 'PROJETOS',
      'en': '',
      'es': '',
    },
    'cnd3yxhe': {
      'pt': '55',
      'en': '',
      'es': '',
    },
    'p2dx4znz': {
      'pt': 'PARTICIPANTES',
      'en': '',
      'es': '',
    },
    'sqiqmcuu': {
      'pt': '3232',
      'en': '',
      'es': '',
    },
    '6km89iia': {
      'pt': 'ATIVIDADES\nAGENDADAS',
      'en': '',
      'es': '',
    },
    '4c3n8nu8': {
      'pt': '523',
      'en': '',
      'es': '',
    },
    '1atz08mc': {
      'pt': 'ATIVIDADES\nINICIADAS',
      'en': '',
      'es': '',
    },
    'ljx49gzr': {
      'pt': '425',
      'en': '',
      'es': '',
    },
    'ab53war8': {
      'pt': 'ATIVIDADES \nCONCLUíDAS',
      'en': '',
      'es': '',
    },
    'nxoui62j': {
      'pt': '372',
      'en': '',
      'es': '',
    },
    '272sut08': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // HomeProjeto
  {
    'w8a18hcg': {
      'pt': 'Projeto',
      'en': '',
      'es': '',
    },
    'd9ot2zeg': {
      'pt': 'Criar',
      'en': '',
      'es': '',
    },
    '4g4yroqu': {
      'pt': 'Nome do Projeto',
      'en': '',
      'es': '',
    },
    'fxof4k69': {
      'pt': 'Digite um nome para o projeto ...',
      'en': '',
      'es': '',
    },
    'nz14mbc4': {
      'pt': 'Responsavel pelo projeto',
      'en': '',
      'es': '',
    },
    'bwxaoja0': {
      'pt': 'Escolha o responsavel pelo projeto ...',
      'en': '',
      'es': '',
    },
    '34b488um': {
      'pt': '999.999.999-99',
      'en': '',
      'es': '',
    },
    '77b3j2db': {
      'pt': 'Descrição do projeto',
      'en': '',
      'es': '',
    },
    'ni7woqki': {
      'pt': 'Escreva uma breve descrição do projeto ...',
      'en': '',
      'es': '',
    },
    '2kpl7obn': {
      'pt': 'Insira uma imagem/logotipo: ',
      'en': '',
      'es': '',
    },
    'bkpiu1vg': {
      'pt': 'Que o tipo de projeto?',
      'en': '',
      'es': '',
    },
    'ywl7rj7x': {
      'pt': 'Igreja',
      'en': '',
      'es': '',
    },
    'oczvmjcs': {
      'pt': 'Congregação',
      'en': '',
      'es': '',
    },
    'peoy9onv': {
      'pt': 'Evento',
      'en': '',
      'es': '',
    },
    'vaeq983l': {
      'pt': 'Assembleia',
      'en': '',
      'es': '',
    },
    'eb3ei0wq': {
      'pt': 'Grupo \"Os Pioneiros\"',
      'en': '',
      'es': '',
    },
    '8okeodju': {
      'pt': 'Ministério',
      'en': '',
      'es': '',
    },
    '14emvtqc': {
      'pt': 'Igreja',
      'en': '',
      'es': '',
    },
    'jpeorst9': {
      'pt': 'Salvar',
      'en': '',
      'es': '',
    },
    'hv3vbfcm': {
      'pt': 'Listar',
      'en': '',
      'es': '',
    },
    'w7k3tvtq': {
      'pt': 'Escolha um projeto para ver mais informações.',
      'en': '',
      'es': '',
    },
    'vwauw2g0': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'pf5hge2z': {
      'pt': 'Convenção SEAL',
      'en': '',
      'es': '',
    },
    'oyhkddfv': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '0d6wzr0h': {
      'pt': 'Grupo \"OS PIONEIROS\"',
      'en': '',
      'es': '',
    },
    '90xmwl6m': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '4pazpxrz': {
      'pt': 'IAP Arapiraca',
      'en': '',
      'es': '',
    },
    'fqxoym02': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'kkaeuu1b': {
      'pt': 'IAP Bugio',
      'en': '',
      'es': '',
    },
    'h7djiitc': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'd967w6xu': {
      'pt': 'IAP Santos Dumont',
      'en': '',
      'es': '',
    },
    '4qm0cyj7': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '3w3k54tu': {
      'pt': 'Congregação IAP Capela',
      'en': '',
      'es': '',
    },
    't1d2pehk': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '6q62hphy': {
      'pt': 'Aniversário IAP 2025',
      'en': '',
      'es': '',
    },
    '7aky26y2': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'nk8lkwg1': {
      'pt': 'Coral IAP SEAL',
      'en': '',
      'es': '',
    },
    'ljtvnl6o': {
      'pt': 'Editar',
      'en': '',
      'es': '',
    },
    'hc8dstq1': {
      'pt': 'Editar o Projeto',
      'en': '',
      'es': '',
    },
    'jq25gg97': {
      'pt': 'Escolha um projeto ...',
      'en': '',
      'es': '',
    },
    'ng4t2zwi': {
      'pt': 'Nome do Projeto',
      'en': '',
      'es': '',
    },
    'espcvgzm': {
      'pt': 'Digite um nome para o projeto ...',
      'en': '',
      'es': '',
    },
    'ggepdnxh': {
      'pt': 'Responsavel pelo projeto',
      'en': '',
      'es': '',
    },
    'ynnce894': {
      'pt': 'Escolha o responsavel pelo projeto ...',
      'en': '',
      'es': '',
    },
    'tu8agqwa': {
      'pt': 'Descrição do projeto',
      'en': '',
      'es': '',
    },
    'qqx0qd4w': {
      'pt': 'Escreva uma breve descrição do projeto ...',
      'en': '',
      'es': '',
    },
    'icsmp1lt': {
      'pt': 'Insira uma imagem/logotipo: ',
      'en': '',
      'es': '',
    },
    'fc1i3xuc': {
      'pt': 'Que o tipo de projeto?',
      'en': '',
      'es': '',
    },
    'origurbr': {
      'pt': 'Igreja',
      'en': '',
      'es': '',
    },
    '8uerbg2y': {
      'pt': 'Congregação',
      'en': '',
      'es': '',
    },
    'akjyl2wb': {
      'pt': 'Evento',
      'en': '',
      'es': '',
    },
    'th3tbvb3': {
      'pt': 'Assembleia',
      'en': '',
      'es': '',
    },
    'aztnnp2l': {
      'pt': 'Grupo \"Os Pioneiros\"',
      'en': '',
      'es': '',
    },
    'rdg8yyze': {
      'pt': 'Ministério',
      'en': '',
      'es': '',
    },
    '0d5schs1': {
      'pt': 'Igreja',
      'en': '',
      'es': '',
    },
    'ri4twfsp': {
      'pt': 'Salvar',
      'en': '',
      'es': '',
    },
    '4pi8dsrg': {
      'pt': 'Projeto',
      'en': '',
      'es': '',
    },
  },
  // HomeAtividade
  {
    'qvt9g039': {
      'pt': 'Atividade',
      'en': '',
      'es': '',
    },
    'm99sdkds': {
      'pt': 'Criar',
      'en': '',
      'es': '',
    },
    'ceh7rlar': {
      'pt': 'Projeto associado',
      'en': '',
      'es': '',
    },
    'hac4teki': {
      'pt': 'Escolha o projeto para criar a atividade ...',
      'en': '',
      'es': '',
    },
    'vwupcv7l': {
      'pt': 'Nome da Atividade',
      'en': '',
      'es': '',
    },
    'ig020lam': {
      'pt': 'Digite um nome para a atividade ...',
      'en': '',
      'es': '',
    },
    '41mel2y8': {
      'pt': 'Descrição',
      'en': '',
      'es': '',
    },
    'nt2z59cd': {
      'pt': 'Digite uma breve descrição ...',
      'en': '',
      'es': '',
    },
    'ieejuny4': {
      'pt': 'Incluir Requisitos',
      'en': '',
      'es': '',
    },
    '629rjfl8': {
      'pt': 'Qual a area de atuacao da atividade?',
      'en': '',
      'es': '',
    },
    'ti2nzkqn': {
      'pt': 'Saúde',
      'en': '',
      'es': '',
    },
    'eh7edyem': {
      'pt': 'Cultura',
      'en': '',
      'es': '',
    },
    'bknnr9wn': {
      'pt': 'Educação',
      'en': '',
      'es': '',
    },
    '7d7cl08z': {
      'pt': 'Religiosa',
      'en': '',
      'es': '',
    },
    'ac3b4nl1': {
      'pt': 'Saúde',
      'en': '',
      'es': '',
    },
    'r9f5etxi': {
      'pt': 'Meio ambiente',
      'en': '',
      'es': '',
    },
    '8mackv55': {
      'pt': 'Direitos humanos',
      'en': '',
      'es': '',
    },
    '1j8z26ew': {
      'pt': 'Assistência social',
      'en': '',
      'es': '',
    },
    '7zjxnduj': {
      'pt': 'Outra area: ',
      'en': '',
      'es': '',
    },
    'jat1z1ke': {
      'pt': 'Descreva ...',
      'en': '',
      'es': '',
    },
    '5upb1vtr': {
      'pt': 'Salvar',
      'en': '',
      'es': '',
    },
    'ixlta7l8': {
      'pt': 'Listar',
      'en': '',
      'es': '',
    },
    'xe2e89z8': {
      'pt': 'Search all tasks...',
      'en': '',
      'es': '',
    },
    '0natgboj': {
      'pt': 'Todas',
      'en': '',
      'es': '',
    },
    'v97btnlw': {
      'pt': 'Pendente',
      'en': '',
      'es': '',
    },
    'cjritfdb': {
      'pt': 'Progresso',
      'en': '',
      'es': '',
    },
    'dhtqfq5a': {
      'pt': 'Concluida',
      'en': '',
      'es': '',
    },
    'x73zmx2b': {
      'pt': 'Todas',
      'en': '',
      'es': '',
    },
    'atde8nbn': {
      'pt': 'All',
      'en': '',
      'es': '',
    },
    'qmgeoiue': {
      'pt': 'Nome da atividade',
      'en': '',
      'es': '',
    },
    'dkaztraq': {
      'pt': 'Responsável',
      'en': '',
      'es': '',
    },
    'wqz1dw5q': {
      'pt': 'Data / Hora',
      'en': '',
      'es': '',
    },
    'p3xzlhrl': {
      'pt': 'Status',
      'en': '',
      'es': '',
    },
    'qfgq45m8': {
      'pt': 'Reunião de planejamento',
      'en': '',
      'es': '',
    },
    'vndqhc27': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'kjh62r0u': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'tdq6jrmx': {
      'pt': 'Progresso',
      'en': '',
      'es': '',
    },
    'plwb2hdf': {
      'pt': 'Distribuir sopão',
      'en': '',
      'es': '',
    },
    'v0ss149r': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    '0jnzgkma': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    '0c8a3r1r': {
      'pt': 'Progresso',
      'en': '',
      'es': '',
    },
    '7pyq98f7': {
      'pt': 'Arrecadação de livros',
      'en': '',
      'es': '',
    },
    '9o4ev44a': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'h2qk8r0h': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    '75s8jvjv': {
      'pt': 'Progresso',
      'en': '',
      'es': '',
    },
    'su6mkzfe': {
      'pt': 'Divulgação do projeto ',
      'en': '',
      'es': '',
    },
    'py8vbscc': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    '15ojqfjg': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    '2qcx8ghb': {
      'pt': 'Pendente',
      'en': '',
      'es': '',
    },
    'zejs86c3': {
      'pt': 'Leitura em grupo',
      'en': '',
      'es': '',
    },
    'a8wp1yd3': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    's5w883ij': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'zn4hoz20': {
      'pt': 'Pendente',
      'en': '',
      'es': '',
    },
    'sn2ot29n': {
      'pt': 'Arrecadar alimentos',
      'en': '',
      'es': '',
    },
    '4flfi2zv': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'i5ntb5ki': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'qh08dlrx': {
      'pt': '28/04 8h',
      'en': '',
      'es': '',
    },
    'oz7bvqeo': {
      'pt': 'Pendente',
      'en': '',
      'es': '',
    },
    'lbncsn2q': {
      'pt': 'Limpar a praça',
      'en': '',
      'es': '',
    },
    '46g5j9af': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'hwlhcwl1': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'got8py1j': {
      'pt': 'Pendente',
      'en': '',
      'es': '',
    },
    'aieyt5on': {
      'pt': 'Limpar a praça',
      'en': '',
      'es': '',
    },
    'fj902vz3': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    '684g53q5': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'rutbd8xp': {
      'pt': '1/03 8h',
      'en': '',
      'es': '',
    },
    '0so1jcyk': {
      'pt': 'Concluida',
      'en': '',
      'es': '',
    },
    'fxuby9ys': {
      'pt': 'Aula de zumba',
      'en': '',
      'es': '',
    },
    'hwight8t': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    '2cv7nthj': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'b33hcbe7': {
      'pt': '2/03 19h',
      'en': '',
      'es': '',
    },
    '3n0h69pv': {
      'pt': 'Concluida',
      'en': '',
      'es': '',
    },
    '0q2yltzp': {
      'pt': 'Editar',
      'en': '',
      'es': '',
    },
    'dy84bjkw': {
      'pt': 'Editar a atividade',
      'en': '',
      'es': '',
    },
    'ejl9vnm3': {
      'pt': 'Escolha uma atividade ...',
      'en': '',
      'es': '',
    },
    'hgj747lq': {
      'pt': 'Nome da Atividade',
      'en': '',
      'es': '',
    },
    'vipjga5m': {
      'pt': 'Digite um nome para a atividade ...',
      'en': '',
      'es': '',
    },
    'ftp4fxs5': {
      'pt': 'Descrição',
      'en': '',
      'es': '',
    },
    '0sg4a3e9': {
      'pt': 'Digite uma breve descrição ...',
      'en': '',
      'es': '',
    },
    '3rzcx5za': {
      'pt': 'Incluir Requisitos',
      'en': '',
      'es': '',
    },
    'qpzalsmn': {
      'pt': 'Qual a area de atuacao da atividade?',
      'en': '',
      'es': '',
    },
    '7batnlzr': {
      'pt': 'Saúde',
      'en': '',
      'es': '',
    },
    'h0bbaqa0': {
      'pt': 'Cultura',
      'en': '',
      'es': '',
    },
    'qm7pi7r2': {
      'pt': 'Educação',
      'en': '',
      'es': '',
    },
    'y20zpeqx': {
      'pt': 'Religiosa',
      'en': '',
      'es': '',
    },
    'frq10l3h': {
      'pt': 'Saúde',
      'en': '',
      'es': '',
    },
    'jxjyynde': {
      'pt': 'Meio ambiente',
      'en': '',
      'es': '',
    },
    'bp5l64ph': {
      'pt': 'Direitos humanos',
      'en': '',
      'es': '',
    },
    'u0lp6wuy': {
      'pt': 'Assistência social',
      'en': '',
      'es': '',
    },
    'drsy2axp': {
      'pt': 'Outra area: ',
      'en': '',
      'es': '',
    },
    'dfmv58iq': {
      'pt': 'Descreva ...',
      'en': '',
      'es': '',
    },
    'n1nl3aa2': {
      'pt': 'Salvar',
      'en': '',
      'es': '',
    },
    'bijaa24j': {
      'pt': 'Atividade',
      'en': '',
      'es': '',
    },
  },
  // AjudaPerguntas
  {
    '15m14u7d': {
      'pt': 'Envie sua pergunta',
      'en': '',
      'es': '',
    },
  },
  // HomeRelatorio
  {
    'egndrt0z': {
      'pt': 'Relatório',
      'en': '',
      'es': '',
    },
    'eqa2xrp0': {
      'pt': 'Criar',
      'en': '',
      'es': '',
    },
    'ipvqutzg': {
      'pt': 'Nome do Projeto',
      'en': '',
      'es': '',
    },
    '23ledg2u': {
      'pt': 'Digite um nome para o projeto ...',
      'en': '',
      'es': '',
    },
    '3of9h8ty': {
      'pt': 'Responsavel pelo projeto',
      'en': '',
      'es': '',
    },
    'c14gb7ed': {
      'pt': 'Escolha o responsavel pelo projeto ...',
      'en': '',
      'es': '',
    },
    'h9rcsn07': {
      'pt': 'Descrição do projeto',
      'en': '',
      'es': '',
    },
    'cbvhn04p': {
      'pt': 'Escreva uma breve descrição do projeto ...',
      'en': '',
      'es': '',
    },
    'q89tkztd': {
      'pt': 'Insira uma imagem/logotipo: ',
      'en': '',
      'es': '',
    },
    '4zdxlntx': {
      'pt': 'Que o tipo de projeto?',
      'en': '',
      'es': '',
    },
    'jccuih2v': {
      'pt': 'Igreja',
      'en': '',
      'es': '',
    },
    'n4kwu01v': {
      'pt': 'Congregação',
      'en': '',
      'es': '',
    },
    'v418fshe': {
      'pt': 'Evento',
      'en': '',
      'es': '',
    },
    'lqztj746': {
      'pt': 'Assembleia',
      'en': '',
      'es': '',
    },
    '195ytjif': {
      'pt': 'Grupo \"Os Pioneiros\"',
      'en': '',
      'es': '',
    },
    'cq8m4d31': {
      'pt': 'Ministério',
      'en': '',
      'es': '',
    },
    'ndmto4q5': {
      'pt': 'Igreja',
      'en': '',
      'es': '',
    },
    'kx0mnhmr': {
      'pt': 'Salvar',
      'en': '',
      'es': '',
    },
    'tabus3hx': {
      'pt': 'Listar',
      'en': '',
      'es': '',
    },
    'zf6whf9x': {
      'pt': 'Escolha um projeto para ver mais informações.',
      'en': '',
      'es': '',
    },
    'ouhucayv': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'jobe192o': {
      'pt': 'Convenção SEAL',
      'en': '',
      'es': '',
    },
    'y7whn9b5': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '2986jc2x': {
      'pt': 'IAP Arapiraca',
      'en': '',
      'es': '',
    },
    'yvi9tn9t': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'gkz9ybp7': {
      'pt': 'IAP Bugio',
      'en': '',
      'es': '',
    },
    '83548j90': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    's558v3my': {
      'pt': 'IAP Santos Dumont',
      'en': '',
      'es': '',
    },
    'fiv7lx76': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'm6cy6bmh': {
      'pt': 'Congregação IAP Capela',
      'en': '',
      'es': '',
    },
    '21yo0y2m': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'lmjegiqh': {
      'pt': 'Aniversário IAP 2025',
      'en': '',
      'es': '',
    },
    'kzqj0ku0': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'yiv1tpyt': {
      'pt': 'Coral IAP SEAL',
      'en': '',
      'es': '',
    },
    'sf6odqjf': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '4m2a5xwo': {
      'pt': 'Grupo \"OS PIONEIROS\"',
      'en': '',
      'es': '',
    },
    'nep28bmd': {
      'pt': 'Editar',
      'en': '',
      'es': '',
    },
    'c085gllj': {
      'pt': 'Editar o Projeto',
      'en': '',
      'es': '',
    },
    '8jrw7xu7': {
      'pt': 'Escolha um projeto ...',
      'en': '',
      'es': '',
    },
    'nupemvqz': {
      'pt': 'Nome do Projeto',
      'en': '',
      'es': '',
    },
    '63kfrcne': {
      'pt': 'Digite um nome para o projeto ...',
      'en': '',
      'es': '',
    },
    'v76jj254': {
      'pt': 'Responsavel pelo projeto',
      'en': '',
      'es': '',
    },
    'zdz8mmrq': {
      'pt': 'Escolha o responsavel pelo projeto ...',
      'en': '',
      'es': '',
    },
    '15gg7mr5': {
      'pt': 'Descrição do projeto',
      'en': '',
      'es': '',
    },
    'swci6hba': {
      'pt': 'Escreva uma breve descrição do projeto ...',
      'en': '',
      'es': '',
    },
    '9nnkj1sh': {
      'pt': 'Insira uma imagem/logotipo: ',
      'en': '',
      'es': '',
    },
    'g4njgtwz': {
      'pt': 'Que o tipo de projeto?',
      'en': '',
      'es': '',
    },
    '8vp6v20n': {
      'pt': 'Igreja',
      'en': '',
      'es': '',
    },
    '3usn0jjy': {
      'pt': 'Congregação',
      'en': '',
      'es': '',
    },
    'b0wk1q6p': {
      'pt': 'Evento',
      'en': '',
      'es': '',
    },
    'dgjs6o3x': {
      'pt': 'Assembleia',
      'en': '',
      'es': '',
    },
    '9b4i0ps0': {
      'pt': 'Grupo \"Os Pioneiros\"',
      'en': '',
      'es': '',
    },
    'xool0bbc': {
      'pt': 'Ministério',
      'en': '',
      'es': '',
    },
    'idovjs13': {
      'pt': 'Salvar',
      'en': '',
      'es': '',
    },
    'kew6snel': {
      'pt': 'Relatório',
      'en': '',
      'es': '',
    },
  },
  // HomeCurso
  {
    'sui37dl8': {
      'pt': 'Curso',
      'en': '',
      'es': '',
    },
    'gefwec4w': {
      'pt': 'Criar',
      'en': '',
      'es': '',
    },
    '57vhylp1': {
      'pt': 'Nome do Projeto',
      'en': '',
      'es': '',
    },
    'xjezkdkm': {
      'pt': 'Digite um nome para o curso ...',
      'en': '',
      'es': '',
    },
    '1g9hgpi0': {
      'pt': 'Area do curso:',
      'en': '',
      'es': '',
    },
    '5db27lho': {
      'pt': 'Grupo \"Os Pioneiros\"',
      'en': '',
      'es': '',
    },
    'cr3u5d0l': {
      'pt': 'Liderança',
      'en': '',
      'es': '',
    },
    'f7m1j1j1': {
      'pt': 'Evangelismo',
      'en': '',
      'es': '',
    },
    'l9blmfys': {
      'pt': 'Igreja Adventista da Promessa',
      'en': '',
      'es': '',
    },
    'i43248ol': {
      'pt': 'Biblia Sagrada',
      'en': '',
      'es': '',
    },
    'imxudoxk': {
      'pt': 'Crianças e adolescentes',
      'en': '',
      'es': '',
    },
    'fgunw6ju': {
      'pt': 'Inclusão',
      'en': '',
      'es': '',
    },
    'iqfwcs61': {
      'pt': 'Capelania',
      'en': '',
      'es': '',
    },
    'de8as0w6': {
      'pt': 'Arte do Mato',
      'en': '',
      'es': '',
    },
    'xifcyaxj': {
      'pt': 'Musica e artes',
      'en': '',
      'es': '',
    },
    '4fzwe1kj': {
      'pt': 'Jovens',
      'en': '',
      'es': '',
    },
    'qnnmissp': {
      'pt': 'Homens',
      'en': '',
      'es': '',
    },
    'vl7clure': {
      'pt': 'Mulheres',
      'en': '',
      'es': '',
    },
    'tbvgfato': {
      'pt': 'Assistencia humanitaria',
      'en': '',
      'es': '',
    },
    '2y30jkgz': {
      'pt': 'Educação cristã',
      'en': '',
      'es': '',
    },
    'i6cu8the': {
      'pt': 'Grupo \"Os Pioneiros\"',
      'en': '',
      'es': '',
    },
    'ouzpgyv2': {
      'pt': 'Anexar um video (Maximo 500mb): ',
      'en': '',
      'es': '',
    },
    't7g9sbmo': {
      'pt': 'Anexar um audio (mp3):',
      'en': '',
      'es': '',
    },
    'go7sj3h6': {
      'pt': 'Anexar arquivo em PDF:',
      'en': '',
      'es': '',
    },
    '37xtwoc8': {
      'pt': 'Anexar uma apresentação:',
      'en': '',
      'es': '',
    },
    'gmttr4im': {
      'pt': 'Anexar uma avaliação:',
      'en': '',
      'es': '',
    },
    'fu8jjy2m': {
      'pt': 'Salvar',
      'en': '',
      'es': '',
    },
    'ct4g0a9g': {
      'pt': 'Listar',
      'en': '',
      'es': '',
    },
    '6mbd9orq': {
      'pt': 'Escolha um projeto para ver mais informações.',
      'en': '',
      'es': '',
    },
    'p34dt6yg': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'zpkdo0ww': {
      'pt': 'Convenção SEAL',
      'en': '',
      'es': '',
    },
    'eyl3anyy': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'qnifzot4': {
      'pt': 'IAP Arapiraca',
      'en': '',
      'es': '',
    },
    'xhoaxosc': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '87uruijs': {
      'pt': 'IAP Bugio',
      'en': '',
      'es': '',
    },
    'cmwf9g08': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'ucqjfr8i': {
      'pt': 'IAP Santos Dumont',
      'en': '',
      'es': '',
    },
    '6qek73rz': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'r4q8tolu': {
      'pt': 'Congregação IAP Capela',
      'en': '',
      'es': '',
    },
    'igyn3w5b': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '38q9dnun': {
      'pt': 'Aniversário IAP 2025',
      'en': '',
      'es': '',
    },
    'gpomjizm': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'wb99ux4o': {
      'pt': 'Coral IAP SEAL',
      'en': '',
      'es': '',
    },
    '91leicbr': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    '057btth0': {
      'pt': 'Grupo \"OS PIONEIROS\"',
      'en': '',
      'es': '',
    },
    '9ixal2ik': {
      'pt': 'Editar',
      'en': '',
      'es': '',
    },
    'hrq3gpoj': {
      'pt': 'Editar o Projeto',
      'en': '',
      'es': '',
    },
    '9szdxcf1': {
      'pt': 'Escolha um projeto ...',
      'en': '',
      'es': '',
    },
    'rpnyma0p': {
      'pt': 'Nome do Projeto',
      'en': '',
      'es': '',
    },
    '1v5mr0tv': {
      'pt': 'Digite um nome para o projeto ...',
      'en': '',
      'es': '',
    },
    'g0vhpao2': {
      'pt': 'Responsavel pelo projeto',
      'en': '',
      'es': '',
    },
    'n7zgtw8m': {
      'pt': 'Escolha o responsavel pelo projeto ...',
      'en': '',
      'es': '',
    },
    'cff65nb4': {
      'pt': 'Descrição do projeto',
      'en': '',
      'es': '',
    },
    'j5ccevhg': {
      'pt': 'Escreva uma breve descrição do projeto ...',
      'en': '',
      'es': '',
    },
    'gord2yo8': {
      'pt': 'Insira uma imagem/logotipo: ',
      'en': '',
      'es': '',
    },
    '30ctovlq': {
      'pt': 'Que o tipo de projeto?',
      'en': '',
      'es': '',
    },
    'rsxybh91': {
      'pt': 'Igreja',
      'en': '',
      'es': '',
    },
    '9h6hdoq6': {
      'pt': 'Congregação',
      'en': '',
      'es': '',
    },
    't0stgndm': {
      'pt': 'Evento',
      'en': '',
      'es': '',
    },
    'vvebqb2f': {
      'pt': 'Assembleia',
      'en': '',
      'es': '',
    },
    'rnlkgj82': {
      'pt': 'Grupo \"Os Pioneiros\"',
      'en': '',
      'es': '',
    },
    'pcajzkxd': {
      'pt': 'Ministério',
      'en': '',
      'es': '',
    },
    'p3i13ask': {
      'pt': 'Salvar',
      'en': '',
      'es': '',
    },
    'z2xbnl74': {
      'pt': 'Curso',
      'en': '',
      'es': '',
    },
  },
  // Material
  {
    'nz0h9vjc': {
      'pt': 'Materiais',
      'en': '',
      'es': '',
    },
    'ekg5lx0o': {
      'pt': 'Lista dos materiais',
      'en': '',
      'es': '',
    },
    '5hjhslo3': {
      'pt': 'Pesquisar todas as tarefas...',
      'en': '',
      'es': '',
    },
    'pax3y6l2': {
      'pt': 'Nome do material',
      'en': '',
      'es': '',
    },
    'obhv7mr9': {
      'pt': 'Autor',
      'en': '',
      'es': '',
    },
    'd43djq5g': {
      'pt': 'Incluido',
      'en': '',
      'es': '',
    },
    'btc82lp0': {
      'pt': 'Tipo',
      'en': '',
      'es': '',
    },
    'darogbg4': {
      'pt': 'Orientações sobre Empatia e Sensibilidade Social',
      'en': '',
      'es': '',
    },
    '852nyohu': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'bk6x23id': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'owt45vgb': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'tt0shtey': {
      'pt': 'Pago',
      'en': '',
      'es': '',
    },
    'y0wpa67s': {
      'pt': 'Curso de Primeiros Socorros e Segurança',
      'en': '',
      'es': '',
    },
    'n4cl0hrf': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'e1j9q03p': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'yg3u0gax': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'odnxzr8s': {
      'pt': 'Pago',
      'en': '',
      'es': '',
    },
    'tdbl9a8u': {
      'pt': 'Capacitação em Comunicação Interpessoal',
      'en': '',
      'es': '',
    },
    'hwktppm1': {
      'pt': 'Randy Rodriguez',
      'en': '',
      'es': '',
    },
    'ennnxcqu': {
      'pt': 'randy@domainname.com',
      'en': '',
      'es': '',
    },
    'u1035ebk': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    'bifjsjud': {
      'pt': 'Gratis',
      'en': '',
      'es': '',
    },
    'difd5bfm': {
      'pt': 'Oficina de Liderança e Trabalho em Equipe',
      'en': '',
      'es': '',
    },
    '05065ecl': {
      'pt': 'Emily Rambo',
      'en': '',
      'es': '',
    },
    'kwzutekc': {
      'pt': 'emily@domain.com',
      'en': '',
      'es': '',
    },
    'afa2zi82': {
      'pt': 'June 5th',
      'en': '',
      'es': '',
    },
    '6n41226h': {
      'pt': 'Gratis',
      'en': '',
      'es': '',
    },
    '63or54xs': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // Pergunta
  {
    'vj2bczyk': {
      'pt': 'Pergunta',
      'en': '',
      'es': '',
    },
    'mpfjdb9k': {
      'pt': 'Criar',
      'en': '',
      'es': '',
    },
    '7hhsjnpu': {
      'pt': 'Nome do Projeto',
      'en': '',
      'es': '',
    },
    'fi1h1frl': {
      'pt': 'Digite um nome para o curso ...',
      'en': '',
      'es': '',
    },
    'a50w0on3': {
      'pt': 'Area do curso:',
      'en': '',
      'es': '',
    },
    'j0z56xb2': {
      'pt': 'Grupo \"Os Pioneiros\"',
      'en': '',
      'es': '',
    },
    '84596l3o': {
      'pt': 'Liderança',
      'en': '',
      'es': '',
    },
    'cnjx1my0': {
      'pt': 'Evangelismo',
      'en': '',
      'es': '',
    },
    '3ypwigwn': {
      'pt': 'Igreja Adventista da Promessa',
      'en': '',
      'es': '',
    },
    'htb0xqdh': {
      'pt': 'Biblia Sagrada',
      'en': '',
      'es': '',
    },
    't3e992vd': {
      'pt': 'Crianças e adolescentes',
      'en': '',
      'es': '',
    },
    'pvpodwtg': {
      'pt': 'Inclusão',
      'en': '',
      'es': '',
    },
    'wrg3oic4': {
      'pt': 'Capelania',
      'en': '',
      'es': '',
    },
    '15ftvtlm': {
      'pt': 'Arte do Mato',
      'en': '',
      'es': '',
    },
    'fnou0m12': {
      'pt': 'Musica e artes',
      'en': '',
      'es': '',
    },
    'pey2ymhm': {
      'pt': 'Jovens',
      'en': '',
      'es': '',
    },
    'i4ejc3uo': {
      'pt': 'Homens',
      'en': '',
      'es': '',
    },
    'hp7mo8yd': {
      'pt': 'Mulheres',
      'en': '',
      'es': '',
    },
    'bzk2njtk': {
      'pt': 'Assistencia humanitaria',
      'en': '',
      'es': '',
    },
    'm8rugetq': {
      'pt': 'Educação cristã',
      'en': '',
      'es': '',
    },
    'lz5n2q12': {
      'pt': 'Grupo \"Os Pioneiros\"',
      'en': '',
      'es': '',
    },
    'hhena7l3': {
      'pt': 'Anexar um video (Maximo 500mb): ',
      'en': '',
      'es': '',
    },
    'rujrx75o': {
      'pt': 'Anexar um audio (mp3):',
      'en': '',
      'es': '',
    },
    'gc4hevkc': {
      'pt': 'Anexar arquivo em PDF:',
      'en': '',
      'es': '',
    },
    'rtrzhy9u': {
      'pt': 'Anexar uma apresentação:',
      'en': '',
      'es': '',
    },
    'gzgiz1d3': {
      'pt': 'Anexar uma avaliação:',
      'en': '',
      'es': '',
    },
    'wtfiew4i': {
      'pt': 'Salvar',
      'en': '',
      'es': '',
    },
    '5e08lw7h': {
      'pt': 'Listar',
      'en': '',
      'es': '',
    },
    'qlnowtez': {
      'pt': 'Escolha um projeto para ver mais informações.',
      'en': '',
      'es': '',
    },
    'gef0bxbx': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'ywg2r53i': {
      'pt': 'Convenção SEAL',
      'en': '',
      'es': '',
    },
    'dllpagse': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'aoxuycm0': {
      'pt': 'IAP Arapiraca',
      'en': '',
      'es': '',
    },
    'b4x6w11c': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'nlkklvmd': {
      'pt': 'IAP Bugio',
      'en': '',
      'es': '',
    },
    'ejo4h9yz': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'oxud9s92': {
      'pt': 'IAP Santos Dumont',
      'en': '',
      'es': '',
    },
    '3ofxmkvi': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'bqfv418r': {
      'pt': 'Congregação IAP Capela',
      'en': '',
      'es': '',
    },
    'p47p9uzr': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'wniml2ta': {
      'pt': 'Aniversário IAP 2025',
      'en': '',
      'es': '',
    },
    'tx6zdw7z': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'oi8gtuek': {
      'pt': 'Coral IAP SEAL',
      'en': '',
      'es': '',
    },
    '3yq8gm36': {
      'pt': 'A',
      'en': '',
      'es': '',
    },
    'ft03vxh4': {
      'pt': 'Grupo \"OS PIONEIROS\"',
      'en': '',
      'es': '',
    },
    '89ubiaqu': {
      'pt': 'Editar',
      'en': '',
      'es': '',
    },
    'u7vcbp9t': {
      'pt': 'Editar o Projeto',
      'en': '',
      'es': '',
    },
    'omqdi6tz': {
      'pt': 'Escolha um projeto ...',
      'en': '',
      'es': '',
    },
    '1wh9iroz': {
      'pt': 'Nome do Projeto',
      'en': '',
      'es': '',
    },
    'r1vag2km': {
      'pt': 'Digite um nome para o projeto ...',
      'en': '',
      'es': '',
    },
    'udevysqo': {
      'pt': 'Responsavel pelo projeto',
      'en': '',
      'es': '',
    },
    '73ulhai4': {
      'pt': 'Escolha o responsavel pelo projeto ...',
      'en': '',
      'es': '',
    },
    '6mvy4lkt': {
      'pt': 'Descrição do projeto',
      'en': '',
      'es': '',
    },
    'uwa5evkw': {
      'pt': 'Escreva uma breve descrição do projeto ...',
      'en': '',
      'es': '',
    },
    '6t04ev83': {
      'pt': 'Insira uma imagem/logotipo: ',
      'en': '',
      'es': '',
    },
    'rz68kz27': {
      'pt': 'Que o tipo de projeto?',
      'en': '',
      'es': '',
    },
    'j353vfz3': {
      'pt': 'Igreja',
      'en': '',
      'es': '',
    },
    'hghq61fm': {
      'pt': 'Congregação',
      'en': '',
      'es': '',
    },
    'i4nd4p9z': {
      'pt': 'Evento',
      'en': '',
      'es': '',
    },
    '1dfn61is': {
      'pt': 'Assembleia',
      'en': '',
      'es': '',
    },
    '9cdxvex3': {
      'pt': 'Grupo \"Os Pioneiros\"',
      'en': '',
      'es': '',
    },
    'ouhbfcae': {
      'pt': 'Ministério',
      'en': '',
      'es': '',
    },
    'dp22i8dq': {
      'pt': 'Salvar',
      'en': '',
      'es': '',
    },
    'w8gcqwrf': {
      'pt': 'Curso',
      'en': '',
      'es': '',
    },
  },
  // PageMaterial
  {
    'qserogip': {
      'pt': 'Material',
      'en': '',
      'es': '',
    },
    'qag9d7ba': {
      'pt': 'Criar',
      'en': '',
      'es': '',
    },
    '541hfpd5': {
      'pt': 'Identificação do material',
      'en': '',
      'es': '',
    },
    'ekw3ae3p': {
      'pt': 'Digite um nome para o material ...',
      'en': '',
      'es': '',
    },
    'g2vrj78y': {
      'pt': 'Autor do material',
      'en': '',
      'es': '',
    },
    'l3r4cs2k': {
      'pt': 'Nome do criador do conteudo ...',
      'en': '',
      'es': '',
    },
    '2mx08a7s': {
      'pt': 'Qual o tipo do material? ',
      'en': '',
      'es': '',
    },
    'v62n7jqv': {
      'pt': 'Apostila em PDF',
      'en': '',
      'es': '',
    },
    '08dily7h': {
      'pt': 'Apostila em PDF',
      'en': '',
      'es': '',
    },
    'l05qaf1y': {
      'pt': 'Aula em video ',
      'en': '',
      'es': '',
    },
    '4emwifsi': {
      'pt': 'Apresentações de slides',
      'en': '',
      'es': '',
    },
    '4a1chmaj': {
      'pt': 'Recursos de áudio',
      'en': '',
      'es': '',
    },
    'xd77flss': {
      'pt': 'Option 1',
      'en': '',
      'es': '',
    },
    'npagsh7r': {
      'pt': 'Option 1',
      'en': '',
      'es': '',
    },
    'qybco1zj': {
      'pt': 'Option 2',
      'en': '',
      'es': '',
    },
    '9kohnem2': {
      'pt': 'Option 3',
      'en': '',
      'es': '',
    },
    'zhjs9ml2': {
      'pt': 'Anexar conteudo escolhido',
      'en': '',
      'es': '',
    },
    'vb111fpy': {
      'pt': 'Qual o criterio de avaliação? ',
      'en': '',
      'es': '',
    },
    'w796aqb3': {
      'pt': 'Assistir ao conteudo',
      'en': '',
      'es': '',
    },
    't8nmtwcw': {
      'pt': 'Assistir ao conteudo',
      'en': '',
      'es': '',
    },
    'ddl5t5ty': {
      'pt': 'Escrever resumo',
      'en': '',
      'es': '',
    },
    'ty2cugq2': {
      'pt': 'Assinar termo de leitura',
      'en': '',
      'es': '',
    },
    'o5bjjbnt': {
      'pt': 'Questionario',
      'en': '',
      'es': '',
    },
    'sln8vhnt': {
      'pt': 'Anexar avaliação',
      'en': '',
      'es': '',
    },
    'd95h015r': {
      'pt': 'Incluir Material',
      'en': '',
      'es': '',
    },
    '81x7bhkj': {
      'pt': 'Listar',
      'en': '',
      'es': '',
    },
    'yqvyphww': {
      'pt': 'Apresentação',
      'en': '',
      'es': '',
    },
    'bt7exqnz': {
      'pt': 'Audio',
      'en': '',
      'es': '',
    },
    'h5oxlung': {
      'pt': 'Texto',
      'en': '',
      'es': '',
    },
    'rykqdir0': {
      'pt': 'Video',
      'en': '',
      'es': '',
    },
    'bkfe7rzu': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'cj7764y1': {
      'pt': 'GOP',
      'en': '',
      'es': '',
    },
    'egbi930a': {
      'pt': 'Apostila Explorador',
      'en': '',
      'es': '',
    },
    'wg3k28w7': {
      'pt': 'GOP',
      'en': '',
      'es': '',
    },
    '2exldab4': {
      'pt': 'Apostila Aventureiro',
      'en': '',
      'es': '',
    },
    'oxa2c38l': {
      'pt': 'GOP',
      'en': '',
      'es': '',
    },
    '6ap2h0ws': {
      'pt': 'Apostila Discipulo',
      'en': '',
      'es': '',
    },
    '7mn9s0w8': {
      'pt': 'GOP',
      'en': '',
      'es': '',
    },
    'd822xnoq': {
      'pt': 'Apostila Aprendriz',
      'en': '',
      'es': '',
    },
    'oggnnlc7': {
      'pt': 'IAP',
      'en': '',
      'es': '',
    },
    'm75tycv2': {
      'pt': 'Apostila homiletica para leigos',
      'en': '',
      'es': '',
    },
    'b2sj0ajw': {
      'pt': 'INC',
      'en': '',
      'es': '',
    },
    'dmfjuhn0': {
      'pt': 'Apostila básica sobre libras',
      'en': '',
      'es': '',
    },
    'ouejk3dz': {
      'pt': 'M&A',
      'en': '',
      'es': '',
    },
    'vb1p1dtt': {
      'pt': 'Organização de ensaios ',
      'en': '',
      'es': '',
    },
    'o0j5kdft': {
      'pt': 'GOP',
      'en': '',
      'es': '',
    },
    'rflmw79p': {
      'pt': 'Cerimonia de Graduação SE/2025',
      'en': '',
      'es': '',
    },
    'rhd6ec1s': {
      'pt': 'Editar',
      'en': '',
      'es': '',
    },
    '2qgl970c': {
      'pt': 'Editar o Projeto',
      'en': '',
      'es': '',
    },
    '1qeigfm0': {
      'pt': 'Escolha um projeto ...',
      'en': '',
      'es': '',
    },
    'scsp2z4u': {
      'pt': 'Nome do Projeto',
      'en': '',
      'es': '',
    },
    'udzvcpzw': {
      'pt': 'Digite um nome para o projeto ...',
      'en': '',
      'es': '',
    },
    '3umf68cp': {
      'pt': 'Responsavel pelo projeto',
      'en': '',
      'es': '',
    },
    '9vtb0c1r': {
      'pt': 'Escolha o responsavel pelo projeto ...',
      'en': '',
      'es': '',
    },
    '9up172m8': {
      'pt': 'Descrição do projeto',
      'en': '',
      'es': '',
    },
    '5s8nacrh': {
      'pt': 'Escreva uma breve descrição do projeto ...',
      'en': '',
      'es': '',
    },
    'mdy2m24z': {
      'pt': 'Insira uma imagem/logotipo: ',
      'en': '',
      'es': '',
    },
    '3krgttsy': {
      'pt': 'Que o tipo de projeto?',
      'en': '',
      'es': '',
    },
    'old0u3ce': {
      'pt': 'Igreja',
      'en': '',
      'es': '',
    },
    'ukvrww07': {
      'pt': 'Congregação',
      'en': '',
      'es': '',
    },
    '1n0we0al': {
      'pt': 'Evento',
      'en': '',
      'es': '',
    },
    'nenopde8': {
      'pt': 'Assembleia',
      'en': '',
      'es': '',
    },
    'd8kbptdz': {
      'pt': 'Grupo \"Os Pioneiros\"',
      'en': '',
      'es': '',
    },
    'dfe47ia5': {
      'pt': 'Ministério',
      'en': '',
      'es': '',
    },
    'ou4lk65n': {
      'pt': 'Salvar',
      'en': '',
      'es': '',
    },
    'xgcttkyz': {
      'pt': 'Curso',
      'en': '',
      'es': '',
    },
  },
  // MinhasDuvidas
  {
    'q83k0ds1': {
      'pt': 'Tire suas dúvidas',
      'en': '',
      'es': '',
    },
    'frq4dgfy': {
      'pt': 'Frequentes',
      'en': '',
      'es': '',
    },
    'n98dlbum': {
      'pt':
          'Encontre respostas para perguntas comuns sobre nosso aplicativo e serviços.',
      'en': '',
      'es': '',
    },
    'nr885rzb': {
      'pt': 'Como faço para participar de um projeto?',
      'en': '',
      'es': '',
    },
    'ba69fv17': {
      'pt':
          'Yes, you can invite team members to your project. Open the project details page, tap on \'Team Members\', and then select \'Invite Member\'. Enter their email address or username to send an invitation. They\'ll receive a notification to join your project.',
      'en': '',
      'es': '',
    },
    'im36ko9y': {
      'pt': 'Como criar um novo projeto?',
      'en': '',
      'es': '',
    },
    '44rw77iq': {
      'pt':
          'No perfil de líder ou administrador, navegue até a página \'Projetos\' e\n toque no botão \'criar\'. Preencha os detalhes necessários, como nome do projeto, descrição e data de início. Depois de inserir todas as informações, toque em \'Criar Projeto\' para salvá-lo.',
      'en': '',
      'es': '',
    },
    'v7fixv2s': {
      'pt': 'Quem pode criar um novo projeto?',
      'en': '',
      'es': '',
    },
    's7insbv9': {
      'pt': 'Somente lideres ou administradores podem criar um novo projeto.',
      'en': '',
      'es': '',
    },
    'rn7br5xo': {
      'pt': 'Quem pode criar um novo projeto?',
      'en': '',
      'es': '',
    },
    'goeaathk': {
      'pt': 'Somente lideres ou administradores podem criar um novo projeto.',
      'en': '',
      'es': '',
    },
    'm2jtxhkx': {
      'pt': 'Quem pode criar um novo projeto?',
      'en': '',
      'es': '',
    },
    '17lh3za1': {
      'pt': 'Somente lideres ou administradores podem criar um novo projeto.',
      'en': '',
      'es': '',
    },
    'qvyvnobo': {
      'pt': 'Enviar',
      'en': '',
      'es': '',
    },
    'qgdanupr': {
      'pt':
          'Escreva sua pergunta ou dúvida sobre o sistema. Nossa equipe responderá o mais breve possível.',
      'en': '',
      'es': '',
    },
    'ro3pogo1': {
      'pt': 'Assunto',
      'en': '',
      'es': '',
    },
    '2yxqltb7': {
      'pt': 'Sua dúvida',
      'en': '',
      'es': '',
    },
    'uyqc7geu': {
      'pt': 'Anexar arquivo',
      'en': '',
      'es': '',
    },
    'yp3yt1l7': {
      'pt': 'Enviar Dúvida',
      'en': '',
      'es': '',
    },
    'sxx924eh': {
      'pt': 'Anteriores',
      'en': '',
      'es': '',
    },
    'hygnxzco': {
      'pt': 'Acompanhe suas dúvidas',
      'en': '',
      'es': '',
    },
    'o2tx7npc': {
      'pt': 'Problema ao gerar relatório',
      'en': '',
      'es': '',
    },
    'x04js82l': {
      'pt': 'Pendente',
      'en': '',
      'es': '',
    },
    '7xk8rz5l': {
      'pt': 'Enviada em 20/05/2023',
      'en': '',
      'es': '',
    },
    'gywzqqxx': {
      'pt': 'Como adicionar participantes?',
      'en': '',
      'es': '',
    },
    '7rhcc5xk': {
      'pt': 'Respondida',
      'en': '',
      'es': '',
    },
    't94sm71y': {
      'pt': 'Enviada em 15/05/2023',
      'en': '',
      'es': '',
    },
  },
  // BotaoMenu
  {
    'x7t7och9': {
      'pt': 'CLIENTES',
      'en': '',
      'es': '',
    },
  },
  // TituloRedePro
  {
    '5zzbn4eb': {
      'pt': 'Rede \nPromessa',
      'en': 'Promise Network',
      'es': 'Red de promesa',
    },
  },
  // BtnDoar
  {
    'gpi7957w': {
      'pt': 'Doar',
      'en': 'Donate',
      'es': 'Donar',
    },
  },
  // Miscellaneous
  {
    'mifxqny0': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '0r0b9mjc': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '1epyqc3f': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'x8ifkvwn': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'u4068lvu': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'g2ijr6rh': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'soaorswm': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'bkj2w215': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'sl2tgygr': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '6uibagd6': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'ruhsp1lm': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '6nh3o4tq': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'yeli2duk': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'bpu4l1f6': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'iedolg4e': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'b7fyjqou': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'yto0ocej': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'b266h03e': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '0o1bou1i': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '95wfckk1': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'egh2oays': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'x8hjl3q4': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'ra3nnje5': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'cwphp22c': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '75uj56wf': {
      'pt': '',
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
