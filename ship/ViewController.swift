//
//  ViewController.swift
//  ship
//
//  Created by Eric Kingstonn on 11/06/2018.
//  Copyright © 2018 Eric Kingstonn. All rights reserved.
//

import UIKit
import ARKit
import AVKit


class ViewController: UIViewController {
  
    @IBOutlet weak var Counter: UILabel!
    @IBOutlet weak var sceneView: ARSCNView!
    
    
    var count:Int = 0 {
        didSet{
            Counter.text = "\(count)"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = SCNScene()
        sceneView.scene = scene
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
            /*ARWorldTrackingConfiguration()*/
        
        sceneView.session.run(configuration)
        /*addObject()*/
        world()
    }
    
    func world(){
        let boxNode = SCNNode()
        boxNode.geometry = SCNSphere(radius: 0.4)
        boxNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "art.scnassets/earth3.jpg")
        let xPos = randomPostion(lowerBound: -5.5, upperBound: 5.5)
        let yPos = randomPostion(lowerBound: -5.5, upperBound: 5.5)
        boxNode.position = SCNVector3(xPos, yPos, -2)
        boxNode.name = "box"
        sceneView.scene.rootNode.addChildNode(boxNode)
    }
    
    /*((boxNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "art.scnassets/earth3.jpg")) != nil )*/
    
    func addObject(){
        let ship = SpaceShip()
        ship.loadModal()
        let xPos = randomPostion(lowerBound: -5.5, upperBound: 5.5)
        let yPos = randomPostion(lowerBound: -5.5, upperBound: 5.5)
        ship.position = SCNVector3(xPos, yPos, -1)
        sceneView.scene.rootNode.addChildNode(ship)
    }
    
    func randomPostion (lowerBound lower: Float, upperBound upper: Float) -> Float{
        return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: sceneView)
            let hitList = sceneView.hitTest(location, options: nil)
            
            if let hitObject = hitList.first {
                let node = hitObject.node
                
                if ( node.name == "box" )  {
                    count += 1
                     node.removeFromParentNode()
                    addObject()
                    }
                if (node.name == "ARShip" ){
                    count += 1
                    node.removeFromParentNode()
                    world()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

