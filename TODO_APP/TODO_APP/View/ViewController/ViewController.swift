import UIKit

class ViewController : UIViewController {

    var coordinator: MainCoordinator?
    var viewModel: TodoViewModel?
    
    let cell = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationItem()
        tableView.reloadData()
    }

    lazy var tableView: UITableView = {
       var tableView = UITableView()
        tableView.rowHeight = 70
        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "addPageImage")!)
        tableView.register(TodoViewCell.self, forCellReuseIdentifier: cell)
        return tableView
    }()
    
    func setTableViewDelegate(){
        tableView.delegate = self
        tableView .dataSource = self
    }
    func configureTableView(){
        setTableViewDelegate()
        addConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func addConstraints(){
        view.addSubview(tableView)
        tableView.pin(to: view)
    }
   
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.storage.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cell) as? TodoViewCell else {
            return UITableViewCell()
        }
        guard let todoItem = viewModel?.storage[indexPath.row] else {
            return cell
        }
        cell.todoItem = todoItem
        cell.cellActions = self
        cell.setup()
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let id = viewModel?.storage[indexPath.row].id;
        if let id = id {
            coordinator?.openDetail(of: id)
        }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let toggleAction = UIContextualAction(style: .normal, title: "Update") {[weak self] (action, view, handler) in
            self?.toggle(indexPath)
        }
        toggleAction.backgroundColor = .green
        let configuration = UISwipeActionsConfiguration(actions: [toggleAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {[weak self] (action, view, handler) in
            self?.delete(indexPath)
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        
        return configuration
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func toggle(_ indexPath: IndexPath) {
        if let id = viewModel?.storage[indexPath.row].id, var todo = viewModel?.getOneItem(with: id){
            todo.isDone = !todo.isDone
            viewModel?.upadateTodoIsDone(with: todo)
            tableView.reloadData()
        }
    }
    
    func delete(_ indexPath: IndexPath) {
        if let id = viewModel?.storage[indexPath.row].id {
            viewModel?.deleteTodoItem(with: id)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
    
    
}

extension ViewController: CellActions {
    func deleteAction(_ id: Int) {
        viewModel?.deleteTodoItem(with: id)
        tableView.reloadData()
    }
    
    func toggleAction(_ todoItem: TodoItem) {
        viewModel?.upadateTodoIsDone(with: todoItem)
        tableView.reloadData()
    }
    
    
}
