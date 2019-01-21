//
//  DesignableXib.swift
//  Einsteinium
//
//  Created by Hindrik on 27/08/2018.
//  Copyright © 2018 E-sites. All rights reserved.
//

import UIKit

open class DesignableXibView: UIView {

    private var nibName: String {
        return String(describing: type(of: self))
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }

    /// Override in custom view class
    open func customInit() {
        backgroundColor = UIColor.clear
    }

    private func getView() -> UIView? {
        guard let views = Bundle.main.loadNibNamed(nibName, owner: self, options: nil) else { return nil }

        for view in views {
            if let view = view as? UIView {
                return view
            }
        }

        return nil
    }

    private func loadNib() {
        guard let contentView = getView() else { return }

        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.leftAnchor.constraint(equalTo: leftAnchor)
        ])


        customInit()
    }
}
