import Quick
import Nimble
import UIKit
@testable import goWatch

class movieModelTests: QuickSpec {
    override func spec() {
        
        var sut: MovieModel!
        
        beforeEach {
            sut = MovieModel()
        }
        
        describe("#findAll") {
            context("validate Find All returns") {
                it("is not empty") {
                    expect(sut.findAll()).toNot(beEmpty())
                }
                
                it("returns all movies") {
                    expect(sut.findAll().count) == 4
                }
            }
        }
        
        describe("#findById") {
            context("Find by id return the correct movie") {
                it("search for id = 0") {
                    expect(sut.findById(Index: 0).title).to(equal("Raya e o último dragão"))
                    expect(sut.findById(Index: 0).synopsis).to(equal("Há muito tempo, no mundo de fantasia de Kumandra, humanos e dragões viviam juntos em harmonia. Mas quando uma força maligna ameaçou a terra, os dragões se sacrificaram para salvar a humanidade. Agora, 500 anos depois, o mesmo mal voltou e cabe a uma guerreira solitária, Raya, rastrear o lendário último dragão para restaurar a terra despedaçada e seu povo dividido."))
                    expect(sut.findById(Index: 0).year).to(equal(2011))
                }
            }
        }
        
        describe("#countElements") {
            context("validate count Elements returns") {
                it("return the correct value") {
                    expect(sut.countElements) > 3
                }
            }
        }
        
        describe("#findByCategory") {
            context("return the correct value") {
                it("search for id=0") {
                    for movie in sut.findByCategory(id: 0) {
                        expect(movie.category.id).to(equal(0))
                    }
                }
            }
        }
        
        describe("#mostLiked") {
            context("validate most liked returns") {
                it("validate if returns 4 items") {
                    expect(sut.mostLiked().count) > 3
                }
            }
        }
        
        afterEach {
            sut = nil
        }
    }
}
