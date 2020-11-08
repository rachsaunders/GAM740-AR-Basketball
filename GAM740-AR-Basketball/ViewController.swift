//
//  ViewController.swift
//  GAM740-AR-Basketball
//
//  Created by Rachel Saunders on 08/11/2020.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        let scene = SCNScene()
        
        let ball = SCNSphere(radius: 0.5)
        let ballMaterial = SCNMaterial()
        
        ballMaterial.diffuse.contents = UIColor.purple
        ball.materials = [ballMaterial]
        
        let ballNode = SCNNode(geometry: ball)
        ballNode.position = SCNVector3(x: -1, y: 0, z:1)
        
        let box = SCNBox(width: 0.3, height: 0.3, length: 0.3, chamferRadius: 0)
        let boxMaterial = SCNMaterial()
        
        boxMaterial.diffuse.contents = UIColor.blue
        box.materials = [boxMaterial]
        
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3(x: -0.25, y: 0, z: 0.25)
        
        let text = SCNText(string:"GAM740", extrusionDepth: 1)
        let textMaterial = SCNMaterial()
        
        textMaterial.diffuse.contents = UIColor.red
        
        text.materials = [textMaterial]
        
        let textNode = SCNNode(geometry: text)
        textNode.position = SCNVector3(x: 1, y: 0, z: -0.5)
        
        
        // // // //
        
        scene.rootNode.addChildNode(ballNode)
        scene.rootNode.addChildNode(boxNode)
        scene.rootNode.addChildNode(textNode)
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
