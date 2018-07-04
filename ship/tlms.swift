//
//  tlms.swift
//  ship
//
//  Created by Eric Kingstonn on 24/06/2018.
//  Copyright © 2018 Eric Kingstonn. All rights reserved.
//

import Foundation
import UIKit
import ARKit

class tlms: UIViewController {
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = SCNScene()
        sceneView.scene = scene
    }
    
    var name:String = " " {
        didSet{
            Name.text = "\(name)"
        }
    }
    
    func zak(){
        let zak = SCNNode()
        zak.geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0.002)
        zak.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "art.scnassets/Zakaria.jpeg")
        let xPos = randomPostion(lowerBound: -3, upperBound: -2)
        let yPos = randomPostion(lowerBound: -3, upperBound: -2)
        zak.position = SCNVector3(xPos, yPos, -2)
        zak.name = "zak"
        sceneView.scene.rootNode.addChildNode(zak)
    }
    
    func ek(){
        let ek = SCNNode()
        ek.geometry = SCNBox(width: 1.5, height: 1.5, length: 1, chamferRadius: 0.002)
        ek.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "art.scnassets/ek.JPG")
        let xPos = randomPostion(lowerBound: 2, upperBound: 3)
        let yPos = randomPostion(lowerBound: 2, upperBound: 3)
        ek.position = SCNVector3(xPos, yPos, -1)
        ek.name = "ek"
        sceneView.scene.rootNode.addChildNode(ek)
    }
    
    func mus(){
        let mus = SCNNode()
        mus.geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0.002)
        mus.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "art.scnassets/Mustapha.jpeg")
        let xPos = randomPostion(lowerBound: -2, upperBound: 2)
        let yPos = randomPostion(lowerBound: -2, upperBound: 2)
        mus.position = SCNVector3(xPos, yPos, -2)
        mus.name = "mus"
        sceneView.scene.rootNode.addChildNode(mus)
    }
    
    func randomPostion (lowerBound lower: Float, upperBound upper: Float) -> Float{
        return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        /*ARWorldTrackingConfiguration()*/
        sceneView.session.run(configuration)
        mus()
        ek()
        zak()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: sceneView)
            let hitList = sceneView.hitTest(location, options: nil)
            
            if let hitObject = hitList.first {
                let node = hitObject.node
                
                if ( node.name == "mus" )  {
                    name = "Zakaria Toumi : Designer"
                }
                if (node.name == "zak" ){
                    name = "Mustafa Boury : Connection Bracelet MYO"
                }
                if (node.name == "ek" ){
                    name = "Eric Yoba : Developpeur en Swift, objective-c et integration sdk"
                }
            }
        }
    }
    
}
