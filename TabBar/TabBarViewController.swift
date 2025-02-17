import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tab bar seçili simgeler ve yazılar için renk
        tabBar.tintColor = .black
        
        // Tab bar arka plan rengi
        tabBar.barTintColor = .white
        
        // **1. Sekme: Home View Controller (Navigation Controller ile)**
        let homeVC = homeViewController()
        let homeNav = UINavigationController(rootViewController: homeVC) // Navigation ekledik
        homeNav.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
        
        // **2. Sekme: Settings View Controller**
        let settingsVC = UIViewController()
        settingsVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "gear"), tag: 1)
        
        // **3. Sekme: Daily View Controller**
        let dailyVC = UIViewController()
        dailyVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "list.bullet.clipboard.fill"), tag: 2)
        
        // **4. Sekme: Plus View Controller (Navigation Controller ile)**
        let plusVC = plusViewController()
        let plusNav = UINavigationController(rootViewController: plusVC) // Navigation ekledik
        plusNav.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "plus.circle.fill"), tag: 3)
        
        // **Tab bar'a sekmeleri ekle**
        self.viewControllers = [homeNav, dailyVC, plusNav, settingsVC]
    }
}
