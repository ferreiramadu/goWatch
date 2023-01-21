import UIKit

class RegisterViewController: UIViewController {
    
    var screen: RegisterView?
    var userModel: UserModel = UserModel()
    
    override func loadView() {
        self.screen = RegisterView()
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen?.didTapLoginButton = {[weak self] in self?.sendToLogin()}
        self.screen?.didTapRegisterButton = {[weak self] in self?.register()}
        self.navigationItem.setHidesBackButton(true, animated: false)
        hideKeyboardWhenTapped()
    }
    
    @objc private func register() {
        let name: String = self.screen?.getNome() ?? ""
        let email: String = self.screen?.getEmail() ?? ""
        let password: String = self.screen?.getPassword() ?? ""

        let response = userModel.register(name: name, email: email, password: password)

        switch response.hasSucess {
            case true:
                navigationController?.pushViewController(LoginViewController(), animated: true)
            case false:
                self.screen?.showError(title: response.message)
        }
    }
    
    @objc private func sendToLogin() {
        let viewController = LoginViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        addBottomBorder(textFieldView: self.screen?.getNameView() ?? UIView())
        addBottomBorder(textFieldView: self.screen?.getEmailView() ?? UIView())
        addBottomBorder(textFieldView: self.screen?.getPasswordView() ?? UIView())
    }
    
    func addBottomBorder(textFieldView: UIView) {
        let thickness: CGFloat = 1.0
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x:0, y: textFieldView.frame.size.height - thickness, width: textFieldView.frame.size.width, height:thickness)
        bottomBorder.backgroundColor = UIColor(named: "gray")?.cgColor
        textFieldView.layer.addSublayer(bottomBorder)
    }
}
