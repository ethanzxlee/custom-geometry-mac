//
//  GameViewController.swift
//  CustomGeometryMac
//
//  Created by Zhe Xian Lee on 24/10/17.
//  Copyright © 2017 Zhe Xian Lee. All rights reserved.
//

import SceneKit
import QuartzCore

class GameViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        let scene = SCNScene()
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        
        // create and add lights to the scene
        let lightNode0 = SCNNode()
        lightNode0.light = SCNLight()
        lightNode0.light!.type = .omni
        lightNode0.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode0)
        
        let lightNode1 = SCNNode()
        lightNode1.light = SCNLight()
        lightNode1.light!.type = .omni
        lightNode1.position = SCNVector3(5, -10, 0)
        scene.rootNode.addChildNode(lightNode1)
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = NSColor.black
        
        addCustomGeometry()
    }
    
    func addCustomGeometry() {
        let vertices: [SCNVector3] = [
            SCNVector3(0, 1, 0),
            SCNVector3(-0.5, 0, 0.5),
            SCNVector3(0.5, 0, 0.5),
            SCNVector3(0.5, 0, -0.5),
            SCNVector3(-0.5, 0, -0.5),
            SCNVector3(0, -1, 0),
        ]
    
        let source = SCNGeometrySource(vertices: vertices)
        
        let indices: [UInt16] = [
            0, 1, 2,
            2, 3, 0,
            3, 4, 0,
            4, 1, 0,
            1, 5, 2,
            2, 5, 3,
            3, 5, 4,
            4, 5, 1
        ]
        
        let element = SCNGeometryElement(indices: indices, primitiveType: .triangles)
        
        let geometry = SCNGeometry(sources: [source], elements: [element])
        
        let node = SCNNode(geometry: geometry)

        let scnView = self.view as! SCNView
        
        scnView.scene?.rootNode.addChildNode(node)
        
        let rotateAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: .pi, z: 0, duration: 5))
        node.runAction(rotateAction)
    }
    
   
}
