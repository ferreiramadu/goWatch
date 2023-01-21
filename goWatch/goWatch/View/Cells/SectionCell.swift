import UIKit

class SectionCell: UICollectionViewCell {
    
    static let identifier: String = "sectionId"
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 40
        return image
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Olá"
        label.textColor = .white
        label.font = UIFont(name: "Inter-Medium", size: 15)
        return label
    }()
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "seja bem vindo(a)"
        label.textColor = .white
        label.font = UIFont(name: "Inter-Light", size: 15)
        return label
    }()
    
    lazy var notificationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var notificationImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "notification")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(containerView)
        self.containerView.addSubview(self.userImageView)
        self.containerView.addSubview(self.userNameLabel)
        self.containerView.addSubview(self.welcomeLabel)
        self.containerView.addSubview(self.notificationView)
        self.notificationView.addSubview(self.notificationImageView)
        configConstraints()
    }
    
    func show(username: String, userImage: UIImage) {
        userNameLabel.text = "Olá \(username)"
        userImageView.image = userImage
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
            
            self.userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.userImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.userImageView.widthAnchor.constraint(equalToConstant: 40),
            self.userImageView.heightAnchor.constraint(equalToConstant: 40),
            
            self.userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10),
            self.userNameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            
            self.welcomeLabel.topAnchor.constraint(equalTo: self.userNameLabel.bottomAnchor, constant: 5),
            self.welcomeLabel.leadingAnchor.constraint(equalTo: self.userNameLabel.leadingAnchor),
            
            self.notificationView.widthAnchor.constraint(equalToConstant: 30),
            self.notificationView.heightAnchor.constraint(equalToConstant: 30),
            self.notificationView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.notificationView.centerYAnchor.constraint(equalTo: self.userImageView.centerYAnchor),
            
            self.notificationImageView.centerXAnchor.constraint(equalTo: self.notificationView.centerXAnchor),
            self.notificationImageView.centerYAnchor.constraint(equalTo: self.notificationView.centerYAnchor),
        ])
    }
}
