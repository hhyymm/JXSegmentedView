//
//  JXSegmentedInverIndicator.swift
//  JXSegmentedView
//
//  Created by HYM on 2019/12/5.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import UIKit

open class JXSegmentedInverIndicatorView: UIView {
    
    open var inverView: JXSegmentedIndicatorBaseView = JXSegmentedIndicatorBaseView()
    
    private var container:[Int:JXSegmentedIndicatorBaseView] = [:]
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func reload() {
        
        self.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        self.container.forEach { (arg0) in
            let (_, value) = arg0
            self.addSubview(value)
        }
    }
    
    func configWith(_ index:NSInteger, model: JXSegmentedIndicatorParamsModel) -> Void {
        let model_ = JXSegmentedIndicatorParamsModel()
        model_.currentSelectedItemFrame = model.currentSelectedItemFrame

        model_.currentSelectedIndex = model.currentSelectedIndex
        
        var item : JXSegmentedIndicatorBaseView
        if let object = self.container[index] {
            item = object
        } else {
            item = inverView.makeCopy()
        }
        
        item.refreshIndicatorState(model: model)
        self.container[index] = item
    }
    
    
    open override func layoutSubviews() {
        super.layoutSubviews()

        self.container.forEach { (arg0) in
            let (_, value) = arg0
            self.addSubview(value)
        }
    }
}
