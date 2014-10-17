part of dartlero_exercice4;

class TaskModel extends ConceptModel {

  static final String task = 'Task';

  Map<String, ConceptEntities> newEntries() {
    var tasks = new Task();
    var map = new Map<String, ConceptEntities>();
    map[task] = tasks;
    return map;
  }

  Tasks get tasks => getEntry(task);

  init() {
    var design = new Task();
    design.nom = 'Dartling Design';
    design.description =
        'Creating a model of Dartling concepts based on MagicBoxes.';
    tasks.add(design);

    var prototype = new Task();
    prototype.nom = 'Dartling Prototype';
    prototype.description =
        'Programming the meta model and the generic model.';
    tasks.add(prototype);

    var production = new Task();
    production.nom = 'Dartling';
    production.description =
        'Programming Dartling.';
    tasks.add(production);
  }

  display() {
    print('Project Model');
    print('=============');
    tasks.display('Tasks');
    print(
      '============= ============= ============= '
      '============= ============= ============= '
    );
  }

}