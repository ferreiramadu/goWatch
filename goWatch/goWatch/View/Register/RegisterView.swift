import UIKit

final class RegisterView: UIView {
    
    var didTapLoginButton: (() -> Void)?
    var didTapRegisterButton: (() -> Void)?
    
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "backgroundOval.png")
        return image
    }()
    
    private lazy var circleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(named: "gray")?.cgColor
        return view
    }()
    
    private lazy var contentCircleImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "splashIconSmall.png")
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vamos começar"
        label.textColor = UIColor(named: "darkBlue")
        label.font = UIFont(name: "Inter-Bold", size: 22)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Preencha os campos para cadastrar-se"
        label.textColor = .black
        label.font = UIFont(name: "Inter-Light", size: 13)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Seu nome"
        label.textColor = UIColor(named: "grayDetail")
        label.font = UIFont(name: "Inter-Light", size: 15)
        return label
    }()
    
    private lazy var nameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Inter-Medium", size: 15)
        textField.leftViewMode = .always
        textField.autocorrectionType = .no
        textField.textColor = .black
        textField.layer.borderWidth = 0.0
        textField.autocapitalizationType = .none
        return textField
    }()

    private lazy var nameImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "user.png")
        return image
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "E-mail"
        label.textColor = UIColor(named: "grayDetail")
        label.font = UIFont(name: "Inter-Light", size: 15)
        return label
    }()
    
    private lazy var emailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Inter-Medium", size: 15)
        textField.leftViewMode = .always
        textField.autocorrectionType = .no
        textField.keyboardType = .emailAddress
        textField.textColor = .black
        textField.layer.borderWidth = 0.0
        textField.autocapitalizationType = .none
        return textField
    }()

    private lazy var emailImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "mail.png")
        return image
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        label.textColor = UIColor(named: "grayDetail")
        label.font = UIFont(name: "Inter-Light", size: 15)
        return label
    }()
    
    private lazy var passwordView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Inter-Medium", size: 15)
        textField.leftViewMode = .always
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        textField.textColor = .black
        textField.layer.borderWidth = 0.0
        textField.autocapitalizationType = .none
        return textField
    }()

    private lazy var passwordImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "lock.png")
        return image
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.backgroundColor = UIColor(named: "pink")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 18
        button.titleLabel?.font = UIFont(name: "Inter-Light", size: 17)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Já possui uma conta? Entrar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Light", size: 15)
        return button
    }()
    
    private lazy var errorMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = UIFont(name: "Inter-Medium", size: 13)
        label.isHidden = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(logoImageView)
        self.addSubview(circleView)
        self.circleView.addSubview(self.contentCircleImageView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(nameLabel)
        self.addSubview(nameView)
        self.nameView.addSubview(self.nameImageView)
        self.nameView.addSubview(self.nameTextField)
        self.addSubview(emailLabel)
        self.addSubview(emailView)
        self.emailView.addSubview(self.emailImageView)
        self.emailView.addSubview(self.emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordView)
        self.passwordView.addSubview(self.passwordImageView)
        self.passwordView.addSubview(self.passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(registerButton)
        self.addSubview(errorMessageLabel)
        configConstraints()
        bindLayoutEvents()
    }
    
    public func getNameView() -> UIView {
        return nameView
    }
    
    public func getEmailView() -> UIView {
        return emailView
    }
    
    public func getNome() -> String {
        return nameTextField.text ?? ""
    }
    
    public func getEmail() -> String {
        return emailTextField.text ?? ""
    }
    
    public func getPassword() -> String {
        return passwordTextField.text ?? ""
    }
    
    public func getPasswordView() -> UIView {
        return passwordView
    }
    
    public func showError(title: String) -> Void {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = title 
    }
    
    @objc private func bindLayoutEvents() {
        registerButton.addTarget(self, action: #selector(registerButtonHandler), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonHandler), for: .touchUpInside)
    }
    
    @objc private func loginButtonHandler() {
        didTapLoginButton?()
    }
    
    @objc private func registerButtonHandler() {
        didTapRegisterButton?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.logoImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.circleView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: -40),
            self.circleView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.circleView.widthAnchor.constraint(equalToConstant: 98),
            self.circleView.heightAnchor.constraint(equalToConstant: 98),
            
            self.contentCircleImageView.centerXAnchor.constraint(equalTo: self.circleView.centerXAnchor),
            self.contentCircleImageView.centerYAnchor.constraint(equalTo: self.circleView.centerYAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.circleView.bottomAnchor, constant: 15),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 11),
            self.descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.errorMessageLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 15),
            self.errorMessageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 54),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.nameView.leadingAnchor),
            
            self.nameView.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 21),
            self.nameView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35),
            self.nameView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35),
            self.nameView.heightAnchor.constraint(equalToConstant: 40),
            
            self.nameImageView.widthAnchor.constraint(equalToConstant: 23),
            self.nameImageView.heightAnchor.constraint(equalToConstant: 23),
            self.nameImageView.centerYAnchor.constraint(equalTo: self.nameView.centerYAnchor),
            self.nameImageView.leadingAnchor.constraint(equalTo: self.nameView.leadingAnchor, constant: 5),
            
            self.nameTextField.leadingAnchor.constraint(equalTo: self.nameView.leadingAnchor, constant: 40),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.nameView.trailingAnchor),
            self.nameTextField.heightAnchor.constraint(equalTo: self.nameView.heightAnchor),
            
            self.emailLabel.topAnchor.constraint(equalTo: self.nameView.bottomAnchor, constant: 36),
            self.emailLabel.leadingAnchor.constraint(equalTo: self.emailView.leadingAnchor),
            
            self.emailView.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 21),
            self.emailView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35),
            self.emailView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35),
            self.emailView.heightAnchor.constraint(equalToConstant: 40),
            
            self.emailImageView.widthAnchor.constraint(equalToConstant: 23),
            self.emailImageView.heightAnchor.constraint(equalToConstant: 15),
            self.emailImageView.centerYAnchor.constraint(equalTo: self.emailView.centerYAnchor),
            self.emailImageView.leadingAnchor.constraint(equalTo: self.emailView.leadingAnchor, constant: 5),
            
            self.emailTextField.leadingAnchor.constraint(equalTo: self.emailView.leadingAnchor, constant: 40),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.emailView.trailingAnchor),
            self.emailTextField.heightAnchor.constraint(equalTo: self.emailView.heightAnchor),
            
            self.passwordLabel.topAnchor.constraint(equalTo: self.emailView.bottomAnchor, constant: 36),
            self.passwordLabel.leadingAnchor.constraint(equalTo: self.passwordView.leadingAnchor),
            
            self.passwordView.topAnchor.constraint(equalTo: self.passwordLabel.bottomAnchor, constant: 21),
            self.passwordView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35),
            self.passwordView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35),
            self.passwordView.heightAnchor.constraint(equalToConstant: 40),
            
            self.passwordImageView.widthAnchor.constraint(equalToConstant: 19),
            self.passwordImageView.heightAnchor.constraint(equalToConstant: 26),
            self.passwordImageView.centerYAnchor.constraint(equalTo: self.passwordView.centerYAnchor),
            self.passwordImageView.leadingAnchor.constraint(equalTo: self.passwordView.leadingAnchor, constant: 5),
            
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.passwordView.leadingAnchor, constant: 40),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.passwordView.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.passwordView.heightAnchor),
            
            self.registerButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 43),
            self.registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            self.registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.registerButton.heightAnchor.constraint(equalToConstant: 57),
            
            self.loginButton.topAnchor.constraint(equalTo: self.registerButton.bottomAnchor, constant: 16),
            self.loginButton.trailingAnchor.constraint(equalTo: self.registerButton.trailingAnchor),
            self.loginButton.leadingAnchor.constraint(equalTo: self.registerButton.leadingAnchor),
            self.loginButton.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
