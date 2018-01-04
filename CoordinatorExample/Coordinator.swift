//
//  CoordinatorProtocol.swift
//  Coordinator
//
//  Created by Morten Gustafsson on 04/01/2018.
//  Copyright © 2018 mortengustafsson. All rights reserved.
//

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
}

extension Coordinator {
    func addChildCoordinator(childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
    
    func removeChildCoordinator(childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
}
