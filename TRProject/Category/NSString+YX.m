//
//  NSString+YX.m
//  HappyBuy
//
//  Created by jiyingxin on 16/4/10.
//  Copyright © 2016年 tedu. All rights reserved.
//

#import "NSString+YX.h"

@implementation NSString (YX)

- (NSURL *)yx_URL{
    return [NSURL URLWithString:self];
}

- (NSURL *)yx_fileURL{
    return [NSURL fileURLWithPath:self];
}

- (UIImage *)yx_image{
    return [UIImage imageNamed:self];
}

- (UIImageView *)yx_imageView{
    return [[UIImageView alloc] initWithImage:self.yx_image];
}

- (UIImage *)yx_creatQRCode{
    //图片还是字符本质是Data 二进制
    //String -> Data -> Image
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
     //CoreImage: 核心图片
    CIFilter *filer = [CIFilter filterWithName:@"CIQRCodeGenerator"];
     //把需要转化的数据传入到过滤器
    [filer setValue:data forKey:@"inputMessage"];
    //拿去传出的信息
    CIImage *ciImg = filer.outputImage;
    return [UIImage imageWithCIImage:ciImg];

}

@end
