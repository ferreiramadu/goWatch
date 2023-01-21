import UIKit

class CategoryDetailViewController: UIViewController {
    
    var listMovieCategory: [Movie] = []
    let movieModel: MovieModel = MovieModel()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "backgroundOpacity")
        button.layer.borderWidth = 0.0
        button.layer.cornerRadius = 20
        button.layer.zPosition = 20
        return button
    }()
    
    lazy var backImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "arrowBack.png")
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Categoria"
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Medium", size: 18)
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = UIColor(named: "darkBlue")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = true // indicador de scroll
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.register(MovieDetailCell.self, forCellReuseIdentifier: MovieDetailCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "darkBlue")
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.backButton)
        self.backButton.addSubview(self.backImageView)
        self.view.addSubview(self.tableView)

        self.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        configConstraints()
    }
    
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
        
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 65),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            
            self.backButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 58),
            self.backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 22),
            self.backButton.widthAnchor.constraint(equalToConstant: 35),
            self.backButton.heightAnchor.constraint(equalToConstant: 35),
            
            self.backImageView.widthAnchor.constraint(equalToConstant: 15),
            self.backImageView.heightAnchor.constraint(equalToConstant: 15),
            self.backImageView.centerXAnchor.constraint(equalTo: backButton.centerXAnchor),
            self.backImageView.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
        ])
    }
}

extension CategoryDetailViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listMovieCategory.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieDetailCell.identifier, for: indexPath) as? MovieDetailCell
        let view = UIView()
        view.backgroundColor = UIColor(named: "darkBlue")
        cell?.selectedBackgroundView = view
    
        let modelData = self.listMovieCategory
        
        cell?.titleLabel.text = modelData[indexPath.row].title
        cell?.movieImageView.image = modelData[indexPath.row].banner
        cell?.descriptionLabel.text = modelData[indexPath.row].synopsis
        cell?.categoryLabel.text = modelData[indexPath.row].category.title
        cell?.yearLabel.text = String(modelData[indexPath.row].year)
        return cell ?? UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = self.listMovieCategory[indexPath.row]
        let controller = DetailViewController()
        controller.setMovieData(movieData: movie)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
