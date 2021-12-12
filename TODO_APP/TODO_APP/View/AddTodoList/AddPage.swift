import UIKit

class AddToList: UIViewController {
    var coordinator: MainCoordinator?
    var viewModel: TodoViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationConfig()
    }
    
    lazy var addToListTextField: LeftPaddedTextField = {
        var textField = LeftPaddedTextField()
        textField.placeholder = "click here to add to list"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        textField.layer.cornerRadius = 5
        return textField
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
    
    func configureView(){
        view.addSubview(addToListTextField)
        view.addSubview(saveButton)
        constrainTextField()
        constrainSaveButton()
    }
    
    @objc
    func saveTodoItem() {
        if let addTextField = addToListTextField.text, addTextField != "" {
            viewModel?.saveTodoItem(with: TodoItem(id: 0, text: addTextField, isDone: false))
            coordinator?.goBackToHome()
        } else {
            //display and error validation message
            print("Error Message Here")
        }
    }
}

