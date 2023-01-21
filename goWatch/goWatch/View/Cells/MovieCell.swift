import UIKit

class MovieCell: UICollectionViewCell {
    
    static let identifier: String = "movieId"
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    lazy var movieImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "cardMovie")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(containerView)
        self.containerView.addSubview(self.movieImageView)
        self.containerView.roundCorners(cornerRadiuns: 8.0, typeCorners: [.inferiorDireito, .superiorDireito, .inferiorEsquerdo, .superiorEsquerdo])
        configConstraints()
    }
    
    func show(image: UIImage) {
        movieImageView.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.topAnchor),
            self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.movieImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            self.movieImageView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),
            self.movieImageView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            self.movieImageView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
        ])
    }
}
