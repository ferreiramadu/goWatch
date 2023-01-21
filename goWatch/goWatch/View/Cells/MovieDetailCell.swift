import UIKit

class MovieDetailCell: UITableViewCell {
    
    static let identifier: String = "movieDetailCell"
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var movieImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "cardMovie")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 15
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Raya e o último dragão"
        label.font = UIFont(name: "Inter-Medium", size: 18)
        label.numberOfLines = 2
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatisLorem..."
        label.font = UIFont(name: "Inter-Light", size: 12)
        label.numberOfLines = 4
        label.textColor = .white
        return label
    }()
    
    lazy var categoryView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "detailBlue")
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Animação"
        label.font = UIFont(name: "Inter-Light", size: 12)
        label.textColor = .white
        return label
    }()
    
    lazy var yearView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "detailBlue")
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2011"
        label.font = UIFont(name: "Inter-Light", size: 12)
        label.textColor = .white
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.containerView)
        self.containerView.addSubview(self.movieImageView)
        self.containerView.addSubview(self.titleLabel)
        self.containerView.addSubview(self.descriptionLabel)
        self.containerView.addSubview(self.categoryView)
        self.categoryView.addSubview(categoryLabel)
        self.containerView.addSubview(self.yearView)
        self.yearView.addSubview(self.yearLabel)
        self.backgroundColor = UIColor(named: "darkBlue")

        self.containerView.roundCorners(cornerRadiuns: 7.0, typeCorners: [.superiorEsquerdo, .inferiorEsquerdo, .superiorDireito, .inferiorDireito])
        configConstraints()
    }
    
    func show(data: MovieDetail) {
        titleLabel.text = data.title
        movieImageView.image = data.banner
        descriptionLabel.text = data.description
        categoryLabel.text = data.category
        yearLabel.text = data.year
    }

    override var isSelected: Bool {
        didSet {
            self.contentView.backgroundColor = isSelected ? UIColor(named: "darkBlue") : UIColor(named: "darkBlue")
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.topAnchor),
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.containerView.heightAnchor.constraint(equalToConstant: 150),
            
            self.movieImageView.widthAnchor.constraint(equalToConstant: 90),
            self.movieImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            self.movieImageView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            self.movieImageView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.movieImageView.topAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.movieImageView.trailingAnchor, constant: 20),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor),
            
            self.categoryView.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 12),
            self.categoryView.bottomAnchor.constraint(equalTo: self.movieImageView.bottomAnchor),
            self.categoryView.leadingAnchor.constraint(equalTo: self.movieImageView.trailingAnchor, constant: 20),
            self.categoryView.widthAnchor.constraint(equalToConstant: 70),
            self.categoryView.heightAnchor.constraint(equalToConstant: 25),
        
            self.categoryLabel.centerXAnchor.constraint(equalTo: self.categoryView.centerXAnchor),
            self.categoryLabel.centerYAnchor.constraint(equalTo: self.categoryView.centerYAnchor),
            
            self.yearView.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 12),
            self.yearView.bottomAnchor.constraint(equalTo: self.movieImageView.bottomAnchor),
            self.yearView.leadingAnchor.constraint(equalTo: self.categoryView.trailingAnchor, constant: 10),
            self.yearView.widthAnchor.constraint(equalToConstant: 90),
            self.yearView.heightAnchor.constraint(equalToConstant: 25),

            self.yearLabel.centerXAnchor.constraint(equalTo: self.yearView.centerXAnchor),
            self.yearLabel.centerYAnchor.constraint(equalTo: self.yearView.centerYAnchor),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
