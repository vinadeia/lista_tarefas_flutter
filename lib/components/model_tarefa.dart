class ModelTarefa {
  String? prioridade;
  String? descricao;
  String? tipo;
  String? responsavel;
  bool? status;
  bool valueCheck = false;


  ModelTarefa({
    this.prioridade,
    this.descricao,
    this.tipo,
    this.responsavel,
    this.status,
    required this.valueCheck
  });
}

class ListaTarefasModel {
  List<ModelTarefa> listaTarefas = [];
}