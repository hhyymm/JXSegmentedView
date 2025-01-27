//
//  JXSegmentedCollectionView.swift
//  JXSegmentedView
//
//  Created by jiaxin on 2018/12/26.
//  Copyright © 2018 jiaxin. All rights reserved.
//

import UIKit

open class JXSegmentedCollectionView: UICollectionView {

    open var indicators = [JXSegmentedIndicatorProtocol & UIView]() {
        willSet {
            for indicator in indicators {
                indicator.removeFromSuperview()
            }
        }
        didSet {
            for indicator in indicators {
                addSubview(indicator)
            }
        }
    }
    
    open var inverIndicator: JXSegmentedInverIndicatorView?{
        willSet {
            inverIndicator?.removeFromSuperview()
        }
        didSet {
            if let item = inverIndicator {
                addSubview(item)
            }
        }
    }

    open override func layoutSubviews() {
        super.layoutSubviews()

        for indicator in indicators {
            sendSubviewToBack(indicator)
        }
        
        if let item = inverIndicator {
            sendSubviewToBack(item)
        }
    }

}
