import UIKit

class Details: UIViewController {
    var coordinator: MainCoordinator?
    var viewModel: TodoViewModel?
    var id: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        addConstraints()
        let backButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveTodo))
        navigationItem.rightBarButtonItem = backButton
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationItem()
    }
    lazy var detailsTextView: UITextView = {
        var detailsTextView = UITextView()
        detailsTextView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        detailsTextView.layer.cornerRadius = 5
        detailsTextView.layer.borderColor = UIColor.lightGray.cgColor
        detailsTextView.layer.borderWidth = 1
        detailsTextView.font = UIFont.systemFont(ofSize: 20)
        detailsTextView.backgroundColor = .clear
        return detailsTextView
    }()
    func addConstraints() {
        view.addSubview(detailsTextView)
        detailsTextView.translatesAutoresizingMaskIntoConstraints = false
        [
            detailsTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailsTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailsTextView.heightAnchor.constraint(equalToConstant: 300)
        ].forEach { $0.isActive = true}
    }
    func setup(text: String?) {
        detailsTextView.text = text
    }
    func updateTodo() {
        if let id = id, let text = detailsTextView.text {
            viewModel?.updateTodoText(with: TodoItem(id: id, text: text, isDone: false))
        }
    }
    @objc
    func saveTodo() {
        updateTodo()
        coordinator?.goBackToHome()
    }
}
