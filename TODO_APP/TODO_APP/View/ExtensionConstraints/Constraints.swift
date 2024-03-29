import UIKit

extension UIView {
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor)
            .isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
    func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil,
                     bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
        anchorWithConstantToTop(top: top, left: left, bottom: bottom, right: right,
                                topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
    func anchorWithConstantToTop(top: NSLayoutYAxisAnchor? = nil,
                                 left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil,
                                 right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0,
                                 bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
        _ = anchor(top: top, left: left, bottom: bottom, right: right, topConstant: topConstant,
                   leftConstant: leftConstant, bottomConstant: bottomConstant,
                   rightConstant: rightConstant, widthConstant: 0, heightConstant: 0)
    }
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0,
                leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0,
                widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) -> [NSLayoutConstraint]? {
        translatesAutoresizingMaskIntoConstraints = false
        var anchors = [NSLayoutConstraint]()
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }
        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
        }
        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
        }
        if widthConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: widthConstant))
            }
        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
            }
            anchors.forEach({$0.isActive = true})
            return anchors
    }
}
