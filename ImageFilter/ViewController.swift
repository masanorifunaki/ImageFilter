//
//  ViewController.swift
//  ImageFilter
//
//  Created by 舟木正憲 on 2018/12/30.
//  Copyright © 2018 masanori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // filter をつかうため、コアイメージ型に変換
        let cilImage = CIImage(image: imageView.image!)
        // モノクロ
//        let filter = CIFilter(name: "CIPhotoEffectMono")!
        // ぼかし
        let filter = CIFilter(name: "CIBoxBlur")!

        filter.setDefaults()
        filter.setValue(cilImage, forKey: kCIInputImageKey)
        filter.setValue(30, forKey: kCIInputRadiusKey)

        let outputImage = filter.outputImage
        imageView.image = UIImage(ciImage: outputImage!)

    }


}

