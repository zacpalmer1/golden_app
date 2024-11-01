//
//  Blur.swift
//  golden
//
//  Created by Zachary Palmer on 10/25/24.
//
import Foundation
import SwiftUI

struct Blur: UIViewRepresentable  {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

