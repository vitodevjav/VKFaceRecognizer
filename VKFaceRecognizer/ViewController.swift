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
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16.0),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16.0),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),

            loadButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16.0),
            loadButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16.0),
            loadButton.heightAnchor.constraint(equalToConstant: 60.0),
            loadButton.widthAnchor.constraint(equalToConstant: 100.0),

            detectButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16.0),
            detectButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0),
            detectButton.heightAnchor.constraint(equalToConstant: 60.0),
            detectButton.widthAnchor.constraint(equalToConstant: 100.0),
            ])
    }
}

