import UIKit

class DetailViewController: UIViewController {
    var screen: DetailView?
    
    override func loadView() {
        view = screen
    }
    
    init(contentView: DetailView = DetailView()) {
        self.screen = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false) // esconde o backbutton
        self.navigationController?.setNavigationBarHidden(true, animated: false) // esconde a navigationBar
        self.screen?.didTapBackButton = {[weak self] in self?.goBack()}
    }
    
    public func setMovieData(movieData: Movie) {
        self.screen?.show(data: movieData)
    }
    
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
