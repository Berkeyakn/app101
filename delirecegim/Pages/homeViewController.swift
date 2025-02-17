//
//  homeViewController.swift
//  delirecegim
//
//  Created by Berke Yakın on 4.02.2025.
//

import UIKit

class homeViewController: UIViewController {
    
    
    let nextDayButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        
        nextDayButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        nextDayButton.tintColor = .black
        nextDayButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextDayButton)
        
        
        let contenView = UIView()
        contenView.backgroundColor = .darkGray
        contenView.layer.cornerRadius = 8
        contenView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contenView)
        
        let labelContent = UILabel()
        labelContent.text = "Yeni Alışkanlık Oluştur"
        labelContent.textColor = .white
        labelContent.font = .systemFont(ofSize: 17, weight: .bold)
        labelContent.translatesAutoresizingMaskIntoConstraints = false
        labelContent.textAlignment = .left
        contenView.addSubview(labelContent)

        contenView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(contentTapped))
        contenView.addGestureRecognizer(tapGesture)

        let plusButton = UIButton(type: .system)
        plusButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        plusButton.tintColor = .gray
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        contenView.addSubview(plusButton)

        let firstlabel = UILabel()
        firstlabel.text = "Harekete Geçmeye Ne Dersin?"
        firstlabel.textColor = .black
        firstlabel.textAlignment = .left
        firstlabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        firstlabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstlabel)

        let titlelabel = UILabel()
        titlelabel.text = "Bugün"
        titlelabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titlelabel.textColor = .black
        titlelabel.textAlignment = .center
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titlelabel)

        NSLayoutConstraint.activate([
            // Content View
            contenView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 275),
            contenView.heightAnchor.constraint(equalToConstant: 60),
            contenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            // Label Content
            labelContent.leadingAnchor.constraint(equalTo: contenView.leadingAnchor, constant: 40),
            labelContent.centerYAnchor.constraint(equalTo: contenView.centerYAnchor),

            // Plus Button
            plusButton.leadingAnchor.constraint(equalTo: contenView.leadingAnchor, constant: 7.5),
            plusButton.centerYAnchor.constraint(equalTo: contenView.centerYAnchor),

            // First Label (Harekete Geçmeye Ne Dersin?)
            firstlabel.leadingAnchor.constraint(equalTo: contenView.leadingAnchor),
            firstlabel.bottomAnchor.constraint(equalTo: contenView.topAnchor, constant: -20), // Biraz yukarıda konumlandır

            titlelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titlelabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            
            //nextdaybutton
            nextDayButton.centerYAnchor.constraint(equalTo: titlelabel.centerYAnchor),
            nextDayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 180)
        ])
    }

    @objc func contentTapped() {
        // **Önce animasyon oynasın**
        UIView.animate(withDuration: 0.1, animations: {
            self.view.alpha = 0.5
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.view.alpha = 1.0
            }) { _ in
                // **Animasyon bitince sayfa geçişi yap**
                let plusVC = plusViewController()
                self.navigationController?.pushViewController(plusVC, animated: true)
            }
        }

        print("ContentView tıklandı! → plusViewController'a geçiş yapılıyor.")
    }
}
