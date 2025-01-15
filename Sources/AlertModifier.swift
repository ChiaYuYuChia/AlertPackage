//
//  AlertModifier.swift
//  AlertPackage
//
//  Created by ChiaYu Chang on 2025/1/8.
//

import SwiftUI

/** 提示訊息 SwiftUI Modifier */
struct AlertModifier: ViewModifier {
    
    // MARK: -
    
    @State private var isPresented: Bool = false // 開啟 Alert 頁面識別
    
    private var title: String = "" // 標題
    private var message: String? // 副標題
    private var buttons: [AlertModifier.ButtonInfo] = [] // 按鈕項目
    
    private var showIndex: Int = 0 // 顯示 index, 異動項目時觸發 isPresented true, 開啟提示視窗頁面
    
    // MARK: -
    
    func body(content: Content) -> some View {
        
        content
        .alert(
            title,
            isPresented: $isPresented,
            actions: {
                
                // 操作按鈕
                if !buttons.isEmpty {
                    
                    ForEach(0 ..< buttons.count, id: \.self) { index in
                        
                        let buttonInfo = buttons[index]
                        
                        Button(buttonInfo.title,
                               role: buttonInfo.role,
                               action: buttonInfo.action)
                    }
                }
            },
            message: {
            
            if let message = message, !message.isEmpty {
                
                Text(message) // 副標題
            }
        })
        .onChange(of: showIndex, perform: { newValue in
            
            self.isPresented = true // 開啟提示訊息
        })
    }
    
    // MARK: -
}

// MARK: -

extension AlertModifier {
    
    /** 顯示提示訊息視窗 */
    mutating func show(title: String, message: String?, buttons: [AlertModifier.ButtonInfo]) {
        
        self.title = title // 標題
        self.message = message // 副標題
        self.buttons = buttons // 按鈕項目
        
        self.showIndex += 1 // 顯示提時訊息
    }
}

// MARK: -

extension AlertModifier {
    
    /** 按鈕項目 */
    struct ButtonInfo {
        
        var title: String // 按鈕標題
        var role: ButtonRole? = nil // 按鈕樣式
        var action: () -> Void = { } // 事件
    }
}

// MARK: -
