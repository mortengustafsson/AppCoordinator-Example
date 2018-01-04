//
//  PopupViewController.swift
//  Coordinator
//
//  Created by Morten Gustafsson on 04/01/2018.
//  Copyright © 2018 mortengustafsson. All rights reserved.
//

import UIKit

protocol PopupViewControllerDelegate: class {
    func popupViewControllerDidFinish(_ viewController: PopupViewController)
}

class PopupViewController: UIViewController {
    
    weak var delegate: PopupViewControllerDelegate?
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow

        let dismissButton = UIButton(type: .custom)
        dismissButton.setTitle("Dismiss", for: .normal)
        view.addSubview(dismissButton)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dismissButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
       
        dismissButton.addTarget(self, action: #selector(didTapDismiss), for: .touchUpInside)
    }
}

extension PopupViewController {
    @objc func didTapDismiss() {
        delegate?.popupViewControllerDidFinish(self)
    }
}
