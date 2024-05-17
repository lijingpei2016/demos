//
//  JPViewController.swift
//  测试代码
//
//  Created by admin on 2024/3/29.
//

import UIKit

class JPViewController: UIViewController {
    var rootVC: JPViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange

        let pushButton = UIButton(type: .system)
        pushButton.setTitle("Push", for: .normal)
        pushButton.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)

        let modalButton = UIButton(type: .system)
        modalButton.setTitle("Modal", for: .normal)
        modalButton.addTarget(self, action: #selector(modalButtonTapped), for: .touchUpInside)

        let dismissButton = UIButton(type: .system)
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)


        let push_modalButton = UIButton(type: .system)
        push_modalButton.setTitle("push_modalButton", for: .normal)
        push_modalButton.addTarget(self, action: #selector(push_modalButtonTapped), for: .touchUpInside)
        
        view.addSubview(pushButton)
        view.addSubview(modalButton)
        view.addSubview(dismissButton)
        view.addSubview(push_modalButton)

        pushButton.frame = CGRect(x: 30, y: 100, width: 100, height: 50)
        modalButton.frame = CGRect(x: 30, y: 200, width: 100, height: 50)
        dismissButton.frame = CGRect(x: 30, y: 300, width: 100, height: 50)
        push_modalButton.frame = CGRect(x: 30, y: 400, width: 100, height: 50)

    }
    
    @objc func push_modalButtonTapped() {
        let newViewController = JPViewController()
        newViewController.rootVC = self.rootVC
        newViewController.view.backgroundColor = .green
        let navigationController = UINavigationController(rootViewController: newViewController)
        self.present(navigationController, animated: true, completion: nil)
    }

    @objc func pushButtonTapped() {
        let newViewController = JPViewController()
        newViewController.view.backgroundColor = .green
        newViewController.rootVC = self.rootVC
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

    @objc func modalButtonTapped() {
        let newViewController = JPViewController()
        newViewController.view.backgroundColor = .blue
        newViewController.rootVC = self.rootVC
//        newViewController.modalPresentationStyle = .fullScreen
        newViewController.modalPresentationStyle = .custom
        present(newViewController, animated: true, completion: nil)
    }

    @objc func dismissButtonTapped() {
        print("rootVC dismiss")
        rootVC?.dismiss(animated: true, completion: nil)
    }
}
