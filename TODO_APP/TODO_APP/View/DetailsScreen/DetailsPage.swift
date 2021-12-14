import UIKit

class Details: UIViewController {
    var coordinator: MainCoordinator?
    var viewModel: TodoViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addConstraints()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationItem()
        
    }
    lazy var detailsTextView:  UITextView = {
        var detailsTextView = UITextView()
        detailsTextView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        detailsTextView.layer.cornerRadius = 5
        detailsTextView.layer.borderColor = UIColor.lightGray.cgColor
        detailsTextView.layer.borderWidth = 1
        detailsTextView.font = UIFont.systemFont(ofSize: 20)
        detailsTextView.backgroundColor = .clear
        return detailsTextView
    }()
    
    func addConstraints(){
        view.addSubview(detailsTextView)
        detailsTextView.translatesAutoresizingMaskIntoConstraints = false
        [
            detailsTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailsTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailsTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ].forEach{ $0.isActive = true}
    }
    
    func setup(text: String?) {
        detailsTextView.text = text
    }
}


