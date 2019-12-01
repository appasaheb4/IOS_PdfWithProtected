//
//  PdfGenreating.swift
//  PdfCreting
//
//  Created by developer on 01/12/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation
import PDFGenerator
import QRCoder

@objc class PdfGenreating : NSObject {
@objc public var pdfData:NSArray = [];
   @objc public func generatePdf() -> String {
    
    print(pdfData)
            let txtTitle = UILabel();
    let qrCodeImage = UIImageView();
     let generator = QRCodeGenerator();
//page 1
            let v1 = UIView( frame: CGRect(x: 0.0,y: 0, width: 150.0, height: 200.0))
            txtTitle.text = "Sagar"
            txtTitle.lineBreakMode = .byWordWrapping
            txtTitle.numberOfLines = 0
            txtTitle.frame = CGRect(x:5,y:5,width:v1.bounds.size.width - 5, height:v1.bounds.size.height)
            txtTitle.font = UIFont(name:"HelveticaNeue-Bold", size: 4.0)
            txtTitle.textAlignment = .left
            txtTitle.sizeToFit()
            v1.addSubview(txtTitle)
      qrCodeImage.image = generator.createImage(value: "part1",size: CGSize(width: 100, height: 100))
            qrCodeImage.frame = CGRect(x: 50, y: ( txtTitle.frame.origin.y + txtTitle.frame.height) , width: 60, height: 60)
            v1.addSubview(qrCodeImage)
           
     let page1 = PDFPage.view(v1);
    let pages = [page1]
     let dst = NSTemporaryDirectory().appending("sample1.pdf")
            do {
                try PDFGenerator.generate(pages, to: dst, password: "123456")
                // or use PDFPassword model
                try PDFGenerator.generate(pages, to: dst, password: PDFPassword("123456"))
                // or use PDFPassword model and set user/owner password
                try PDFGenerator.generate(pages, to: dst, password: PDFPassword(user: "123456", owner: "abcdef"))
                //print("file generate",dst)

            } catch let error {
                print(error)
            }
            
            return  dst;
        }
    }
