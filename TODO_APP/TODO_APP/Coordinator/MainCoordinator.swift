import UIKit

class MainCoordinator: Coordinator {
    private var window: UIWindow
    var controller: UINavigationController
    let viewModel: TodoViewModel
    init(window: UIWindow) {
        self.window = window
        controller = UINavigationController()
        viewModel = TodoViewModel()
    }
    func start() {
        let viewController = ViewController()
        viewController.viewModel = viewModel
        viewController.coordinator = self
        if let image = UIImage(named: "addPageImage") {
            viewController.view.backgroundColor = UIColor(patternImage: image)
        }
        controller.pushViewController(viewController, animated: false)
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
    func openAdd() {
        let viewController = AddToList()
        viewController.viewModel = viewModel
        viewController.coordinator = self
        viewController.view.backgroundColor = .white
        controller.pushViewController(viewController, animated: true)
   }
    func goBackToHome() {
        controller.popViewController(animated: true)
    }
    func openDetail(of index: Int) {
        let viewController = Details()
        viewController.coordinator = self
        viewController.viewModel = viewModel
        let todo = viewModel.getOneItem(with: index)
        viewController.id = todo?.id
        viewController.setup(text: todo?.text)
        controller.pushViewController(viewController, animated: true)
    }
}
