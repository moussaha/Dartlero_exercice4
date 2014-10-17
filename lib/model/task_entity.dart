part of dartlero_exercice4;

class Task extends ConceptEntity<Task> {
  String _nom;
  String description;

  String get nom => _nom;
  set nom(String nom) {
    _nom = nom;
    if (code == null) {
      code = nom;
    }
  }

  Task newEntity() => new Task();

  Task copy() {
    var task = super.copy();
    task.nom = nom;
    task.description = description;
    return task;
  }

  String toString() {
    return '  {\n '
           '    ${super.toString()}, \n '
           '    nom: ${nom}, \n '
           '    description: ${description}\n'
           '  }';
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = super.toJson();
    entityMap['nom'] = nom;
    entityMap['description'] = description;
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    super.fromJson(entityMap);
    nom = entityMap['nom'];
    description = entityMap['description'];
  }

  bool get onProgramming =>
      description.contains('Programming') ? true : false;

  int compareTo(Task other) {
    return nom.compareTo(other.nom);
  }

}

class Tasks extends ConceptEntities<Task> {
  Tasks newEntities() => new Tasks();
  Task newEntity() => new Task();
}