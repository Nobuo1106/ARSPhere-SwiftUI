//
//  ContentView.swift
//  ARSphere-SwiftUI
//
//  Created by user on 2022/07/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @State var isPresenting = false
    @State private var selectedTab: Tab = .house
    @State private var oldSelectedTab: Tab = .house
    init () {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        HStack {
                            switch tab {
                            case .house:
                                ARView()
                                    .tag(1)
                            case .folder:
                                ARView()
                            }
                        }
                        .tag(tab)
                        
                    }
                } .onChange(of: selectedTab) {
                    if selectedTab == .folder {
                        self.isPresenting = true
                    } else {
                        self.oldSelectedTab = $0
                    }
                }
                .sheet(isPresented: $isPresenting, onDismiss: {
                          self.selectedTab = self.oldSelectedTab
                      }) {
                     ImagePickerView()
                }
            }
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
        //        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

//struct ARViewContainer: UIViewRepresentable {
//
//    func makeUIView(context: Context) -> ARView {
//
//        let arView = ARView(frame: .zero)
//
//        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
//
//        // Add the box anchor to the scene
//        arView.scene.anchors.append(boxAnchor)
//
//        return arView
//
//    }
//
//    func updateUIView(_ uiView: ARView, context: Context) {}
//
//}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
