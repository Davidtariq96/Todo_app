import UIKit

class TodoViewCell: UITableViewCell {
    let tickButton = UIButton()
    let todoLabel = LeftPaddedLabel()
    let deleteButton = UIButton()
    var todoItem: TodoItem?
    var cellActions: CellActions?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        if let image = UIImage(named: "addPageImage") {
            self.backgroundColor = UIColor(patternImage: image)
        }
        deleteButton.addTarget(self, action: #selector(deleteTodoItem), for: .touchUpInside)
        tickButton.addTarget(self, action: #selector(toggleIsDone), for: .touchUpInside)
     }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configureTickButton() {
        tickButton.setImage(UIImage(systemName: "circle"), for: .normal)
        tickButton.tintColor = .gray
        tickButton.clipsToBounds = true
    }
    func configureTodoLabel() {
        todoLabel.textColor = .label
        todoLabel.adjustsFontSizeToFitWidth = false
        todoLabel.isEnabled = false
    }

    func configureDeleteButton() {
        deleteButton.setImage(UIImage(named: "deleteImage"), for: .normal)
        deleteButton.tintColor = .blue
        deleteButton.clipsToBounds = false
       }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        todoLabel.text = ""
    }
    @objc
    func deleteTodoItem() {
        if let id = todoItem?.id {
            cellActions?.deleteAction(id)
        }
    }
    @objc
    func toggleIsDone() {
        if var todoItem = todoItem {
            todoItem.isDone = !todoItem.isDone
            cellActions?.toggleAction(todoItem)
        }
    }
    func setup() {
        todoLabel.text = todoItem?.text
        toggle(isDone: todoItem?.isDone)
    }
    func toggle(isDone: Bool?) {
        if let isDone = isDone, isDone {
            tickButton.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        } else {
            tickButton.setImage(UIImage(systemName: "circle"), for: .normal)
        }
    }
}

protocol CellActions {
    func deleteAction(_ id: Int)
    func toggleAction(_ todoItem: TodoItem)
}
