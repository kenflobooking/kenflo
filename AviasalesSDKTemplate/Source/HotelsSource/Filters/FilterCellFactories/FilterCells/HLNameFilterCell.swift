protocol NameFilterDelegate: class, NSObjectProtocol {
    func dropNameFilter()
}

class HLNameFilterCell: HLDividerCell {

    @IBOutlet private weak var button: UIButton!

    weak var delegate: NameFilterDelegate?

    func setTitle(_ title: String) {
        if title.count == 0 {
            titleLabel.text = NSLS("HL_FILTERS_NAME_TEXTFIELD_PLACEHOLDER")
            titleLabel.textColor = JRColorScheme.darkTextColor()
            titleLabel.alpha = 0.5
            button.setImage(UIImage(named: "nameFilterLoupe"), for: UIControl.State.disabled)
            button.isEnabled = false
        } else {
            titleLabel.text = title
            titleLabel.textColor = JRColorScheme.actionColor()
            titleLabel.alpha = 1.0
            button.setImage(UIImage(named: "nameFilterСross"), for: UIControl.State())
            button.isEnabled = true
        }
    }

    @IBAction func dropNameFilter() {
        delegate?.dropNameFilter()
        setTitle("")
    }
}
