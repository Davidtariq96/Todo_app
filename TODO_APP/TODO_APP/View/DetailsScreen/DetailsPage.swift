import UIKit

class Details: UIViewController {
    var coordinate: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addConstraints()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationItem()
        
    }
    lazy var emailTextField: LeftPaddedTextField = {
        var textField = LeftPaddedTextField()
        textField.placeholder = "Details would be displayed here when"
        textField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.isEnabled = false
        return textField
    }()
    func addConstraints(){
        view.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
       _ = emailTextField.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 100, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 50)
    }
    
}


