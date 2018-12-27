//
//  SampleVcRouter.swift
//  Ausbin
//
//  Created by bin on 2018/12/25.
//  Copyright © 2018年 BinHuang. All rights reserved.
//

import UIKit

// [Ausbin] 新增Router类，作为vcView和vcService的信任中介
class SampleVcRouter: AusbinVcRouter {
    
    //MARK: - 处理View的Action事件，通过Service刷新Model数据
    @objc var handler : SampleVcService!;
    //MARK: - Model提供给View刷新界面的model数据
    @objc var dataSet : SampleVcModel!;
    
    init(vcView : SampleVcView) {
        super.init(
            handler: SampleVcService(),
            vcModelKeyPath: #keyPath(SampleVcService.vcModel),
            handlerKeyPath: #keyPath(SampleVcRouter.handler),
            dataSetKeyPath:#keyPath(SampleVcRouter.dataSet),
            vcView: vcView
        );
    }
    
    required init(coder aDecoder: NSCoder?) {
        super.init(coder: nil);
    }
}
