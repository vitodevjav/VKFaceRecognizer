//
//  ViewController.swift
//  VKFaceRecognizer
//
//  Created by Kazakevich, Vitaly on 9/27/18.
//  Copyright © 2018 Kazakevich, Vitaly. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MainViewController: UIViewController {
    private let disposeBag = DisposeBag()

    var presenter: MainPresenterProtocol?
    var interactor: MainInteractorProtocol?

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var loadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Load image", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var detectButton: UIButton = {
        let button = UIButton()
        button.setTitle("Detect", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .whiteLarge)
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.color = .blue
        activity.isHidden = true
        return activity
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(loadButton)
        view.addSubview(detectButton)
        view.addSubview(activityIndicator)
        configureConstraints()
        configureReactiveViews()
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0),
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

            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: loadButton.bottomAnchor, constant: 16.0)
            ])
    }

    private func presentPickerController() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }

    private func configureReactiveViews() {
        presenter?.selectedImage.asObservable()
            .bind(to: imageView.rx.image)
            .disposed(by: disposeBag)

        presenter?.state.asObservable()
            .subscribe(onNext: { state in self.updateViewState(with: state) })
            .disposed(by: disposeBag)

        loadButton.rx.tap
            .bind { self.presentPickerController() }
            .disposed(by: disposeBag)

        detectButton.rx.tap
            .bind { self.interactor?.detectFace() }
            .disposed(by: disposeBag)
    }

    private func updateViewState(with state: DetectionState) {
        switch state {
        case .ready, .failed, .detectionFinished:
            loadButton.isEnabled = true
            detectButton.isEnabled = true
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        case .loading, .detecting:
            loadButton.isEnabled = false
            detectButton.isEnabled = false
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        }

        if case .failed(let error) = state {
            showAlert(message: error.localizedDescription)
        }

        if case .detectionFinished(let faceCount) = state {
            showAlert(message: "\(faceCount) face(s) detected.")
        }
    }

    private func showAlert(message: String) {
        let alertController = UIAlertController.init(title: message, message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
            self.dismiss(animated: true) { self.interactor?.resetState() }
        }))
        present(alertController, animated: true)
    }
}

extension MainViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if presentedViewController as? UIImagePickerController != nil {
            dismiss(animated: true, completion: { self.interactor?.handleImages(with: info) })
        }
    }
}

extension MainViewController: UINavigationControllerDelegate {
    
}

