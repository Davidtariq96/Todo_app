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
    lazy var detailsTextView: LeftPaddedTextField = {
        var textView = LeftPaddedTextField()
        textView.placeholder = "Details of your to-do list would be displayed here when you add one"
        textView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        textView.layer.cornerRadius = 5
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1
        textView.isEnabled = true
        return textView
    }()
    func addConstraints(){
        view.addSubview(detailsTextView)
        detailsTextView.translatesAutoresizingMaskIntoConstraints = false
        _ = detailsTextView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 100, leftConstant: 20, bottomConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 50)
    }
    
}


