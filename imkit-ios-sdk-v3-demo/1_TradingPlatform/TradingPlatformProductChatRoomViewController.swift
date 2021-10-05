//
//  TradingPlatformProductChatRoomViewController.swift
//  imkit-ios-sdk-v3-demo
//
//  Created by Sean on 2021/7/6.
//  Copyright © 2021 Howard Sun. All rights reserved.
//

import Foundation
import IMKit

class TradingPlatformProductChatRoomViewController: IMChatRoomViewController {
    
    private var defaultIMStyleMsgBgColor: UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultIMStyleMsgBgColor = IMStyle.messages.backgroundColor
        // imkit-customized: 整個聊天室背景
        IMStyle.messages.backgroundColor = .clear // background-color of cell
        IMStyle.messages.inputAccessory.isSendButtonAudioButtonCombined = false
        
        // imkit-customized: 對方的訊息泡泡
        IMStyle.messages.incomingCell.backgroundColor = DemoScenarioType.tradingPlatform.subColor
        // imkit-customized: 自己的訊息泡泡
        IMStyle.messages.outgoingCell.backgroundColor = UIColor(named: "tradingPlatformGrayColor")!
        
        inputBarView = TradingPlatformInputAccessoryView()
        inputBarView.viewController = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.backgroundColor = .white
        // imkit-customized: 1. custom navigation bar color
        navigationController?.navigationBar.barTintColor = DemoScenarioType.tradingPlatform.subColor
        navigationController?.navigationBar.tintColor = .black

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // restore
        IMStyle.messages.inputAccessory.isSendButtonAudioButtonCombined = true
        if let bgColor = defaultIMStyleMsgBgColor {
            IMStyle.messages.backgroundColor = bgColor
        }
    }
}
