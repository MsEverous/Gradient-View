//
//  ViewController.swift
//  GradientView
//
//  Created by Лариса Терегулова on 01.05.2023.
//

import UIKit

class ViewController: UIViewController {

    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor.orange.cgColor,
            UIColor.magenta.cgColor,
            UIColor.purple.cgColor
        ]
        gradient.locations = [0, 0.5, 1]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        return gradient
    }()
    
    lazy var mainShadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 7
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var gradientView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.layer.cornerRadius = 10 //Закругление краев
        view.clipsToBounds = true // Без этого закрегления не будет
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(mainShadowView)
        mainShadowView.addSubview(gradientView)
        gradient.frame = gradientView.bounds
        gradientView.layer.addSublayer(gradient)
        NSLayoutConstraint.activate([mainShadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     mainShadowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
                                     mainShadowView.heightAnchor.constraint(equalToConstant: 100),
                                     mainShadowView.widthAnchor.constraint(equalToConstant: 100),
                                    
                                     gradientView.topAnchor.constraint(equalTo: mainShadowView.topAnchor),
                                     gradientView.leadingAnchor.constraint(equalTo: mainShadowView.leadingAnchor),
                                     gradientView.trailingAnchor.constraint(equalTo: mainShadowView.trailingAnchor),
                                     gradientView.bottomAnchor.constraint(equalTo: mainShadowView.bottomAnchor)])
    }
}

