import UIKit

class plusViewController: UIViewController {
    
    let pluscontenView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Eğer push ile açıldıysa çarpı butonu ekle
        if navigationController?.viewControllers.first != self {
            navigationItem.hidesBackButton = true
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButtonTapped))
        }
        
        
        
        // **Üstte Sabit Kalacak "Alışkanlık Seç" Başlığı**
        let titlelabel = UILabel()
        titlelabel.text = "Alışkanlık Seç"
        titlelabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titlelabel.textColor = .black
        titlelabel.textAlignment = .left
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titlelabel) // `view` içine ekliyoruz, `scrollView`'e değil!
        
        // **ScrollView oluştur ve ekle**
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        
        // **İçerik için ana bir view ekle**
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        // **ScrollView ve contentView için Auto Layout**
        NSLayoutConstraint.activate([
            // ScrollView'un tüm ekranı kaplaması
            scrollView.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 10), // Başlığın hemen altında başlasın
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor) // Genişlik sabit olmalı
        ])
        
        // **ScrollView İçindeki Elemanlar**
        pluscontenView.backgroundColor = .darkGray
        pluscontenView.layer.cornerRadius = 8
        pluscontenView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pluscontenView)
        
        let pluslabelContent = UILabel()
        pluslabelContent.text = "Özel Alışkanlık Oluştur"
        pluslabelContent.textColor = .white
        pluslabelContent.font = .systemFont(ofSize: 17, weight: .bold)
        pluslabelContent.translatesAutoresizingMaskIntoConstraints = false
        pluslabelContent.textAlignment = .left
        pluscontenView.addSubview(pluslabelContent)
        
        let plusButton = UIButton(type: .system)
        plusButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        plusButton.tintColor = .gray
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        pluscontenView.addSubview(plusButton)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(contentTapped2))
        pluscontenView.addGestureRecognizer(tapGesture)
        
        // **Auto Layout için Ayarlamalar**
        NSLayoutConstraint.activate([
            // Üstte sabit kalan başlık
            titlelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titlelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titlelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Plus Content View (ScrollView içinde olacak)
            pluscontenView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            pluscontenView.heightAnchor.constraint(equalToConstant: 60),
            pluscontenView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            pluscontenView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Label Content
            pluslabelContent.leadingAnchor.constraint(equalTo: pluscontenView.leadingAnchor, constant: 40),
            pluslabelContent.centerYAnchor.constraint(equalTo: pluscontenView.centerYAnchor),
            
            // Plus Button
            plusButton.leadingAnchor.constraint(equalTo: pluscontenView.leadingAnchor, constant: 7.5),
            plusButton.centerYAnchor.constraint(equalTo: pluscontenView.centerYAnchor),
            
            // **contentView'in yeterince büyük olması lazım**
            contentView.bottomAnchor.constraint(equalTo: pluscontenView.bottomAnchor, constant: 800) // Daha fazla içerik eklenebilir
        ])
    }
    
    @objc func contentTapped2() {
        // Animasyonu doğru view ile yap
        UIView.animate(withDuration: 0.1, animations: {
            self.pluscontenView.alpha = 0.5
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.pluscontenView.alpha = 1.0
            }
        }
    }
    
    @objc func closeButtonTapped() {
        // Bir önceki ViewController'a geri git
        navigationController?.popViewController(animated: true)
    }
}
