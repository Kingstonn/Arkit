//
//  us.swift
//  ship
//
//  Created by Eric Kingstonn on 19/06/2018.
//  Copyright © 2018 Eric Kingstonn. All rights reserved.
//

import UIKit
import ARKit

class us: SCNNode{
    func world(){
        let boxNode = SCNNode()
        boxNode.geometry = SCNSphere(radius: 0.4)
        boxNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "art.scnassets/earth3.jpg")
        let xPos = randomPostion(lowerBound: -5.5, upperBound: 5.5)
        let yPos = randomPostion(lowerBound: -5.5, upperBound: 5.5)
        boxNode.position = SCNVector3(xPos, yPos, -2)
        sceneView.scene.rootNode.addChildNode(boxNode)
    }
}
