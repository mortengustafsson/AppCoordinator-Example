//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by Morten Gustafsson on 04/01/2018.
//  Copyright © 2018 mortengustafsson. All rights reserved.
//

import UIKit

protocol MainCoordinatorDelegate: class {
    func mainCoordinatorDidFinsh(_ mainCoordinator: MainCoordinator)
}

class MainCoordinator: Coordinator {
    weak var delegate: MainCoordinatorDelegate?

    var childCoordinators: [Coordinator] = []

    var rootViewController: UIViewController {
        return self.navigationController
    }
    
    private let navigationController: UINavigationController
    
    init() {
        self.childCoordinators = []
        self.navigationController = UINavigationController()
    }
    
    func start() {
        self.showMainCoordinator()
    }
    
    private func showMainCoordinator() {
        let mainViewController = MainViewController()
        mainViewController.delegate = self
        self.navigationController.setViewControllers([mainViewController], animated: true)
    }
}

extension MainCoordinator: MainViewControllerDelegate {
    func mainViewControllerDidFinish(_ viewController: MainViewController) {
        delegate?.mainCoordinatorDidFinsh(self)
    }
}
