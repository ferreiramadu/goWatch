import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let identifier: String = "categoryId"
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "detailBlue")
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Romance"
        label.font = UIFont(name: "Inter-Light", size: 12)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(containerView)
        self.containerView.addSubview(self.categoryLabel)
        configConstraints()
    }
    
    func show(title: String) {
        categoryLabel.text = title
    }
    
    override var isSelected: Bool {
        didSet {
            containerView.backgroundColor = isSelected ? UIColor(named: "pink") : UIColor(named: "detailBlue")
        }
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
            self.categoryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.categoryLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
