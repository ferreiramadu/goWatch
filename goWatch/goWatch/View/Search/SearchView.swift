import UIKit

class SearchView: UIView {
    
    var changeTextField: (() -> Void)?
    
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
//        tableView.delegate = self
//        tableView.dataSource = self
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.register(MovieDetailCell.self, forCellReuseIdentifier: MovieDetailCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "darkBlue")
        self.addSubview(searchView)
        self.searchView.addSubview(self.searchImageView)
        self.searchView.addSubview(self.searchTextField)
        self.addSubview(self.tableView)
        bindLayoutEvents()
    }
    
    @objc private func bindLayoutEvents() {
        searchTextField.addTarget(self, action: #selector(searchTextFieldChange), for: .editingChanged)
    }
    
    @objc private func searchTextFieldChange() {
        changeTextField?()
    }
    
    func show() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 130),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.searchView.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            self.searchView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.searchView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
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
