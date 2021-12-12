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
        var detailsTextView = LeftPaddedTextField()
        detailsTextView.placeholder = "This Details will be saved. apparently, it depends on thomas"
        detailsTextView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        detailsTextView.layer.cornerRadius = 5
        detailsTextView.layer.borderColor = UIColor.lightGray.cgColor
        detailsTextView.layer.borderWidth = 1
        detailsTextView.frame = CGRect(x: 0, y: 0, width: 200, height: 500)
        detailsTextView.font = UIFont.systemFont(ofSize: 20)
        detailsTextView.backgroundColor = .clear
        
        detailsTextView.isEnabled = true
        return detailsTextView
    }()
    func addConstraints(){
        view.addSubview(detailsTextView)
        detailsTextView.translatesAutoresizingMaskIntoConstraints = false
        _ = [
            detailsTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailsTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailsTextView.heightAnchor.constraint(equalToConstant: 200)
        ].forEach{ $0.isActive = true}
    }
    
}


