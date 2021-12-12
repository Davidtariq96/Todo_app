import UIKit

class AddToList: UIViewController {
    var coordinate: MainCoordinator?
    var textViewHeight = NSLayoutConstraint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
       }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

//
//        textViewHeight.constant = self.addToTextView.contentSize.height
        self.navigationConfig()
       
    }
    lazy var addToTextView: UITextView = {
        var addTextView = UITextView()
        addTextView.layer.borderColor = UIColor.lightGray.cgColor
        addTextView.layer.borderWidth = 1
        addTextView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        addTextView.layer.cornerRadius = 5
        addTextView.text = "Lets go to maldives, It's an exciting place to be they say...No doubt it is I responded, We should also consider going to Paris for the new yeaa eve"
        addTextView.frame = CGRect(x: 0, y: 0, width: 200, height: 500)
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
         return button
     }()
    
    func configureView(){
        view.addSubview(addToTextView)
        view.addSubview(saveButton)
        constrainTextField()
        constrainSaveButton()
    }
   
}

