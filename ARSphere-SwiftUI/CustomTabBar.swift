//
//  CustomTabBar.swift
//  ARSphere-SwiftUI
//
//  Created by user on 2022/07/24.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case folder
}

struct CustomTabBar : View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue
    }
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage: tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.00)
                        .foregroundColor(selectedTab == tab ? Color("BasePink") : .gray)
                        .font(.system(size: 19))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                    
                }
            }
            .frame(width: nil, height: 50)
            .background(.thinMaterial)
            .cornerRadius(10)
        }
        .padding(.trailing, 3)
        .padding(.leading, 3)
    }
}

struct CustomTabBar_Previews : PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.house))
    }
}

