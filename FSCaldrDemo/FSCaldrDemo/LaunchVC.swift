//
//  LaunchVC.swift
//  FSCaldrDemo
//
//  Created by reubro on 23/05/19.
//  Copyright © 2019 Reubro. All rights reserved.
//

import UIKit
import YXWaveView

//var pulseLayers = [CAShapeLayer]()
class LaunchVC: UIViewController {
    
    fileprivate var waterView: YXWaveView?
    @IBOutlet var avView: UIImageView!
    @IBOutlet var imagevw: UIImageView!
    var pulseArray = [CAShapeLayer]()

    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.waveeffect()
        avView.layer.cornerRadius = avView.frame.size.width/2.0

        self.createPulse()
        self.waveeffect()
        perform(#selector(LaunchVC.showmainmenu), with: nil, afterDelay: 5)
    }
    /* class splash: UIViewController {
     
     override func viewDidLoad() {
     super . viewDidLoad()
     
     performSelector(#selector(splash.showmainmenu), withObject: nil, afterDelay: 2)
     }
     
     func showmainmenu(){
     
     performSegueWithIdentifier("mainmenu", sender: self)
     
     }
 */
    //MARK:- Userdefind function
    @objc func showmainmenu(){
        
        performSegue(withIdentifier: "mainvc", sender: self)
        
    }
    func waveeffect(){
//                let avFrame = CGRect(x: 0, y: 0, width: 60, height: 60)
//                let avView = UIImageView(frame: avFrame)
//                avView.layer.cornerRadius = avView.bounds.height/2
//                avView.layer.masksToBounds = true
//                avView.layer.borderColor  = UIColor.white.cgColor
//                avView.layer.borderWidth = 3
//                avView.layer.contents = UIImage(named: "yourtion")?.cgImage
        
        let frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: view.bounds.size.height)
       // waterView = YXWaveView(frame: frame, color: UIColor.white)
        waterView = YXWaveView()
       // waterView!.addOverView(imagevw)
      //  waterView!.backgroundColor = UIColor(red: 248/255, green: 64/255, blue: 87/255, alpha: 1)
        
        // Add WaveView
      //  self.view.addSubview(waterView!)
        self.imagevw.addSubview(waterView!)
        // Start wave
        waterView!.start()
        
    }
    func createPulse() {
                
                for _ in 0...100 {
                    let circularPath = UIBezierPath(arcCenter: .zero, radius: ((self.avView.superview?.frame.size.width )! ), startAngle: 0, endAngle: 2 * .pi , clockwise: true) //2
                    let pulsatingLayer = CAShapeLayer()
                    pulsatingLayer.path = circularPath.cgPath
                    pulsatingLayer.lineWidth = 4 //2.5
                    pulsatingLayer.fillColor = UIColor.clear.cgColor
                    pulsatingLayer.lineCap = CAShapeLayerLineCap.round
                    pulsatingLayer.position = CGPoint(x: avView.frame.size.width / 2.0, y: avView.frame.size.width / 2.0)
                    avView.layer.addSublayer(pulsatingLayer)
                    pulseArray.append(pulsatingLayer)
                }
               
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                    self.animatePulsatingLayerAt(index: 0)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
                        self.animatePulsatingLayerAt(index: 1)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                            self.animatePulsatingLayerAt(index: 2)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
                                self.animatePulsatingLayerAt(index: 3)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                    self.animatePulsatingLayerAt(index: 4)
                                    
                                })
                            })
                          })
                       })
                    })
   
    }
    func animatePulsatingLayerAt(index:Int) {
                
                //Giving color to the layer
                pulseArray[index].strokeColor = UIColor.darkGray.cgColor
                
                //Creating scale animation for the layer, from and to value should be in range of 0.0 to 1.0
                // 0.0 = minimum
                //1.0 = maximum
                let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
                scaleAnimation.fromValue = 0.0
                scaleAnimation.toValue = 0.9
                
                //Creating opacity animation for the layer, from and to value should be in range of 0.0 to 1.0
                // 0.0 = minimum
                //1.0 = maximum
                let opacityAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
                opacityAnimation.fromValue = 0.9
                opacityAnimation.toValue = 0.0
                
                // Grouping both animations and giving animation duration, animation repat count
                let groupAnimation = CAAnimationGroup()
                groupAnimation.animations = [scaleAnimation, opacityAnimation]
                groupAnimation.duration = 3
                groupAnimation.repeatCount = .greatestFiniteMagnitude
                groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
                //adding groupanimation to the layer
                pulseArray[index].add(groupAnimation, forKey: "groupanimation")
                
            }
}
