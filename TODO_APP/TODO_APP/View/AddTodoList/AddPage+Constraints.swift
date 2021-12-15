
import Foundation

extension AddToList{
    func constrainTextField(){
        addToTextView.translatesAutoresizingMaskIntoConstraints = false
       _ = addToTextView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 300)
    }
    func constrainSaveButton(){
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        _ = saveButton.anchor(top: addToTextView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 0, rightConstant: 30, widthConstant: 80, heightConstant: 60)
    }
}
