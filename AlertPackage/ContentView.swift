//
//  ContentView.swift
//  AlertPackage
//
//  Created by ChiaYu Chang on 2025/1/8.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: -
    
    @State var path: NavigationPath = .init()
    
    @State private var nextTitle: String = "" // 下一頁標題
    @State private var nextSelectedMessage: String = "" // 下一頁選擇訊息
    @State private var isNextPageAction: Bool = false // 下一頁
    
    @State private var alertModifier: AlertModifier = .init() // 提示訊息
    
    // MARK: -
    
    var body: some View {
        
        NavigationStack(path: $path) {
            
            ZStack {
                
                Form {
                    
                    // alert message
                    let message = "please select"
                    
                    // select button title
                    let okButtonTitle = "OK"
                    let ngButtonTitle = "NG"
                    let cancelButtonTitle = "Cancel"
                    
                    // MARK: - show alert by OK
                    
                    let okAlertTitle = "show alert by OK"
                    
                    Button(action: {
                        
                        alertModifier.show(
                            title: okAlertTitle,
                            message: message,
                            buttons: [
                                // OK Button
                                .init(title: okButtonTitle,
                                      role: nil,
                                      action: {
                                    
                                    nextTitle = okAlertTitle
                                    nextSelectedMessage = "OK"
                                    isNextPageAction.toggle()
                                })])
                    },
                    label: {
                        
                        Text(okAlertTitle)
                    })
                    
                    // MARK: - show alert by OK & Cancel
                    
                    let okAndCancelAlertTitle = "show alert by OK & Cancel"
                    
                    Button(action: {
                        
                        alertModifier.show(
                            title: okAndCancelAlertTitle,
                            message: message,
                            buttons: [
                                // OK Button
                                .init(title: okButtonTitle,
                                      role: nil,
                                      action: {
                                    
                                    nextTitle = okAndCancelAlertTitle
                                    nextSelectedMessage = okButtonTitle
                                    isNextPageAction.toggle()
                                }),
                                // Cancel Button
                                .init(title: cancelButtonTitle,
                                      role: .cancel,
                                      action: {
                                    
                                    nextTitle = okAndCancelAlertTitle
                                    nextSelectedMessage = cancelButtonTitle
                                    isNextPageAction.toggle()
                                })])
                    },
                    label: {
                        
                        Text(okAndCancelAlertTitle)
                    })
                    
                    // MARK: - show alert by OK & NG & Cancel
                    
                    let okAndNgAndCancelAlertTitle = "show alert by OK & NG & Cancel"
                    
                    Button(action: {
                        
                        alertModifier.show(
                            title: okAndNgAndCancelAlertTitle,
                            message: message,
                            buttons: [
                                // OK Button
                                .init(title: okButtonTitle,
                                      role: nil,
                                      action: {
                                    
                                    nextTitle = okAndNgAndCancelAlertTitle
                                    nextSelectedMessage = okButtonTitle
                                    isNextPageAction.toggle()
                                }),
                                // NG Button
                                .init(title: ngButtonTitle,
                                      role: .destructive,
                                      action: {
                                    
                                    nextTitle = okAndNgAndCancelAlertTitle
                                    nextSelectedMessage = ngButtonTitle
                                    isNextPageAction.toggle()
                                }),
                                // Cancel Button
                                .init(title: cancelButtonTitle,
                                      role: .cancel,
                                      action: {
                                    
                                    nextTitle = okAndNgAndCancelAlertTitle
                                    nextSelectedMessage = cancelButtonTitle
                                    isNextPageAction.toggle()
                                })])
                    },
                    label: {
                        
                        Text(okAndNgAndCancelAlertTitle)
                    })
                }
            }
            // 下一頁 資料呈現
            .navigationDestination(isPresented: $isNextPageAction,
                                   destination: {
                
                ZStack {
                    
                    Text("you selected is '\(nextSelectedMessage)'")
                }
                .navigationTitle(nextTitle)
            })
            // 提示訊息
            .modifier(alertModifier)
        }
    }
    
    // MARK: -
}

#Preview {
    ContentView()
}
