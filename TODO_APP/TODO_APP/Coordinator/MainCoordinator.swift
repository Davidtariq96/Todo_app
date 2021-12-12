import UIKit

class MainCoordinator: Coordinator {
    private var window: UIWindow
    var controller: UINavigationController
    
    
    init(window: UIWindow) {
        self.window = window
        controller = UINavigationController()
    }
    
    func start() {
        let viewController = ViewController()
       
        viewController.view.backgroundColor = UIColor(patternImage: UIImage(named: "addPageImage")!)
        viewController.coordinate = self
        controller.pushViewController(viewController, animated: false)
        window.rootViewController = controller
        window.makeKeyAndVisible()
      
    }
   
    func openAdd() {
        let newViewController = AddToList()
        newViewController.coordinate = self
        newViewController.view.backgroundColor = .white
        controller.pushViewController(newViewController, animated: true)
        print ("addPage to list has been clicked")

   }
//    func openDetails(){
//        let newViewController = Details()
//        newViewController.coordinate = self
//        controller.pushViewController(newViewController, animated: true)
//        print ("details has been tapped")
//    }
}
