
import Foundation

extension AddToList{
    func constrainTextField(){
        addToTextView.translatesAutoresizingMaskIntoConstraints = false
        _ = addToTextView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 100, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 50)
    }
    func constrainSaveButton(){
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        _ = saveButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 30, rightConstant: 30, widthConstant: 80, heightConstant: 60)
    }
}
