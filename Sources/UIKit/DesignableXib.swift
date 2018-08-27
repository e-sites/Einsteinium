//
//  DesignableXib.swift
//  Einsteinium
//
//  Created by Hindrik on 27/08/2018.
//  Copyright © 2018 E-sites. All rights reserved.
//

import UIKit
import EasyPeasy

class DesignableXib: UIView {

    private var nibName: String {
        return String(describing: type(of: self))
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }

    /// Override in custom view class
    func customInit() {
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
        contentView.easy.layout(Edges())

        customInit()
    }
}
