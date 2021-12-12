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

extension ViewController: UITableViewDelegate, UITableViewDataSource{
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
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    
        print ("cell has been tapped")
    }
    
    
}

