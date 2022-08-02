import 'dart:io';

class TaskViewModel {
  final int id;
  final String nome;
  final int dificuldade;
  final String foto;
  final String desc;

  TaskViewModel(this.id, this.nome, this.dificuldade, this.foto, this.desc);

  @override
  String toString() {
    return 'Task{nome: $nome,dificuldade:$dificuldade,foto:$foto, desc:$desc}';
  }

  TaskViewModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        dificuldade = json['dificuldade'],
        foto = json['foto'],
        desc = json['desc'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'dificuldade': dificuldade,
        'foto': foto,
        'desc': desc
      };
}
