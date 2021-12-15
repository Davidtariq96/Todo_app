import UIKit

class AddToList: UIViewController {
    var coordinator: MainCoordinator?
    var viewModel: TodoViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationConfig()
    }
    lazy var addToTextView: UITextView = {
    var addTextView = UITextView()
    addTextView.layer.borderColor = UIColor.lightGray.cgColor
    addTextView.layer.borderWidth = 1
    addTextView.backgroundColor = UIColor(white: 0.9, alpha: 1)
    addTextView.layer.cornerRadius = 5
    addTextView.font = UIFont.systemFont(ofSize: 20)
    addTextView.backgroundColor = .clear
    return addTextView
    }()
    lazy var saveButton: UIButton = {
         let button = UIButton(type: .custom)
         button.setTitle("Save to list", for: .normal)
         button.setTitleColor(.white, for: .normal)
         button.backgroundColor = UIColor(red: 11/255, green: 146/255, blue: 191/255, alpha: 1)
         button.layer.cornerRadius = 5
         button.layer.borderColor = UIColor.black.cgColor
         button.layer.borderWidth = 1
         button.addTarget(self, action: #selector(saveTodoItem), for: .touchUpInside)
         return button
     }()
    func configureView() {
        view.addSubview(addToTextView)
        view.addSubview(saveButton)
        constrainTextField()
        constrainSaveButton()
    }
    @objc
    func saveTodoItem() {
        if let addTextField = addToTextView.text, addTextField != "" {
            viewModel?.saveTodoItem(with: TodoItem(id: 0, text: addTextField, isDone: false))
            coordinator?.goBackToHome()
        }
    }
}
