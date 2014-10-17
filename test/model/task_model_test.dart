import 'package:unittest/unittest.dart';
//import 'package:dartlero/dartlero.dart';
import 'package:dartlero_exercice4/dartlero_exercice4.dart';

testTasks(Tasks tasks) {
  group("Testing Projects", () {
    setUp(() {
      var taskCount = 0;
      expect(tasks.length, equals(taskCount));

      var design = new Task();
      expect(design, isNotNull);
      design.nom = 'ToDoMVC Design';
      design.description = 
          'Creating a model of ToDoMVC concepts based on MagicBoxes.';
      tasks.add(design);
      expect(tasks.length, equals(++taskCount));

      var prototype = new Task();
      expect(prototype, isNotNull);
      prototype.nom = 'ToDoMVC Prototype';
      prototype.description =
          'Programming the meta model and the generic model.';
      tasks.add(prototype);
      expect(tasks.length, equals(++taskCount));

      var production = new Task();
      expect(production, isNotNull);
      production.nom = 'ToDoMVC';
      production.description =
          'Programming ToDoMVC.';
      tasks.add(production);
      expect(tasks.length, equals(++taskCount));
    });
    tearDown(() {
      tasks.clear();
      expect(tasks.isEmpty, isTrue);
    });
    test('Add task', () {
      var task = new Task();
      expect(task, isNotNull);
      task.nom = 'Toto';
      task.description = 'model framework for exercise';
      var added = tasks.add(task);
      expect(added, isTrue);
      tasks.display('Add task');
    });
    test('Add task Without Data', () {
      var taskcount = tasks.length;
      var task = new Task();
      expect(task, isNotNull);
      var added = tasks.add(task);
      expect(added, isTrue);
      tasks.display('Add task Without Data');
    });
    test('Add Project Not Unique', () {
      var taskcount = tasks.length;
      var task = new Task();
      expect(task, isNotNull);
      task.nom = 'ToDoMVC';
      var added = tasks.add(task);
      expect(added, isFalse);
      tasks.display('Add Task Not Unique');
    });
    test('Find Task by Name', () {
      var searchName = 'ToDoMVC';
      var task = tasks.find(searchName);
      expect(task, isNotNull);
      expect(task.name, equals(searchName));
      task.display('Find Task by Name');
    });
    test('Select Tasks by Function', () {
      var programmingTasks = tasks.select((p) => p.onProgramming);
      expect(programmingTasks.isEmpty, isFalse);
      expect(programmingTasks.length, equals(2));
      programmingTasks.display('Select Projects by Function');
    });
    test('Select Tasks by Function then Remove', () {
      var taskcount = tasks.length;
      tasks.display('Tasks Before Remove');
      var programmingTasks = tasks.select((p) => p.onProgramming);
      expect(programmingTasks.isEmpty, isFalse);

      var searchName = 'ToDoMVC';
      var task = programmingTasks.find(searchName);
      expect(task, isNotNull);
      expect(task.nom, equals(searchName));
      var programmingTaskCount = programmingTasks.length;
      programmingTasks.remove(task);
      expect(programmingTasks.length, equals(--programmingTaskCount));
      expect(tasks.length, equals(taskcount));
    });
    test('Order Projects by Name', () {
      tasks.orderByFunction((m,n) => m.compareTo(n));
      tasks.display('Order Projects by Name');
    });
    test('Copy Tasks', () {
      Tasks copiedTasks = tasks.copy();
      expect(copiedTasks.isEmpty, isFalse);
      expect(copiedTasks.length, equals(tasks.length));
      expect(copiedTasks, isNot(same(tasks)));
      expect(copiedTasks, isNot(equals(tasks)));
      copiedTasks.forEach((cp) =>
          expect(cp, isNot(same(tasks.find(cp.nom)))));
      copiedTasks.display('Copied Tasks');
      //projects.display('Projects');
    });
    test('True for Every Task', () {
      expect(tasks.every((p) => p.code != null), isTrue);
      expect(tasks.every((p) => p.nom != null), isTrue);
    });
    test('From Projects to JSON', () {
      var json = tasks.toJson();
      expect(json, isNotNull);
      print(json);
    });
    test('From JSON to Project Model', () {
      List<Map<String, Object>> json = tasks.toJson();
      tasks.clear();
      expect(tasks.isEmpty, isTrue);
      tasks.fromJson(json);
      expect(tasks.isEmpty, isFalse);
      tasks.display('From JSON to Projects');
    });
  });
}

initDisplayModel() {
  TaskModel taskmodel = new TaskModel();
  taskmodel.init();
  taskmodel.display();
}

testModel() {
  TaskModel taskmodel = new TaskModel();
  Tasks tasks = taskmodel.tasks;
  testTasks(tasks);
}

main() {
  //initDisplayModel();
  testModel();
}
