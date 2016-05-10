//
//  PageItemController.swift
//  SampleProject
//
//  Created by Alvin George on 5/10/16.
//  Copyright © 2016 Alvin George. All rights reserved.
//

import UIKit


class PageItemController: UIViewController {

    var itemIndex:Int?
    var imageName:String?

    @IBOutlet weak var targetImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("imageTapped:"))
        targetImageView.userInteractionEnabled = true
        targetImageView.addGestureRecognizer(tapGestureRecognizer)
        targetImageView.image =  UIImage(named: imageName!)
    }
    func imageTapped(img: AnyObject)
    {
        print(imageName)
        print(itemIndex)

        //Using a switch loop
        let targetImageIndex =  itemIndex! as Int

        switch (targetImageIndex) {
        case 0:
            print("case 0")
            break;
        case 1:
            print("case 1")
            break;
        case 2:
            print("case 2")
            break;

        default:
            break;
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
