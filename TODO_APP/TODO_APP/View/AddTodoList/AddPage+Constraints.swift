
import Foundation

extension AddToList{
    func constrainTextField(){
        addToTextView.translatesAutoresizingMaskIntoConstraints = false
       _ = addToTextView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 120, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    func constrainSaveButton(){
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        _ = saveButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 30, rightConstant: 30, widthConstant: 80, heightConstant: 60)
    }
}
