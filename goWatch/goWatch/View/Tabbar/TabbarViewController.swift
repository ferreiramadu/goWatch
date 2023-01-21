import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.setupTabBarController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func setupTabBarController() {
        self.setViewControllers([HomeViewController(), SearchViewController(), UserProfileViewController()], animated: true)
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = UIColor(named: "darkBlue")
        self.tabBar.isTranslucent = false
        
        guard let items = tabBar.items else {return}
        items[0].title = "Inicio"
        items[0].image = UIImage(named: "home")
        
        items[1].title = "Pesquisar"
        items[1].image = UIImage(named: "search")
        
        items[2].title = "Perfil"
        items[2].image = UIImage(named: "userTab")
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "detailBlue") as Any], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "detailBlue") as Any], for: .selected)
    }
}
