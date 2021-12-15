import UIKit

extension ViewController {
    func setNavigationItem() {
        navigationController?.navigationBar.tintColor = UIColor(red: 11/255, green: 146/255, blue: 191/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes =
        [.foregroundColor: UIColor(red: 11/255, green: 146/255, blue: 191/255, alpha: 1)]
        title = "Your todo List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self, action: #selector(didTap))
    }
    @objc func didTap() {
        coordinator?.openAdd()
    }
}

extension Details {
    func setNavigationItem() {
        navigationController?.navigationBar.topItem?.title = ""
        title = "Details"
        view.backgroundColor = UIColor(patternImage: UIImage(named: "addPageImage")!)
        navigationController?.navigationBar.tintColor = .black
    }
}

extension AddToList {
    func navigationConfig() {
       navigationController?.navigationBar.tintColor = UIColor(red: 11/255, green: 146/255, blue: 191/255, alpha: 1)
        self.navigationController?.navigationBar.topItem?.title = ""
        title = "Add"
        view.backgroundColor = UIColor(patternImage: UIImage(named: "addPageImage")!)
    }
}
