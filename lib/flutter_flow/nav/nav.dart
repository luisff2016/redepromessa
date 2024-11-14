import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier, [Widget? entryPage]) =>
    GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? entryPage ?? const NavBarPage() : const LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? entryPage ?? const NavBarPage()
              : const LoginWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'QuizNecessidades',
          path: '/quizNecessidades',
          builder: (context, params) => const QuizNecessidadesWidget(),
        ),
        FFRoute(
          name: 'RelFinOrganizacao',
          path: '/relFinOrganizacao',
          requireAuth: true,
          builder: (context, params) => const RelFinOrganizacaoWidget(),
        ),
        FFRoute(
          name: 'CriarNotificacao',
          path: '/criarNotificacao',
          requireAuth: true,
          builder: (context, params) => const CriarNotificacaoWidget(),
        ),
        FFRoute(
          name: 'RecuperarSenha',
          path: '/recuperarSenha',
          builder: (context, params) => const RecuperarSenhaWidget(),
        ),
        FFRoute(
          name: 'MeuPerfil',
          path: '/meuPerfil',
          requireAuth: true,
          builder: (context, params) => const MeuPerfilWidget(),
        ),
        FFRoute(
          name: 'PgAdmin',
          path: '/pgAdmin',
          requireAuth: true,
          builder: (context, params) => const PgAdminWidget(),
        ),
        FFRoute(
          name: 'AlterarSenha',
          path: '/alterarSenha',
          requireAuth: true,
          builder: (context, params) => const AlterarSenhaWidget(),
        ),
        FFRoute(
          name: 'EditarUsuario',
          path: '/editarUsuario',
          requireAuth: true,
          builder: (context, params) => const EditarUsuarioWidget(),
        ),
        FFRoute(
          name: 'VerHistorico',
          path: '/verHistorico',
          requireAuth: true,
          builder: (context, params) => const VerHistoricoWidget(),
        ),
        FFRoute(
          name: 'RelatorioPessoal',
          path: '/relatorioPessoal',
          requireAuth: true,
          builder: (context, params) => const RelatorioPessoalWidget(),
        ),
        FFRoute(
          name: 'ListaProjetos',
          path: '/listaProjetos',
          requireAuth: true,
          builder: (context, params) => const ListaProjetosWidget(),
        ),
        FFRoute(
          name: 'VerProjeto',
          path: '/verProjeto',
          requireAuth: true,
          builder: (context, params) => const VerProjetoWidget(),
        ),
        FFRoute(
          name: 'Tutorial',
          path: '/tutorial',
          requireAuth: true,
          builder: (context, params) => const TutorialWidget(),
        ),
        FFRoute(
          name: 'ReportarBUG',
          path: '/reportarBUG',
          requireAuth: true,
          builder: (context, params) => const ReportarBUGWidget(),
        ),
        FFRoute(
          name: 'SugerirFuncionalidade',
          path: '/sugerirFuncionalidade',
          requireAuth: true,
          builder: (context, params) => const SugerirFuncionalidadeWidget(),
        ),
        FFRoute(
          name: 'VerProjetoAceito',
          path: '/verProjetoAceito',
          requireAuth: true,
          builder: (context, params) => const VerProjetoAceitoWidget(),
        ),
        FFRoute(
          name: 'PgLider',
          path: '/pgLider',
          requireAuth: true,
          builder: (context, params) => const PgLiderWidget(),
        ),
        FFRoute(
          name: 'MenuDoacoes',
          path: '/menuDoacoes',
          requireAuth: true,
          builder: (context, params) => const MenuDoacoesWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'HomePage')
              : const HomePageWidget(),
        ),
        FFRoute(
          name: 'ListarCursos',
          path: '/listarCursos',
          requireAuth: true,
          builder: (context, params) => const ListarCursosWidget(),
        ),
        FFRoute(
          name: 'CompartilharProjeto',
          path: '/compartilharProjeto',
          requireAuth: true,
          builder: (context, params) => const CompartilharProjetoWidget(),
        ),
        FFRoute(
          name: 'AvisoCompartilhar',
          path: '/avisoCompartilhar',
          requireAuth: true,
          builder: (context, params) => const AvisoCompartilharWidget(),
        ),
        FFRoute(
          name: 'GerenciarProjeto',
          path: '/gerenciarProjeto',
          requireAuth: true,
          builder: (context, params) => const GerenciarProjetoWidget(),
        ),
        FFRoute(
          name: 'ListarRequisitos',
          path: '/listarRequisitos',
          requireAuth: true,
          builder: (context, params) => const ListarRequisitosWidget(),
        ),
        FFRoute(
          name: 'HomeOrganizacao',
          path: '/homeOrganizacao',
          requireAuth: true,
          builder: (context, params) => const HomeOrganizacaoWidget(),
        ),
        FFRoute(
          name: 'AgendarAtividade',
          path: '/agendarAtividade',
          requireAuth: true,
          builder: (context, params) => const AgendarAtividadeWidget(),
        ),
        FFRoute(
          name: 'Calendario',
          path: '/calendario',
          requireAuth: true,
          builder: (context, params) => const CalendarioWidget(),
        ),
        FFRoute(
          name: 'DoacaoFinanceira',
          path: '/doacaoFinanceira',
          requireAuth: true,
          builder: (context, params) => const DoacaoFinanceiraWidget(),
        ),
        FFRoute(
          name: 'modeloCopy',
          path: '/modeloCopy',
          requireAuth: true,
          builder: (context, params) => const ModeloCopyWidget(),
        ),
        FFRoute(
          name: 'CriarCurso',
          path: '/criarCurso',
          requireAuth: true,
          builder: (context, params) => const CriarCursoWidget(),
        ),
        FFRoute(
          name: 'IncluirMaterialCurso',
          path: '/incluirMaterialCurso',
          requireAuth: true,
          builder: (context, params) => const IncluirMaterialCursoWidget(),
        ),
        FFRoute(
          name: 'EditarMaterialCurso',
          path: '/editarMaterialCurso',
          requireAuth: true,
          builder: (context, params) => const EditarMaterialCursoWidget(),
        ),
        FFRoute(
          name: 'ListarMaterial',
          path: '/listarMaterial',
          requireAuth: true,
          builder: (context, params) => const ListarMaterialWidget(),
        ),
        FFRoute(
          name: 'AnexarMaterial',
          path: '/anexarMaterial',
          requireAuth: true,
          builder: (context, params) => const AnexarMaterialWidget(),
        ),
        FFRoute(
          name: 'DoacaoAlimento',
          path: '/doacaoAlimento',
          requireAuth: true,
          builder: (context, params) => const DoacaoAlimentoWidget(),
        ),
        FFRoute(
          name: 'DoacaoLivro',
          path: '/doacaoLivro',
          requireAuth: true,
          builder: (context, params) => const DoacaoLivroWidget(),
        ),
        FFRoute(
          name: 'DoacaoBem',
          path: '/doacaoBem',
          requireAuth: true,
          builder: (context, params) => const DoacaoBemWidget(),
        ),
        FFRoute(
          name: 'DoacaoRoupa',
          path: '/doacaoRoupa',
          requireAuth: true,
          builder: (context, params) => const DoacaoRoupaWidget(),
        ),
        FFRoute(
          name: 'RegistroFinanceiro',
          path: '/registroFinanceiro',
          requireAuth: true,
          builder: (context, params) => const RegistroFinanceiroWidget(),
        ),
        FFRoute(
          name: 'EscolherProjetos',
          path: '/escolherProjetos',
          requireAuth: true,
          builder: (context, params) => const EscolherProjetosWidget(),
        ),
        FFRoute(
          name: 'EscolherAtividades',
          path: '/escolherAtividades',
          requireAuth: true,
          builder: (context, params) => const EscolherAtividadesWidget(),
        ),
        FFRoute(
          name: 'EscolherColaboradores',
          path: '/escolherColaboradores',
          requireAuth: true,
          builder: (context, params) => const EscolherColaboradoresWidget(),
        ),
        FFRoute(
          name: 'AvisoNotificacaoEnviada',
          path: '/avisoNotificacaoEnviada',
          requireAuth: true,
          builder: (context, params) => const AvisoNotificacaoEnviadaWidget(),
        ),
        FFRoute(
          name: 'MinhasNotificacoes',
          path: '/minhasNotificacoes',
          requireAuth: true,
          builder: (context, params) => const MinhasNotificacoesWidget(),
        ),
        FFRoute(
          name: 'AvisoNotificacaoApagada',
          path: '/avisoNotificacaoApagada',
          requireAuth: true,
          builder: (context, params) => const AvisoNotificacaoApagadaWidget(),
        ),
        FFRoute(
          name: 'RelatorioAtividade',
          path: '/relatorioAtividade',
          requireAuth: true,
          builder: (context, params) => const RelatorioAtividadeWidget(),
        ),
        FFRoute(
          name: 'GerenciarCurso',
          path: '/gerenciarCurso',
          requireAuth: true,
          builder: (context, params) => const GerenciarCursoWidget(),
        ),
        FFRoute(
          name: 'AgendarEncontroPresencial',
          path: '/agendarEncontroPresencial',
          requireAuth: true,
          builder: (context, params) => const AgendarEncontroPresencialWidget(),
        ),
        FFRoute(
          name: 'GerenciarMaterial',
          path: '/gerenciarMaterial',
          requireAuth: true,
          builder: (context, params) => const GerenciarMaterialWidget(),
        ),
        FFRoute(
          name: 'GerenciarEquipe',
          path: '/gerenciarEquipe',
          requireAuth: true,
          builder: (context, params) => const GerenciarEquipeWidget(),
        ),
        FFRoute(
          name: 'ListaParticipantes',
          path: '/listaParticipantes',
          requireAuth: true,
          builder: (context, params) => const ListaParticipantesWidget(),
        ),
        FFRoute(
          name: 'RelatorioProjeto',
          path: '/relatorioProjeto',
          requireAuth: true,
          builder: (context, params) => const RelatorioProjetoWidget(),
        ),
        FFRoute(
          name: 'ListarEquipe',
          path: '/listarEquipe',
          requireAuth: true,
          builder: (context, params) => const ListarEquipeWidget(),
        ),
        FFRoute(
          name: 'NomearLideres',
          path: '/nomearLideres',
          requireAuth: true,
          builder: (context, params) => const NomearLideresWidget(),
        ),
        FFRoute(
          name: 'AvisoDoacaoConfirmada',
          path: '/avisoDoacaoConfirmada',
          requireAuth: true,
          builder: (context, params) => const AvisoDoacaoConfirmadaWidget(),
        ),
        FFRoute(
          name: 'HomePioneiros',
          path: '/homePioneiros',
          builder: (context, params) => const HomePioneirosWidget(),
        ),
        FFRoute(
          name: 'ManualPioneiros',
          path: '/manualPioneiros',
          builder: (context, params) => const ManualPioneirosWidget(),
        ),
        FFRoute(
          name: 'CursosFormacao',
          path: '/cursosFormacao',
          requireAuth: true,
          builder: (context, params) => const CursosFormacaoWidget(),
        ),
        FFRoute(
          name: 'CursoDiscipulo',
          path: '/cursoDiscipulo',
          requireAuth: true,
          builder: (context, params) => const CursoDiscipuloWidget(),
        ),
        FFRoute(
          name: 'CursoExplorador',
          path: '/cursoExplorador',
          requireAuth: true,
          builder: (context, params) => const CursoExploradorWidget(),
        ),
        FFRoute(
          name: 'CursoAventureiro',
          path: '/cursoAventureiro',
          requireAuth: true,
          builder: (context, params) => const CursoAventureiroWidget(),
        ),
        FFRoute(
          name: 'CursoAprendiz',
          path: '/cursoAprendiz',
          requireAuth: true,
          builder: (context, params) => const CursoAprendizWidget(),
        ),
        FFRoute(
          name: 'QuizMusicos',
          path: '/quizMusicos',
          builder: (context, params) => const QuizMusicosWidget(),
        ),
        FFRoute(
          name: 'NivelAcesso',
          path: '/nivelAcesso',
          requireAuth: true,
          builder: (context, params) => const NivelAcessoWidget(),
        ),
        FFRoute(
          name: 'NivelAcessoCopy',
          path: '/nivelAcessoCopy',
          requireAuth: true,
          builder: (context, params) => const NivelAcessoCopyWidget(),
        ),
        FFRoute(
          name: 'DashboardOrganizacao',
          path: '/dashboardOrganizacao',
          requireAuth: true,
          builder: (context, params) => const DashboardOrganizacaoWidget(),
        ),
        FFRoute(
          name: 'HomeProjeto',
          path: '/homeProjeto',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'HomeProjeto')
              : const HomeProjetoWidget(),
        ),
        FFRoute(
          name: 'HomeAtividade',
          path: '/homeAtividade',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'HomeAtividade')
              : const HomeAtividadeWidget(),
        ),
        FFRoute(
          name: 'AjudaPerguntas',
          path: '/ajudaPerguntas',
          requireAuth: true,
          builder: (context, params) => const AjudaPerguntasWidget(),
        ),
        FFRoute(
          name: 'HomeRelatorio',
          path: '/homeRelatorio',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'HomeRelatorio')
              : const HomeRelatorioWidget(),
        ),
        FFRoute(
          name: 'HomeCurso',
          path: '/homeCurso',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'HomeCurso')
              : const HomeCursoWidget(),
        ),
        FFRoute(
          name: 'Material',
          path: '/material',
          requireAuth: true,
          builder: (context, params) => const MaterialWidget(),
        ),
        FFRoute(
          name: 'Pergunta',
          path: '/pergunta',
          requireAuth: true,
          builder: (context, params) => const PerguntaWidget(),
        ),
        FFRoute(
          name: 'PageMaterial',
          path: '/pageMaterial',
          requireAuth: true,
          builder: (context, params) => const PageMaterialWidget(),
        ),
        FFRoute(
          name: 'MinhasDuvidas',
          path: '/minhasDuvidas',
          requireAuth: true,
          builder: (context, params) => const MinhasDuvidasWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
