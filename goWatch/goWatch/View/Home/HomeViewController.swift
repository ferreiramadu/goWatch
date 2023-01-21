import UIKit

class HomeViewController: UICollectionViewController {
    var userModel: UserModel = UserModel()
    var categoryModel: CategoryModel = CategoryModel()
    var movieModel: MovieModel = MovieModel()
    let staticSection: Int = 3
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            if (sectionNumber == 0) {
                let item = self.initializeNSCollectionLayoutItem()
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 25
                section.contentInsets.trailing = 25
                section.contentInsets.bottom = 0
                section.contentInsets.top = 25
                return section
            } else if (sectionNumber == 1) {
                let item = self.initializeNSCollectionLayoutItem()
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(320), heightDimension: .absolute(150)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 16
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 25
                section.contentInsets.trailing = 55
                section.contentInsets.bottom = 25
                section.contentInsets.top = 25
                return section
            } else if (sectionNumber == 2) {
                let item =  self.initializeNSCollectionLayoutItem()
                item.contentInsets.trailing = 10
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(85), heightDimension: .absolute(25)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 25
                section.contentInsets.top = 15
                section.contentInsets.bottom = 37
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(25)), elementKind: dinamicHeaderId, alignment: .topLeading)
                ]
                return section
            } else {
                let item =  self.initializeNSCollectionLayoutItem()
                item.contentInsets.trailing = 10
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(120), heightDimension: .absolute(180)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 25
                section.contentInsets.top = 15
                section.contentInsets.bottom = 15
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(25)), elementKind: dinamicHeaderId, alignment: .topLeading)
                ]
                return section
            }
        }
    }
    
    static func initializeNSCollectionLayoutItem() -> NSCollectionLayoutItem {
        return NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let listHeader = categoryModel.findAll()
        
        if (indexPath.section == 2) {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.identifier, for: indexPath) as? Header
            header?.show(title: "Categorias")
            return header ?? UICollectionReusableView()
        } else {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.identifier, for: indexPath) as? Header
            header?.show(title: listHeader[indexPath.section - staticSection].title)
            return header ?? UICollectionReusableView()
        }
    }

    //numero de sessoes na tela
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        let dinamicSection = categoryModel.countElements
        return (self.staticSection + dinamicSection)
    }
    
    //numero de itens nas sessoes
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (section < self.staticSection) {
            return self.validateSectionInViewStatic(numberOfItemsInSection: section)
        } else {
            return self.validateSectionInViewDinamic(idCategory: section)
        }
    }
    
    func validateSectionInViewStatic(numberOfItemsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        } else if (section == 1) {
            return movieModel.mostLiked().count
        } else if (section == 2) {
            return categoryModel.countElements;
        } else {
            return 0
        }
    }
    
    func validateSectionInViewDinamic(idCategory: Int) -> Int {
        return movieModel.findByCategory(id: (idCategory - self.staticSection)).count
    }

    // propriedade da celula
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let mostliked = movieModel.mostLiked()
        let categoryData = categoryModel.findAll()
        
        if (indexPath.section == 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionCell.identifier, for: indexPath) as? SectionCell
            cell?.show(username: userModel.getName(), userImage: userModel.getProfileImage())
            return cell ?? UICollectionViewCell()
        } else if (indexPath.section == 1) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.identifier, for: indexPath) as? BannerCell
            cell?.show(title: mostliked[indexPath.row].title, banner: mostliked[indexPath.row].splash)
            return cell ?? UICollectionViewCell()
        } else if (indexPath.section == 2) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell
            cell?.show(title: categoryData[indexPath.row].title)
            return cell ?? UICollectionViewCell()
        } else {
            // dinamico
            let movieData = movieModel.findByCategory(id: indexPath.section - staticSection)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell
            cell?.show(image: movieData[indexPath.row].banner)
            return cell ?? UICollectionViewCell()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let MovieDetailcontroller = DetailViewController()
        let categoryDetailController = CategoryDetailViewController()
        
        if (indexPath.section == 1) {
            let listMovie = movieModel.mostLiked()
            let movie = listMovie[indexPath.row]
            MovieDetailcontroller.setMovieData(movieData: movie)
            navigationController?.pushViewController(MovieDetailcontroller, animated: true)
        } else if (indexPath.section == 2) {
            let categorySelected = categoryModel.findById(Index: indexPath.row)
            categoryDetailController.listMovieCategory = movieModel.findByCategory(id: categorySelected.id)
            categoryDetailController.titleLabel.text = categorySelected.title
            navigationController?.pushViewController(categoryDetailController, animated: true)
        } else if (indexPath.section >= 3) {
            let category = movieModel.findByCategory(id: indexPath.section - staticSection)
            let movie = category[indexPath.row]
            MovieDetailcontroller.setMovieData(movieData: movie)
            navigationController?.pushViewController(MovieDetailcontroller, animated: true)
        }
    }

    static let dinamicHeaderId = "dinamicHeaderId"
    
    init() {
        super.init(collectionViewLayout: HomeViewController.createLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false) // esconde a navigationBar
        configCollection()
    }
    
    private func configCollection() {
        collectionView.backgroundColor = UIColor(named: "darkBlue")
        collectionView.register(Header.self, forSupplementaryViewOfKind: HomeViewController.dinamicHeaderId, withReuseIdentifier: Header.identifier)
        collectionView.register(SectionCell.self, forCellWithReuseIdentifier: SectionCell.identifier)
        collectionView?.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        collectionView?.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
    }
}
