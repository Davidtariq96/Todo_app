
import UIKit

class TodoViewCell: UITableViewCell {
    let tickButton = UIButton()
    let todoTextField = LeftPaddedTextField()
    let deleteButton = UIButton()
    var todoItem: TodoItem?
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        if let image = UIImage(named: "addPageImage") {
            self.backgroundColor = UIColor(patternImage: image)
        }
        deleteButton.addTarget(self, action: #selector(deleteTodoItem), for: .touchUpInside)
        tickButton.addTarget(self, action: #selector(toggleIsDone), for: .touchUpInside)
     }
    
    
    func configureTickButton(){
        tickButton.setImage(UIImage(named: "leftImage"), for: .normal)
        tickButton.clipsToBounds = true
       }
    
    func configureTodoLabel(){
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
    
    @objc
    func deleteTodoItem() {
        print("delete for row \(todoItem?.id) is clicked")
    }
    
    @objc
    func toggleIsDone() {
        print("toggle for row \(todoItem?.id) is clicked")
    }
    
    func setup() {
        todoTextField.text = todoItem?.text
        toggle(isDone: todoItem?.isDone)
    }
    
    func toggle(isDone: Bool?) {
        if let isDone = isDone, isDone {
            tickButton.setImage(UIImage(named: "leftImage"), for: .normal)
        } else {
            tickButton.setImage(UIImage(named: "leftImage"), for: .normal)
        }
    }
}