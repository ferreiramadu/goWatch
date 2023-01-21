import UIKit

class UserProfileView: UIView {
    var didTapUpdateButton: (() -> Void)?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Seu perfil"
        label.textColor = .white
        label.font = UIFont(name: "Inter-Medium", size: 18)
        label.textAlignment = .left
        return label
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "avatar")
        image.layer.cornerRadius = 40
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome"
        label.textColor = .white
        label.font = UIFont(name: "Inter-Light", size: 12)
        label.textAlignment = .left
        return label
    }()
    
    lazy var nameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "detailBlue")
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Inter-Light", size: 12)
        textField.leftViewMode = .always
        textField.autocorrectionType = .no
        textField.textColor = .white
        textField.layer.borderWidth = 0.0
        textField.attributedPlaceholder =
        NSAttributedString(string: "Nome", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return textField
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.textColor = .white
        label.font = UIFont(name: "Inter-Light", size: 12)
        label.textAlignment = .left
        return label
    }()
    
    lazy var emailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "detailBlue")
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Inter-Light", size: 12)
        textField.leftViewMode = .always
        textField.autocorrectionType = .no
        textField.textColor = .white
        textField.layer.borderWidth = 0.0
        textField.attributedPlaceholder =
        NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return textField
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        label.textColor = .white
        label.font = UIFont(name: "Inter-Light", size: 12)
        label.textAlignment = .left
        return label
    }()
    
    lazy var passwordView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "detailBlue")
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Inter-Light", size: 12)
        textField.leftViewMode = .always
        textField.autocorrectionType = .no
        textField.textColor = .white
        textField.layer.borderWidth = 0.0
        textField.attributedPlaceholder =
        NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return textField
    }()
    
    lazy var updateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Atualizar", for: .normal)
        button.backgroundColor = UIColor(named: "pink")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 18
        button.titleLabel?.font = UIFont(name: "Poppins-Light", size: 14)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "darkBlue")
        self.addSubview(self.titleLabel)
        self.addSubview(self.containerView)
        self.containerView.addSubview(self.userImageView)
        self.addSubview(nameLabel)
        self.addSubview(nameView)
        self.nameView.addSubview(nameTextField)
        self.addSubview(emailLabel)
        self.addSubview(emailView)
        self.emailView.addSubview(self.emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordView)
        self.passwordView.addSubview(passwordTextField)
        self.addSubview(updateButton)
        configConstraints()
        bindLayoutEvents()
    }
    
    func show(data: User) {
        userImageView.image = data.ProfileImage
        nameTextField.text = data.name
        emailTextField.text = data.email
        passwordTextField.text = data.password
    }
    
    @objc private func bindLayoutEvents() {
        updateButton.addTarget(self, action: #selector(updateButtonHandler), for: .touchUpInside)
    }
    
    @objc private func updateButtonHandler() {
        didTapUpdateButton?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 85),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 25),
            
            self.containerView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 70),
            self.containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.containerView.widthAnchor.constraint(equalToConstant: 80),
            self.containerView.heightAnchor.constraint(equalToConstant: 80),
            
            self.userImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            self.userImageView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            self.userImageView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
            self.userImageView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.userImageView.bottomAnchor, constant: 50),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            self.nameView.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 15),
            self.nameView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.nameView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.nameView.heightAnchor.constraint(equalToConstant: 35),
            
            self.nameTextField.topAnchor.constraint(equalTo: self.nameView.topAnchor),
            self.nameTextField.leadingAnchor.constraint(equalTo: self.nameView.leadingAnchor, constant: 25),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.nameView.trailingAnchor),
            self.nameTextField.bottomAnchor.constraint(equalTo: self.nameView.bottomAnchor),
            
            self.emailLabel.topAnchor.constraint(equalTo: self.nameView.bottomAnchor, constant: 30),
            self.emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            self.emailView.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 15),
            self.emailView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.emailView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.emailView.heightAnchor.constraint(equalToConstant: 35),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.emailView.topAnchor),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.emailView.leadingAnchor, constant: 25),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.emailView.trailingAnchor),
            self.emailTextField.bottomAnchor.constraint(equalTo: self.emailView.bottomAnchor),
            
            self.passwordLabel.topAnchor.constraint(equalTo: self.emailView.bottomAnchor, constant: 30),
            self.passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.passwordLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            self.passwordView.topAnchor.constraint(equalTo: self.passwordLabel.bottomAnchor, constant: 15),
            self.passwordView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.passwordView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.passwordView.heightAnchor.constraint(equalToConstant: 35),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.passwordView.topAnchor),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.passwordView.leadingAnchor, constant: 25),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.passwordView.trailingAnchor),
            self.passwordTextField.bottomAnchor.constraint(equalTo: self.passwordView.bottomAnchor),
            
            self.updateButton.topAnchor.constraint(equalTo: self.passwordView.bottomAnchor, constant: 50),
            self.updateButton.trailingAnchor.constraint(equalTo: self.passwordView.trailingAnchor),
            self.updateButton.heightAnchor.constraint(equalToConstant: 37),
            self.updateButton.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
}
