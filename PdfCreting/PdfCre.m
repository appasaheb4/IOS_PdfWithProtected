//
//  PdfCre.m
//  PdfCreting
//
//  Created by developer on 01/12/19.
//  Copyright © 2019 developer. All rights reserved.
//

#import "PdfCre.h"
#import "PdfCreting-Swift.h"

@implementation PdfCre
-(void) createPDF{
    PdfGenreating *createPdf = [[PdfGenreating alloc]init];
    createPdf.pdfData= @[@"appasaheb"];
    NSString *pdth =  [createPdf  generatePdf];
    NSLog(pdth);
}
@end
