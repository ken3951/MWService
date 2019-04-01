//
//  ViewProtocol.swift
//  EOPPad
//
//  Created by mwk_pro on 2018/7/27.
//  Copyright © 2018年 mwk_pro. All rights reserved.
//

import Foundation
import UIKit

public protocol MWViewLoadable {
    
}

public extension MWViewLoadable {
    public static func loadNibView() -> Self {
        let view = Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)!.first as! Self
        return view
    }
}

public protocol MWViewProtocol {
    
}

public extension MWViewProtocol where Self : UIView {
    
    ///移除view,在inView
    public static func dismiss(inView: UIView?) {
        if inView == nil {
            return
        }
        for view in inView!.subviews {
            if view.isKind(of: self) {
                DispatchQueue.main.async {
                    view.removeFromSuperview()
                }
            }
        }
    }
    
    ///移除view,在当前主页面
    public static func dismissInMainView() {
        self.dismiss(inView: mw_getCurrentMainView())
    }
    
    ///移除view,在当前根视图
    public static func dismissInRootView() {
        self.dismiss(inView: mw_getCurrentRootVC()?.view)
    }
}

