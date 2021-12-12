
import UIKit

extension TodoViewCell{
    
    func configureCell(){
        addSubview(tickButton)
        addSubview(todoTextField)
        addSubview(deleteButton)
        configureTickButton()
        configureTodoLabel()
        configureDeleteButton()
        setTickButtonConstraints()
        setTodoLabelConstraints()
        configureDeleteButton()
        setDeleteButtonConstraints()
    }
    
    func setTickButtonConstraints(){
        tickButton.translatesAutoresizingMaskIntoConstraints = false
        tickButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        tickButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        tickButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tickButton.widthAnchor.constraint(equalTo: tickButton.heightAnchor, multiplier: 16/9).isActive = true
    }
    func setTodoLabelConstraints(){
       todoTextField.translatesAutoresizingMaskIntoConstraints = false
        todoTextField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        todoTextField.leadingAnchor.constraint(equalTo: tickButton.trailingAnchor, constant: 8).isActive = true
        todoTextField.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor).isActive = true
        todoTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        todoTextField.widthAnchor.constraint(equalTo: todoTextField.heightAnchor, multiplier: 16/9).isActive = true
    }
    func setDeleteButtonConstraints(){
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
}
