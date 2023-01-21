import Nimble
import Quick
@testable import goWatch

class userModelTests: QuickSpec {
    override func spec() {
        
        var sut: UserModel!
        
        beforeEach {
            sut = UserModel()
        }
        
        describe("#login") {
            context("validate login returns") {
                it("returns true with email and password correct") {
                    expect(sut.login(email: "teste@teste.com", password: "12345678")).to(beTrue())
                }
                
                it("returns false with email and password incorrect") {
                    expect(sut.login(email: "testeteste.com", password: "123456")).to(beFalse())
                }
                
                it("returns false with email incorrect and password correct") {
                    expect(sut.login(email: "testeteste.com", password: "12345678")).to(beFalse())
                }
                
                it("returns false with email correct and password incorrect") {
                    expect(sut.login(email: "teste@teste.com", password: "123456")).to(beFalse())
                }
            }
        }
        
        describe("#register") {
            context("validate the correct returns") {
                beforeEach {
                    sut = UserModel()
                }
                
                it("return false with error message if name is less than 3") {
                    expect(sut.register(name: "an", email: "teste@teste.com", password: "12345678").hasSucess).to(beFalse())
                    expect(sut.register(name: "an", email: "teste@teste.com", password: "12345678").message).to(equal("Nome precisa no mínimo 3 caracteres"))
                }
                
                it("return false with error message if email does not have @") {
                    expect(sut.register(name: "ana", email: "testeteste.com", password: "12345678").hasSucess).to(beFalse())
                    expect(sut.register(name: "ana", email: "testeteste.com", password: "12345678").message).to(equal("Email inválido"))
                }
                
                it("return false with error message if password is less than 8") {
                    expect(sut.register(name: "ana", email: "teste@teste.com", password: "123456").hasSucess).to(beFalse())
                    expect(sut.register(name: "ana", email: "teste@teste.com", password: "123456").message).to(equal("Senha precisa ter no mínimo 8 caracteres"))
                }
                
                it("return true with success message if all requirements are met") {
                    expect(sut.register(name: "ana", email: "teste@teste.com", password: "12345678").hasSucess).to(beTrue())
                    expect(sut.register(name: "ana", email: "teste@teste.com", password: "12345678").message).to(equal("Cadastro realizado com sucesso!"))
                }
            }
        }
        
        afterEach {
            sut = nil
        }
    }
}
