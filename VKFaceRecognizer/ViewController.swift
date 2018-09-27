//
//  ViewController.swift
//  VKFaceRecognizer
//
//  Created by Kazakevich, Vitaly on 9/27/18.
//  Copyright © 2018 Kazakevich, Vitaly. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var loadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var detectButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(loadButton)
        view.addSubview(detectButton)
        configureConstraints()
    }

    private func configureConstraints() {

    }
}

