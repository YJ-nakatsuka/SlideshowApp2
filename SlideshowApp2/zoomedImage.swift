//
//  zoomedImage.swift
//  SlideshowApp2
//
//  Created by Yosuke Nakatsuka on 2018/03/19.
//  Copyright © 2018年 Yosuke Nakatsuka. All rights reserved.
//

import UIKit

class zoomedImage: UIViewController {
    
    @IBOutlet weak var zoomedImageView: UIImageView!
    var dispImageNo = 0
    
    // 表示している画像の番号を基に画像を表示する
    func displayImage() {
        
        let imageNameArray = ["one.jpg", "two.jpg", "three.jpg", "four.jpg", "five.jpg"]
        if dispImageNo > 4 {dispImageNo = 0 }
        if dispImageNo < 0 {dispImageNo = 4 }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        zoomedImageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        displayImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
