// Definindo uma enumeração para as prioridades das tarefas
enum Priority: String {
    case low
    case normal
    case high
}

// Definindo uma struct para representar uma tarefa
struct Task {
    var title: String
    var priority: Priority
}

// Criando uma classe para representar uma lista de tarefas
class ToDoList {
    var tasks: [Task] = []
    
    // Método para adicionar uma tarefa à lista
    func addTask(task: Task) {
        tasks.append(task)
    }
    
    // Método para listar todas as tarefas na lista
    func listTasks() {
        for task in tasks {
            print("Tarefa: \(task.title), Prioridade: \(task.priority.rawValue)")
        }
    }
    
    // Método para filtrar tarefas por prioridade usando uma closure
    func filterTasks(byPriority priority: Priority) -> [Task] {
        let filteredTasks = tasks.filter { $0.priority == priority }
        return filteredTasks
    }
}

// Criando uma instância da lista de tarefas
let toDoList = ToDoList()

// Adicionando tarefas à lista
toDoList.addTask(task: Task(title: "Estudar Swift", priority: .high))
toDoList.addTask(task: Task(title: "Fazer compras", priority: .normal))
toDoList.addTask(task: Task(title: "Fazer exercícios", priority: .low))

// Listando todas as tarefas
print("Todas as tarefas:")
toDoList.listTasks()

// Filtrando tarefas por prioridade
let highPriorityTasks = toDoList.filterTasks(byPriority: .high)
print("\nTarefas de alta prioridade:")
for task in highPriorityTasks {
    print("Tarefa: \(task.title)")
}

// Utilizando concorrência para realizar uma tarefa em segundo plano
import Foundation

let backgroundQueue = DispatchQueue(label: "com.example.backgroundQueue")
backgroundQueue.async {
    print("\nRealizando tarefa em segundo plano...")
    sleep(2)
    print("Tarefa em segundo plano concluída.")
}
print("\nContinuando a execução no thread principal...")

// Mantendo o Playground em execução para que a tarefa em segundo plano tenha tempo de terminar
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
