import Foundation
import UIKit

class AppCoordinator{
    private let window: UIWindow
    
    init (window: UIWindow){
        self.window = window
    }
    
    func start(){
        let viewController = ViewController.instantiate(viewModel: MessageListViewModel())
        
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController  = viewController
        window.makeKeyAndVisible()
        
    }
}
