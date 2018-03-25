//
//  ViewController.swift
//  SlideshowApp2
//
//  Created by Yosuke Nakatsuka on 2018/03/19.
//  Copyright © 2018年 Yosuke Nakatsuka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer: Timer!
    var timer_sec: Float = 0
    
    @IBOutlet weak var imageView: UIImageView!
    // 表示している画像の番号
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
        imageView.image = image
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "one.jpg")
        imageView.image = image
    }

    @IBAction func onTapImage(_ sender: Any) {
        // セグエを使用して画面を遷移
        performSegue(withIdentifier:"zoomedImage", sender: nil)
        
        if timer == nil{
        }
        else{
            self.timer.invalidate()
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func updateSlide(timer: Timer) {
        dispImageNo += 1
        displayImage()
    }

    @IBAction func playstop(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateSlide), userInfo: nil, repeats: true)
        }else{
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
        }
    }
    
    @IBAction func back(_ sender: Any) {
        if self.timer == nil{
            dispImageNo -= 1
            displayImage()
        }
    }
    
    @IBAction func next(_ sender: Any) {
        if self.timer == nil{
            dispImageNo += 1
            displayImage()
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のzoomedImageを取得する
        let zoomedImage:zoomedImage = segue.destination as! zoomedImage
        // 遷移先のzoomedImageで宣言している変数に値を代入して渡す
        zoomedImage.dispImageNo = dispImageNo
    }
}

