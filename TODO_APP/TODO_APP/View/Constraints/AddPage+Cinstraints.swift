
import Foundation

extension AddToList{
    func constrainTextField(){
        addToTextView.translatesAutoresizingMaskIntoConstraints = false
    [
        addToTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        addToTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        addToTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        addToTextView.heightAnchor.constraint(equalToConstant: 200)
    ].forEach{ $0.isActive = true}
    }
    func constrainSaveButton(){
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        _ = saveButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 30, rightConstant: 30, widthConstant: 80, heightConstant: 60)
    }
}
