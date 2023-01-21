
import UIKit

class OnboardingCell: UICollectionViewCell {
    
    static let identifier: String = "onboardingCell"
    var didTapNextButton: (() -> Void)?
    var didTapSkipButton: (() -> Void)?
    
    private lazy var skipButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pular", for: .normal)
        button.setTitleColor(UIColor(named: "darkBlue"), for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Light", size: 15)
        return button
    }()
    
    private lazy var centerImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "darkBlue")
        label.font = UIFont(name: "Inter-Bold", size: 23)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "darkBlue")
        label.font = UIFont(name: "Inter-Light", size: 13)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Vamos começar!", for: .normal)
        button.backgroundColor = UIColor(named: "pink")
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Light", size: 17)
        button.layer.cornerRadius = 18
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(skipButton)
        self.addSubview(centerImageView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(nextButton)
        configConstraints()
        bindLayoutEvents()
    }
    
    public func show(data: OnboardingSlide) {
        skipButton.isHidden = data.isHideSkipButton
        centerImageView.image = data.image
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        nextButton.setTitle(data.titleButton, for: .normal)
    }
    
    @objc private func bindLayoutEvents() {
        nextButton.addTarget(self, action: #selector(nextButtonHandler), for: .touchUpInside)
        skipButton.addTarget(self, action: #selector(skipButtonHandler), for: .touchUpInside)
    }
    
    @objc private func nextButtonHandler() {
        didTapNextButton?()
    }
    
    @objc private func skipButtonHandler() {
        didTapSkipButton?()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.skipButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            self.skipButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -33),
            
            self.centerImageView.topAnchor.constraint(equalTo: self.skipButton.bottomAnchor, constant: 90),
            self.centerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.centerImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.centerImageView.heightAnchor.constraint(equalToConstant: 311),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.centerImageView.bottomAnchor, constant: 64),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 17),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            self.descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.nextButton.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 45),
            self.nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.nextButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 33),
            self.nextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -33),
            self.nextButton.heightAnchor.constraint(equalToConstant: 57),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
