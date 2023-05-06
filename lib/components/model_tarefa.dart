class ModelTarefa {
  String? prioridade;
  String? descricao;
  String? tipo;
  String? responsavel;
  bool? status;


  ModelTarefa({
    this.prioridade,
    this.descricao,
    this.tipo,
    this.responsavel,
    this.status
  });
}

class ListaTarefasModel {
  List<ModelTarefa> listaTarefas = [];
}