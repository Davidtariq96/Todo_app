import UIKit

class TodoViewCell: UITableViewCell {
    let vc = ViewController()
    var coordinate : MainCoordinator?
    lazy var tickButton = UIButton()
    lazy var todoLabel = LeftPaddedLabel()
    lazy var deleteButton = UIButton()
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        self.backgroundColor = UIColor(patternImage: UIImage(named: "addPageImage")!)
     }
    
    func configureTickButton(){
        tickButton.setImage(UIImage(systemName: "circle"), for: .normal)
        tickButton.tintColor = .gray
        tickButton.clipsToBounds = true
       }
    
    func configureTodoLabel(){
        todoLabel.text = "Knock Thomas"
        todoLabel.textColor = .label
        todoLabel.adjustsFontSizeToFitWidth = true
    }
 
    func configureDeleteButton(){
        deleteButton.setImage(UIImage(named: "deleteImage"), for: .normal)
        deleteButton.tintColor = .gray
        deleteButton.clipsToBounds = false
       }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

