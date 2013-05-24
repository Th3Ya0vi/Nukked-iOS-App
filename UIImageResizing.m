
#import "UIImageResizing.h"

@implementation UIImage (Resize)

- (UIImage*)scaleToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0.0, size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, size.width, size.height), self.CGImage);
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;
}
-(UIImage *)OverlayWithColor:(UIColor *)overlayColor
{

 UIGraphicsBeginImageContext(self.size);

// get a reference to that context we created
CGContextRef context = UIGraphicsGetCurrentContext();

// set the fill color
[overlayColor setFill];

// translate/flip the graphics context (for transforming from CG* coords to UI* coords
CGContextTranslateCTM(context, 0, self.size.height);
CGContextScaleCTM(context, 1.0, -1.0);

// set the blend mode to color burn, and the original image
CGContextSetBlendMode(context, kCGBlendModeColor);
CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
CGContextDrawImage(context, rect, self.CGImage);

// set a mask that matches the shape of the image, then draw (color burn) a colored rectangle
CGContextClipToMask(context, rect, self.CGImage);
CGContextAddRect(context, rect);
CGContextDrawPath(context,kCGPathFill);

// generate a new UIImage from the graphics context we drew onto
UIImage *coloredself = UIGraphicsGetImageFromCurrentImageContext();
UIGraphicsEndImageContext();

//return the color-burned image
return coloredself;
}

@end