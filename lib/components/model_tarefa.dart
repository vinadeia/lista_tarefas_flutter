class ModelTarefa {
  int? prioridade;
  String? descricao;
  String? nome;
  String? responsavel;
  String? status;


  ModelTarefa({
    this.prioridade,
    this.descricao,
    this.nome,
    this.responsavel,
    this.status
  });
}

class ListaTarefasModel {
  List<ModelTarefa> listaTarefas = [
    ModelTarefa(prioridade: 1, descricao: 'qualquer coisa', nome: 'teste tarefa',responsavel: 'Adriana', status: 'aberto'),
    ModelTarefa(prioridade: 1, descricao: 'qualquer coisa', nome: 'teste tarefa',responsavel: 'Adriana', status: 'aberto'),
    ModelTarefa(prioridade: 1, descricao: 'qualquer coisa', nome: 'teste tarefa',responsavel: 'Adriana', status: 'aberto'),
    ModelTarefa(prioridade: 1, descricao: 'qualquer coisa', nome: 'teste tarefa',responsavel: 'Adriana', status: 'aberto'),
    ModelTarefa(prioridade: 1, descricao: 'qualquer coisa', nome: 'teste tarefa',responsavel: 'Adriana', status: 'aberto'),
    ModelTarefa(prioridade: 1, descricao: 'qualquer coisa', nome: 'teste tarefa',responsavel: 'Adriana', status: 'aberto'),
    ModelTarefa(prioridade: 1, descricao: 'qualquer coisa', nome: 'teste tarefa',responsavel: 'Adriana', status: 'aberto'),
    ModelTarefa(prioridade: 1, descricao: 'qualquer coisa', nome: 'teste tarefa',responsavel: 'Adriana', status: 'aberto'),
    ModelTarefa(prioridade: 1, descricao: 'qualquer coisa', nome: 'teste tarefa',responsavel: 'Adriana', status: 'aberto'),
    ModelTarefa(prioridade: 1, descricao: 'qualquer coisa', nome: 'teste tarefa',responsavel: 'Adriana', status: 'aberto'),
    ModelTarefa(prioridade: 1, descricao: 'qualquer coisa', nome: 'teste tarefa',responsavel: 'Adriana', status: 'aberto'),
    ModelTarefa(prioridade: 1, descricao: 'qualquer coisa', nome: 'teste tarefa',responsavel: 'Adriana', status: 'aberto'),
  ];
}