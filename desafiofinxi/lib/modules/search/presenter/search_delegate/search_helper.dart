import 'package:flutter/material.dart';

class SearchHelper {
  String _noResult = "Nenhum resultado para a pesquisa.";
  String _dataFail = "Não foi possível retornar dados.";
  String _verifyConection = "Verifique sua conexão.";

  Widget noResult(){
    return Center(
      child: Text(
        _noResult,
        style: TextStyle(
            fontSize: 20
        ),
      ),
    );
  }

  Widget dataFail(){
    return Center(
      child: Text(
        _dataFail,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget verifyConnection(){
    return Center(
      child: Text(
        _verifyConection,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}