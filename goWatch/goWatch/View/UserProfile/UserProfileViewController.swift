import UIKit

class UserProfileViewController: UIViewController {
    var screen: UserProfileView?
    var userModel: UserModel = UserModel()
    
    override func loadView() {
        view = screen
    }
    
    init(contentView: UserProfileView = UserProfileView()) {
        self.screen = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen?.didTapUpdateButton = {[weak self] in self?.update()}
        self.screen?.show(data: userModel.getUser())
        hideKeyboardWhenTapped()
    }
    
    func update() {
        print("atualizando")
    }
}
