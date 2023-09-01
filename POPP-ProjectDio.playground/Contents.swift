import Foundation

// Protocolo para representar uma tarefa
protocol Task {
    var title: String { get }
    var completed: Bool { get set }
    func markAsCompleted()
}

// Struct para representar uma tarefa
struct TaskItem: Task {
    var title: String
    var completed: Bool = false
    
    func markAsCompleted() {
        // Marcar a tarefa como concluída
        print("Tarefa '\(title)' concluída.")
    }
}

// Enum para representar a prioridade de uma tarefa
enum Priority: Int {
    case low, medium, high
}

// Protocolo para representar uma lista de tarefas
protocol TaskList {
    var tasks: [Task] { get set }
    mutating func addTask(_ task: Task)
    func completeAllTasks()
}

// Struct para representar uma lista de tarefas
struct TaskListManager: TaskList {
    var tasks: [Task] = []
    
    mutating func addTask(_ task: Task) {
        tasks.append(task)
        print("Tarefa '\(task.title)' adicionada à lista.")
    }
    
    func completeAllTasks() {
        for task in tasks {
            task.markAsCompleted()
        }
    }
}

// Closure que cria e retorna uma tarefa com base na prioridade
let createTask: (String, Priority) -> Task = { title, priority in
    var newTask = TaskItem(title: title)
    
    switch priority {
    case .low:
        newTask.title = "🟢 " + title
    case .medium:
        newTask.title = "🟡 " + title
    case .high:
        newTask.title = "🔴 " + title
    }
    
    return newTask
}

// Criar uma lista de tarefas
var taskList = TaskListManager()

// Adicionar tarefas à lista
let task1 = createTask("Comprar mantimentos", .medium)
let task2 = createTask("Lavar o carro", .low)
let task3 = createTask("Pagar contas", .high)

taskList.addTask(task1)
taskList.addTask(task2)
taskList.addTask(task3)

// Completar todas as tarefas na lista
taskList.completeAllTasks()
