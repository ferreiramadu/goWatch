import UIKit

class Header: UICollectionReusableView {
    
    static let identifier: String = "headerId"
    static let dinamicHeaderId = "dinamicHeaderId"
    
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.textColor = .white
        label.text = "Categorias"
        label.font = UIFont(name: "Inter-Medium", size: 18)
        addSubview(label)
    }
    
    func show(title: String) {
        label.text = title
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
