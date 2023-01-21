import UIKit

class OnboardingViewController: UIViewController {
    
    let slides: [OnboardingSlide] = [
        OnboardingSlide(
            isHideSkipButton: false,
            image: UIImage(named: "movieIlustration") ?? UIImage(),
            title: "Escolha os melhores filmes",
            description: "Veja as melhores opções de filmes para ver com seus amigos e familiares.",
            titleButton: "Próximo"),
        OnboardingSlide(
            isHideSkipButton: true,
            image: UIImage(named: "mobileIlustration") ?? UIImage(),
            title: "Fácil e interativo",
            description: "Nossa plataforma é para todos, contamos com um layout simples e interativo para que todos possam desfrutar.",
            titleButton: "Vamos começar!")
    ]
    
    var currentPage = 0 {
        didSet {
            pageControll.currentPage = currentPage
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: OnboardingCell.identifier)
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    lazy var pageControll: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pageControlTapHandler(sender:)), for: .touchUpInside)
        pageControl.currentPageIndicatorTintColor = UIColor(named: "pink")
        pageControl.pageIndicatorTintColor = UIColor(named: "gray")
        return pageControl
    }()

    @objc func pageControlTapHandler(sender: UIPageControl) {
      
    }
    
    @objc private func sendToNextStep() {
        if (currentPage == slides.count - 1) {
            sendToLogin()
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    @objc private func sendToLogin() {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.addSubview(collectionView)
        self.view.addSubview(pageControll)
        configConstraints()
    }

    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -20),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
    
            self.pageControll.heightAnchor.constraint(equalToConstant: 50),
            self.pageControll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.pageControll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.pageControll.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12),
        ])
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.identifier, for: indexPath) as? OnboardingCell
        cell?.didTapNextButton = {[weak self] in self?.sendToNextStep()}
        cell?.didTapSkipButton = {[weak self] in self?.sendToLogin()}
        
        if (indexPath.row == 0) {
            cell?.show(data: slides[0])
        } else {
            cell?.show(data: slides[1])
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //pinta a bolinha da pagina selecionada
        let width = collectionView.frame.width
        currentPage = Int(collectionView.contentOffset.x / width)
    }
}

struct OnboardingSlide {
    var isHideSkipButton: Bool
    var image: UIImage
    var title: String
    var description: String
    var titleButton: String
}
