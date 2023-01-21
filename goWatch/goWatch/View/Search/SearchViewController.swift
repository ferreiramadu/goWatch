import UIKit

class SearchViewController: UIViewController {
    
    let movieModel: MovieModel = MovieModel()
    
    lazy var searchView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "detailBlue")
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Inter-Light", size: 15)
        textField.leftViewMode = .always
        textField.autocorrectionType = .no
        textField.textColor = .white
        textField.layer.borderWidth = 0.0
        
        textField.attributedPlaceholder =
        NSAttributedString(string: "Pesquise por titulos", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return textField
    }()
    
    lazy var searchImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "search")
        return image
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
        self.view.addSubview(searchView)
        self.searchView.addSubview(self.searchImageView)
        self.searchView.addSubview(self.searchTextField)
        self.view.addSubview(self.tableView)
        
        self.searchTextField.addTarget(self, action: #selector(pesquisar), for: .editingChanged)
        configConstraints()
        hideKeyboardWhenTapped()
    }
    
    @objc private func pesquisar() {
        if let textoPesquisado = searchTextField.text,textoPesquisado != "" {
            movieModel.findByTitle(title: textoPesquisado)
        } else {
            movieModel.clearSearch()
        }
        tableView.reloadData()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 130),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            self.searchView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70),
            self.searchView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            self.searchView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            self.searchView.heightAnchor.constraint(equalToConstant: 40),
            
            self.searchImageView.centerYAnchor.constraint(equalTo: self.searchView.centerYAnchor),
            self.searchImageView.widthAnchor.constraint(equalToConstant: 18),
            self.searchImageView.heightAnchor.constraint(equalToConstant: 18),
            self.searchImageView.leadingAnchor.constraint(equalTo: self.searchView.leadingAnchor, constant: 15),
            
            self.searchTextField.topAnchor.constraint(equalTo: self.searchView.topAnchor),
            self.searchTextField.bottomAnchor.constraint(equalTo: self.searchView.bottomAnchor),
            self.searchTextField.trailingAnchor.constraint(equalTo: self.searchView.trailingAnchor),
            self.searchTextField.leadingAnchor.constraint(equalTo: self.searchView.leadingAnchor, constant: 50),
        ])
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.movieModel.countElementsFilter > 0) {
            return self.movieModel.countElementsFilter
        }
        return self.movieModel.countElements
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieDetailCell.identifier, for: indexPath) as? MovieDetailCell
        let view = UIView()
        view.backgroundColor = UIColor(named: "darkBlue")
        cell?.selectedBackgroundView = view
    
        var modelData: [Movie] = self.movieModel.findAll()
        
        if (!movieModel.findSearch().isEmpty) {
            modelData = self.movieModel.findSearch()
        }
        
        cell?.show(data: MovieDetail(
            title: modelData[indexPath.row].title,
            banner: modelData[indexPath.row].banner,
            description: modelData[indexPath.row].synopsis,
            category: modelData[indexPath.row].category.title,
            year: String(modelData[indexPath.row].year)))
        return cell ?? UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieModel: MovieModel = MovieModel()
        let movie = movieModel.findById(Index: indexPath.row)
        
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

struct MovieDetail {
    var title: String
    var banner: UIImage
    var description: String
    var category: String
    var year: String
}
