import UIKit

extension String {
    func validateName(name: String) -> Bool {
        let nameRegex = ".{3,}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return validateRegex.evaluate(with: name)
    }
    func validateEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return validateRegex.evaluate(with: email)
    }
    func validatePassword(password: String) -> Bool {
        let passwordRegex = ".{8,}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return validateRegex.evaluate(with: password)
    }
}


extension UIView {
    func roundCorners(cornerRadiuns: CGFloat, typeCorners: CACornerMask) {
        self.layer.cornerRadius = cornerRadiuns
        self.layer.maskedCorners = typeCorners
        self.clipsToBounds = true
    }
}

extension CACornerMask {
    static public let inferiorDireito: CACornerMask = .layerMaxXMaxYCorner
    static public let inferiorEsquerdo: CACornerMask = .layerMinXMaxYCorner
    static public let superiorDireito: CACornerMask = .layerMaxXMinYCorner
    static public let superiorEsquerdo: CACornerMask = .layerMinXMinYCorner
}

extension UIViewController {
    func hideKeyboardWhenTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
