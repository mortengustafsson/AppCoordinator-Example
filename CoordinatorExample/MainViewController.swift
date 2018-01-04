//
//  MainViewController.swift
//  Coordinator
//
//  Created by Morten Gustafsson on 04/01/2018.
//  Copyright © 2018 mortengustafsson. All rights reserved.
//

import UIKit

protocol MainViewControllerDelegate: class {
    func mainViewControllerDidFinish(_ viewController: MainViewController)
}

class MainViewController: UIViewController {
    
    weak var delegate: MainViewControllerDelegate?
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
