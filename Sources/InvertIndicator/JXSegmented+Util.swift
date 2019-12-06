//
//  JXSegmented+Util.swift
//  JXSegmentedView
//
//  Created by HYM on 2019/12/6.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import Foundation

protocol JXSegmentedIndicatorCopyProtocol {
    func makeCopy() -> JXSegmentedIndicatorBaseView
    func inverIndicatorMakeCopy(from base:JXSegmentedIndicatorBaseView) -> JXSegmentedIndicatorBaseView
}

extension JXSegmentedIndicatorBaseView : JXSegmentedIndicatorCopyProtocol {
    @objc func makeCopy() -> JXSegmentedIndicatorBaseView {
        let base = self.inverIndicatorMakeCopy(from: JXSegmentedIndicatorBaseView())
        return base
    }
    
    func inverIndicatorMakeCopy(from base:JXSegmentedIndicatorBaseView) -> JXSegmentedIndicatorBaseView {
        base.indicatorWidth = self.indicatorWidth
        base.indicatorHeight = self.indicatorHeight
        base.indicatorCornerRadius = self.indicatorCornerRadius
        base.indicatorColor = self.indicatorColor
        base.indicatorPosition = self.indicatorPosition
        base.verticalOffset = self.verticalOffset
        base.isScrollEnabled = self.isScrollEnabled
        base.isIndicatorConvertToItemFrameEnabled = self.isIndicatorConvertToItemFrameEnabled
        base.scrollAnimationDuration = self.scrollAnimationDuration
        return base
    }
    
}

public extension JXSegmentedIndicatorBackgroundView {
    
    @objc override func makeCopy() -> JXSegmentedIndicatorBaseView {
        let base = super.inverIndicatorMakeCopy(from: JXSegmentedIndicatorBackgroundView()) as! JXSegmentedIndicatorBackgroundView
        base.backgroundWidthIncrement = self.backgroundWidthIncrement
        return base
    }
}

