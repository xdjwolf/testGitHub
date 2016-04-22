//
//  ViewController.swift
//  TapGestureRecognizer
//
//  Created by Apple on 16/4/21.
//  Copyright © 2016年 xidian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var boolTrashEmptyFlag = false //垃圾桶空标志  false 满 ， true  空
    var  imageTrashFull:UIImage!
    var imageTrashEmpty:UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bundle = NSBundle.mainBundle()
        let imageTrashFullPath = bundle.pathForResource("Blend Trash Full", ofType: "png")
        let imageTrashEmptyPath = bundle.pathForResource("Blend Trash Empty", ofType: "png")
        
        self.imageTrashFull = UIImage(contentsOfFile: imageTrashFullPath!)
        
        self.imageTrashEmpty = UIImage(contentsOfFile: imageTrashEmptyPath!)
        
//        
//        self.imageTrashFull = UIImage(named: "Blend Trash Full")
//        self.imageTrashEmpty = UIImage(named: "Blend Trash Empty")
        
        self.imageView.image = self.imageTrashFull
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "foundTap:")
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        self.imageView.addGestureRecognizer(tapRecognizer)
    }
    
    func foundTap(paramSender : UITapGestureRecognizer)
    {
        NSLog("tap")
        if  boolTrashEmptyFlag{
            self.imageView.image = self.imageTrashFull
            boolTrashEmptyFlag = false
            
        }else
        {
            self.imageView.image = self.imageTrashEmpty
            boolTrashEmptyFlag = true
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

