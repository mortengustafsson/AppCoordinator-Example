//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by Morten Gustafsson on 04/01/2018.
//  Copyright © 2018 mortengustafsson. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var rootViewController: UIViewController {
        return self.navigationController
    }
    
    let window: UIWindow
    
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        return navigationController
    }()
    
    public init(window: UIWindow) {
        self.window = window
        
        self.window.rootViewController = self.rootViewController
        rootViewController.view.backgroundColor = .green
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        self.showMainCoordinator()
    }
    
    private func showMainCoordinator() {
        let mainCoordinator = MainCoordinator()
        mainCoordinator.delegate = self
        mainCoordinator.start()
        addChildCoordinator(childCoordinator: mainCoordinator)
        
        self.rootViewController.navigationController?.pushViewController(mainCoordinator.rootViewController, animated: false)
    }

    private func showPopup() {
        let popupViewController = PopupViewController()
        popupViewController.delegate = self
        self.rootViewController.present(popupViewController, animated: true, completion: nil)
    }

}

extension AppCoordinator: MainCoordinatorDelegate {
    func mainCoordinatorDidFinsh(_ mainCoordinator: MainCoordinator) {
        removeChildCoordinator(childCoordinator: mainCoordinator)
    }
}

extension AppCoordinator: PopupViewControllerDelegate {
    func popupViewControllerDidFinish(_ viewController: PopupViewController) {
        self.rootViewController.dismiss(animated: true, completion: nil)
    }
}
