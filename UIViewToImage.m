
#import "UIViewToImage.h"

@implementation UIView (ToImage)

-(UIImage *)ToImage
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage* imgConverted = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imgConverted;
}

@end