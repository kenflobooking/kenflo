protocol HLPhotoScrollCollectionCellProtocol: class {
    func cellDidSelect(_ cell: HLPhotoScrollCollectionCell)
    func cellDidHighlight(_ cell: HLPhotoScrollCollectionCell)
}

@objcMembers
class HLPhotoScrollCollectionCell: UICollectionViewCell {

    lazy var photoView: HLPhotoView = self.createPhotoView()
    weak var delegate: HLPhotoScrollCollectionCellProtocol?
    var photoIndex: Int = 0

    var needShowProgressView: Bool = true {
        didSet {
            self.photoView.needShowProgressView = self.needShowProgressView
        }
    }

    var image: UIImage? {
        get {
            return self.photoView.image
        }

        set(newValue) {
            self.photoView.image = newValue
        }
    }

    var placeholderContentMode: UIView.ContentMode = UIView.ContentMode.center {
        didSet {
            self.photoView.placeholderContentMode = self.placeholderContentMode
        }
    }

    var imageContentMode: UIView.ContentMode = UIView.ContentMode.scaleAspectFill {
        didSet {
            self.photoView.imageContentMode = self.imageContentMode
        }
    }

    // MARK: - Required methods

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Override methods

    override var reuseIdentifier: String? {
        return "PhotoScrollCollectionCell"
    }

    override var bounds: CGRect {
        didSet {
            self.contentView.frame = self.bounds
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.initializeProgrammatically()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        self.photoView.setupImage(nil)
        self.applySelectedStyle(false)
    }

    override var isSelected: Bool {
        didSet {
            self.delegate?.cellDidSelect(self)
        }
    }

    override var isHighlighted: Bool {
        didSet {
            self.delegate?.cellDidHighlight(self)
        }
    }

    // MARK: - Internal methods

    func setImage(url: URL, placeholder: UIImage?, animated: Bool) {
        self.photoView.setImage(url: url, placeholder: placeholder, animated: animated)
    }

    func setImage(url: URL, thumbUrl: URL, placeholder: UIImage?, animated: Bool) {
        if let thumbImage = HLPhotoManager.sharedManager.imageFromDiskCached(thumbUrl) {
            self.photoView.needShowPlaceholderWhileLoading = true
            self.photoView.setImage(url: url, placeholder: thumbImage, animated: animated)
        } else {
            self.photoView.needShowPlaceholderWhileLoading = false
            self.photoView.setImage(url: url, placeholder: placeholder, animated: animated)
        }
    }

    func createPhotoView () -> HLPhotoView {
        let photoView = HLPhotoView()
        photoView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]

        return photoView
    }

    func applySelectedStyle(_ selected: Bool) {
        if selected {
            photoView.layer.borderColor = JRColorScheme.darkTextColor().cgColor
            self.photoView.layer.borderWidth = 4
        } else {
            self.photoView.layer.borderWidth = 0
        }
    }

    func applyHightlightedStyle(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            self.photoView.showOverlayViewAnimated(animated)
        } else {
            self.photoView.hideOverlayViewAimated(animated)
        }
    }

    // MARK: - Private methods

    fileprivate func initializeProgrammatically() {
        self.layer.contentsGravity = CALayerContentsGravity.center
        self.layer.masksToBounds = true

        self.contentView.addSubview(self.photoView)
        self.photoView.frame = self.bounds
        self.setNeedsLayout()
    }

}
