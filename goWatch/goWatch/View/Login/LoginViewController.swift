import UIKit
import LocalAuthentication

class LoginViewController: UIViewController {
    var screen: LoginView?
    private var userModel: UserModel = UserModel()
    
    override func loadView() {
        self.screen = LoginView()
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false) // esconde o backbutton
        self.screen?.didTapLoginButton = {[weak self] in self?.login()}
        self.screen?.didTapRegisterButton = {[weak self] in self?.sendToRegister()}
        hideKeyboardWhenTapped()
        alertFaceID()
    }

    private func login() {
        let email: String = self.screen?.getUserEmail() ?? ""
        let password: String = self.screen?.getUserPassword() ?? ""
        
        if (userModel.login(email: email, password: password)) {
            self.sendToHome()
        } else {
            let alert = UIAlertController(title: "OOPS..", message: "Email ou senha inválidos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tentar novamente", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func alertFaceID() {
            let alert = UIAlertController(title: "Deseja realizar o login com Face ID?", message: "clique em ok para ativar o uso do Face ID", preferredStyle: .alert)
        
            alert.addAction(UIAlertAction(title: "OK!", style: .default, handler: {_ in
                self.faceIdLogin()
            }))
            
            alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    
    private func faceIdLogin(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "informe sua authenticacao"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { sucess, error in
                if sucess {
                    DispatchQueue.main.async {
                        self.sendToHome()
                    }
                } else {
                    print("Falha na autenticação")
                }
            }
        } else {
            print("Authenticacao indisponivel")
        }
    }
    
    private func sendToRegister() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    private func sendToHome() {
        navigationController?.pushViewController(TabbarViewController(), animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        addBottomBorder(textFieldView: screen?.getEmailView() ?? UIView())
        addBottomBorder(textFieldView: screen?.getPasswordView() ?? UIView())
    }
    
    private func addBottomBorder(textFieldView: UIView) {
        let thickness: CGFloat = 1.0
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x:0, y: textFieldView.frame.size.height - thickness, width: textFieldView.frame.size.width, height:thickness)
        bottomBorder.backgroundColor = UIColor(named: "gray")?.cgColor
        textFieldView.layer.addSublayer(bottomBorder)
    }
}
