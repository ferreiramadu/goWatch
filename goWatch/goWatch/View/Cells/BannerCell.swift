import UIKit

class BannerCell: UICollectionViewCell {
    static let identifier: String = "bannercellid"
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "detailBlue")
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var ImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "banner")
        image.layer.cornerRadius = 15
        image.sizeToFit()
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Raya e o último dragão"
        label.textColor = .white
        label.font = UIFont(name: "Inter-Medium", size: 18)
        label.layer.zPosition = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(containerView)
        self.containerView.addSubview(self.ImageView)
        self.containerView.roundCorners(cornerRadiuns: 10, typeCorners: [.superiorEsquerdo, .inferiorEsquerdo, .superiorDireito, .inferiorDireito])
        self.containerView.addSubview(self.titleLabel)
        configConstraints()
    }
    
    func show(title: String, banner: UIImage) {
        titleLabel.text = title
        ImageView.image = banner
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.topAnchor),
            self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.ImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            self.ImageView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            self.ImageView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
            self.ImageView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),
            
            self.titleLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 16),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 16),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -13),
        ])
    }
}
