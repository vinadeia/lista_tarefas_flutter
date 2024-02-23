class ModelTarefa {
  String? prioridade;
  String? descricao;
  String? tipo;
  String? responsavel;
  String? titulo;
  String? tempoDeterminado;
  bool? status;
  bool valueCheck = false;


  ModelTarefa({
    this.prioridade,
    this.descricao,
    this.tipo,
    this.responsavel,
    this.titulo,
    this.tempoDeterminado,
    this.status,
    required this.valueCheck,
  });
}