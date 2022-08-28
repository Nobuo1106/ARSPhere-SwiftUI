//
//  ARView.swift
//  ARSphere-SwiftUI
//
//  Created by user on 2022/07/24.
//

import Foundation
import SwiftUI
import ARKit
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    
    typealias UIViewType = ARView
    
    func makeUIView(context: Context) -> ARView {
        print("makeUIView")
        ARViewController.shared.startARSession()
        return ARViewController.shared.arview
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("updateUIView")
    }
}

final class ARViewController: ObservableObject {
    static var shared = ARViewController()
    private var weatherModelAnchor: AnchorEntity?
    
    @Published var arview: ARView
    init() {
        arview = ARView(frame: .zero)
    }
    
    public func startARSession() {
        startPlaneDetection()
        startTapDetection()
    }
    
    private func startTapDetection() {
        arview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(rezognizer:))))
    }
    
    private func startPlaneDetection() {
        arview.automaticallyConfigureSession = true
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        configuration.environmentTexturing = .automatic
        arview.session.run(configuration)
    }
    
    @objc
    private func handleTap(rezognizer: UITapGestureRecognizer) {
//        let name = "love_heart.usdz"
        let tapLocation = rezognizer.location(in: arview)
        let results = arview.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .horizontal)
        if let firstResult = results.first {
            let worldPosition = simd_make_float3(firstResult.worldTransform.columns.3)
            
//            let mesh = MeshResource.generateSphere(radius: 0.03)
//            let material = SimpleMaterial(color: .pink, isMetallic: true)
            
            let path = "love"
            let model = try? ModelEntity.loadModel(named: path)
            model?.scale = [0.05, 0.05, 0.05]
            for index in 0 ..< (model?.model!.mesh.expectedMaterialCount)! { // USDZのマテリアルの数だけ貼り付ける
                let material = SimpleMaterial(color:.systemPink , roughness: 0, isMetallic: false)
                model?.model!.materials[index] = material
            }
            placeObject(object: model!, at: worldPosition)
        }
    }

    private func placeObject(object modelEntity: ModelEntity, at position: SIMD3<Float>) {
        weatherModelAnchor = AnchorEntity(world: position)
        weatherModelAnchor!.addChild(modelEntity)
        arview.scene.addAnchor(weatherModelAnchor!)
    }
}

struct ARViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        ARViewContainer()
    }
}
