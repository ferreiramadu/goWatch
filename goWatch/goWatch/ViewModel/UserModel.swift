import UIKit

class UserModel {
    private var user: User = User(id: 0, name: "Juliana", email: "teste@teste.com", password: "12345678", ProfileImage: UIImage(named: "avatar") ?? UIImage())
    
    public func getUser() -> User {
        return user
    }
    
    public func getName() -> String {
        return user.name
    }
    
    public func getEmail() -> String {
        return user.email
    }
    
    public func getPassword() -> String {
        return user.password
    }
    
    public func getProfileImage() -> UIImage {
        return user.ProfileImage
    }
    
    public func setName(name: String) {
        user.name = name
    }
    
    public func setEmail(email: String) {
        user.email = email
    }
    
    public func setPassword(password: String) {
        user.password = password
    }
    
    public func setProfileImage(image: UIImage) {
        user.ProfileImage = image
    }
    
    public func login(email: String, password: String) -> Bool {
        if (email == user.email && password == user.password) {
            return true
        } else {
            return false
        }
    }
    
    public func register(name: String, email: String, password: String) -> Message {
        if (!name.validateName(name: name)) {
            return Message(hasSucess: false, message: "Nome precisa no mínimo 3 caracteres")
        } else if (!email.validateEmail(email: email)) {
            return Message(hasSucess: false, message: "Email inválido")
        } else if (!password.validatePassword(password: password)) {
            return Message(hasSucess: false, message: "Senha precisa ter no mínimo 8 caracteres")
        } else {
            //realiza o cadastro e retorna sucess
            return Message(hasSucess: true, message: "Cadastro realizado com sucesso!")
        }
    }
}

struct Message {
    var hasSucess: Bool
    var message: String
}
