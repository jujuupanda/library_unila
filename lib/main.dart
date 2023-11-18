import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_unila/app.dart';
import 'package:library_unila/src/data/blocs/auth/auth_bloc.dart';
import 'package:library_unila/src/data/blocs/circulation/history/history_bloc.dart';
import 'package:library_unila/src/data/blocs/circulation/status/status_bloc.dart';
import 'package:library_unila/src/data/blocs/opac/author/author_bloc.dart';
import 'package:library_unila/src/data/blocs/opac/item_book/item_book_bloc.dart';
import 'package:library_unila/src/data/blocs/opac/opac_bloc.dart';
import 'package:library_unila/src/data/blocs/update/password/password_bloc.dart';
import 'package:library_unila/src/data/blocs/update/user_information/user_info_bloc.dart';
import 'package:library_unila/src/data/blocs/user/user_bloc.dart';
import 'package:library_unila/src/data/repositories/auth_repository/auth_repository.dart';
import 'package:library_unila/src/data/repositories/circulation_repositories/history_repository.dart';
import 'package:library_unila/src/data/repositories/opac_repositories/opac_repository.dart';
import 'package:library_unila/src/data/repositories/user_repository/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Wrap with multi bloc provider and multi repository provider
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => AuthRepository(),
          ),
          RepositoryProvider(
            create: (context) => UserRepository(),
          ),
          RepositoryProvider(
            create: (context) => OpacRepository(),
          ),
          RepositoryProvider(
            create: (context) => CirculationRepository(),
          ),
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => AuthBloc(repository: AuthRepository()),
          ),
          BlocProvider(
            create: (context) => UserBloc(repository: UserRepository()),
          ),
          BlocProvider(
            create: (context) => UserInfoBloc(repository: UserRepository()),
          ),
          BlocProvider(
            create: (context) => PasswordBloc(repository: UserRepository()),
          ),
          BlocProvider(
            create: (context) => OpacBloc(repository: OpacRepository()),
          ),
          BlocProvider(
            create: (context) => ItemBookBloc(repository: OpacRepository()),
          ),
          BlocProvider(
            create: (context) => AuthorBloc(repository: OpacRepository()),
          ),
          BlocProvider(
            create: (context) => HistoryBloc(repository: CirculationRepository()),
          ),
          BlocProvider(
            create: (context) => StatusBloc(repository: CirculationRepository()),
          ),
        ], child: const Apps()));
  }
}
