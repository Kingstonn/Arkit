//
//  SpaceShip.swift
//  ship
//
//  Created by Eric Kingstonn on 11/06/2018.
//  Copyright © 2018 Eric Kingstonn. All rights reserved.
//
import ARKit

class SpaceShip: SCNNode {
    func loadModal() {
        guard let virtualObjectScene = SCNScene(named: "art.scnassets/ship.scn") else {return}
        let wrapperNode = SCNNode()
        
        for child in virtualObjectScene.rootNode.childNodes {
            wrapperNode.addChildNode(child)
        }
        self.addChildNode(wrapperNode)
    }
    
   
}
