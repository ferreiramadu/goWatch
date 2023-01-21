import Quick
import Nimble
@testable import goWatch

class categoryModelTests: QuickSpec {
    override func spec() {
        
        var sut: CategoryModel!
        
        beforeEach {
            sut = CategoryModel()
        }
        
        describe("#findAll") {
            context("validate Find All returns") {
                it("is not empty") {
                    expect(sut.findAll()).toNot(beEmpty())
                }
                
                it("returns all categories") {
                    expect(sut.findAll().count) == 3
                }
            }
        }
        
        describe("#findById") {
            context("returns the correct category") {
                it ("search for id=0") {
                    expect(sut.findById(Index: 0)).to(equal(Category(id: 0, title: "Animação")))
                }
            }
        }
        
        describe("#countElements") {
            context("validate count Elements returns") {
                it("return the correct value") {
                    expect(sut.countElements) == 3
                }
            }
        }
        
        afterEach {
            sut = nil
        }
    }
}
