
import UIKit

class TodoViewCell: UITableViewCell {
    let vc = ViewController()
    var coordinate : MainCoordinator?
    lazy var tickButton = UIButton()
    lazy var todoTextField = LeftPaddedTextField()
    lazy var deleteButton = UIButton()
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        self.backgroundColor = UIColor(patternImage: UIImage(named: "addPageImage")!)
     }
    
    
    func configureTickButton(){
        tickButton.setImage(UIImage(named: "leftImage"), for: .normal)
        tickButton.clipsToBounds = true
       }
    
    func configureTodoLabel(){
        todoTextField.text = "Knock Thomas"
        todoTextField.textColor = .label
        todoTextField.adjustsFontSizeToFitWidth = true
        todoTextField.isUserInteractionEnabled = true
    }
   
    func configureDeleteButton(){
        deleteButton.setImage(UIImage(named: "deleteImage"), for: .normal)
        deleteButton.clipsToBounds = false
       }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
