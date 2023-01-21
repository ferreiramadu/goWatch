import UIKit

class DetailView: UIView {
    var didTapBackButton: (() -> Void)?
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.zPosition = -1
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Inter-Medium", size: 22)
        return label
    }()
    
    lazy var categoryView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "detailBlue")
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Inter-Light", size: 12)
        return label
    }()
    
    lazy var yearView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "detailBlue")
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var yearTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.textColor = .white
        label.font = UIFont(name: "Inter-Light", size: 12)
        return label
    }()
    
    lazy var sinopseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sinopse"
        label.textColor = .white
        label.font = UIFont(name: "Inter-Medium", size: 15)
        return label
    }()
    
    lazy var sinopseTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Inter-Light", size: 12)
        label.numberOfLines = 5
        return label
    }()

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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "darkBlue")
        self.addSubview(backgroundImageView)
        self.addSubview(titleLabel)
        self.addSubview(categoryView)
        self.addSubview(yearView)
        self.addSubview(sinopseLabel)
        self.addSubview(sinopseTextLabel)
        self.categoryView.addSubview(self.categoryTitleLabel)
        self.yearView.addSubview(self.yearTitleLabel)
        self.addSubview(backButton)
        self.backButton.addSubview(self.backImageView)
        configConstraints()
        bindLayoutEvents()
    }
    
    func show(data: Movie) {
        backgroundImageView.image = data.background
        titleLabel.text = data.title
        categoryTitleLabel.text = data.category.title
        sinopseTextLabel.text = data.synopsis
        yearTitleLabel.text = String(data.year)
    }
    
    // Forma de passar o target melhor
    @objc private func bindLayoutEvents() {
        backButton.addTarget(self, action: #selector(backButtonHandler), for: .touchUpInside)
    }
    
    @objc private func backButtonHandler() {
        didTapBackButton?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImageView.heightAnchor.constraint(equalToConstant: 500),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.backgroundImageView.bottomAnchor, constant: 27),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22),
            
            self.categoryView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 19),
            self.categoryView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            self.categoryView.widthAnchor.constraint(equalToConstant: 80),
            self.categoryView.heightAnchor.constraint(equalToConstant: 30),
            
            self.categoryTitleLabel.centerXAnchor.constraint(equalTo: self.categoryView.centerXAnchor),
            self.categoryTitleLabel.centerYAnchor.constraint(equalTo: self.categoryView.centerYAnchor),
            
            self.yearView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 19),
            self.yearView.leadingAnchor.constraint(equalTo: self.categoryView.trailingAnchor, constant: 22),
            self.yearView.widthAnchor.constraint(equalToConstant: 80),
            self.yearView.heightAnchor.constraint(equalToConstant: 30),
            
            self.yearTitleLabel.centerXAnchor.constraint(equalTo: self.yearView.centerXAnchor),
            self.yearTitleLabel.centerYAnchor.constraint(equalTo: self.yearView.centerYAnchor),
            
            self.sinopseLabel.topAnchor.constraint(equalTo: self.categoryView.bottomAnchor, constant: 31),
            self.sinopseLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            self.sinopseLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22),
            
            self.sinopseTextLabel.topAnchor.constraint(equalTo: self.sinopseLabel.bottomAnchor, constant: 19),
            self.sinopseTextLabel.leadingAnchor.constraint(equalTo: self.sinopseLabel.leadingAnchor),
            self.sinopseTextLabel.trailingAnchor.constraint(equalTo: self.sinopseLabel.trailingAnchor),
            
            self.backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 58),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            self.backButton.widthAnchor.constraint(equalToConstant: 35),
            self.backButton.heightAnchor.constraint(equalToConstant: 35),
            
            self.backImageView.widthAnchor.constraint(equalToConstant: 15),
            self.backImageView.heightAnchor.constraint(equalToConstant: 15),
            self.backImageView.centerXAnchor.constraint(equalTo: backButton.centerXAnchor),
            self.backImageView.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
        ])
    }
}
