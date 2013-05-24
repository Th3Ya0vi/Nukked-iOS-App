
#import "CustomTheme.h"
#import "UIImageResizing.h"
#import "UIColorExtensions.h"


@implementation CustomTheme


- (UIColor *)mainColor
{
    return [UIColor colorWithWhite:0.20 alpha:1.0];
}

- (UIColor *)highlightColor
{
    return [UIColor colorWithWhite:0.9 alpha:1.0];
}

- (UIColor *)shadowColor
{
    return [UIColor colorWithWhite:1.0 alpha:0.5];
}

- (UIColor *)backgroundColor
{
    
    //return [[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0] darkerColor];
    return [UIColor colorWithRed:ConvertFromRGB(243) green:ConvertFromRGB(235) blue:ConvertFromRGB(216) alpha:1.0];
    //return [UIColor colorWithWhite:0.85 alpha:1.0];
}

- (UIColor *)baseTintColor
{
    return nil;
}

- (UIColor *)accentTintColor
{
    return nil;
}

- (UIColor *)switchThumbColor
{
    return [UIColor colorWithWhite:0.75 alpha:1.0];
}

- (UIColor *)switchOnColor
{
    return [UIColor colorWithWhite:0.25 alpha:1.0];
}

- (UIColor *)switchTintColor
{
    return [UIColor colorWithWhite:0.85 alpha:1.0];
}

- (CGSize)shadowOffset
{
    return CGSizeMake(0.0, 1.0);
}

- (UIImage *)topShadow
{
    NSString *name = @"topShadow";
    return [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
}

- (UIImage *)bottomShadow
{
    NSString *name = @"bottomShadow";
    return [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
}

- (UIImage *)navigationBackgroundForBarMetrics:(UIBarMetrics)metrics
{
    NSString *name = @"navigationBackground";
    if (metrics == UIBarMetricsLandscapePhone) {
        name = [name stringByAppendingString:@"Landscape"];
    }
    UIImage *image = [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 8.0, 0.0, 8.0)];
    return image;
}

- (UIImage *)barButtonBackgroundForState:(UIControlState)state style:(UIBarButtonItemStyle)style barMetrics:(UIBarMetrics)barMetrics
{
    NSString *name = @"barButton";
    if (style == UIBarButtonItemStyleDone) {
        name = [name stringByAppendingString:@"Done"];
    }
    if (barMetrics == UIBarMetricsLandscapePhone) {
        name = [name stringByAppendingString:@"Landscape"];
    }
    if (state == UIControlStateHighlighted) {
        name = [name stringByAppendingString:@"Highlighted"];
    }
    UIImage *image = [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 13.0, 0.0, 13.0)];
    return image;
}
-(UIColor *)buttonTextColor
{
    return [UIColor blackColor];
}
- (UIImage *)backBackgroundForState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics
{
    NSString *name = @"backButton";
    if (barMetrics == UIBarMetricsLandscapePhone) {
        name = [name stringByAppendingString:@"Landscape"];
    }
    if (state == UIControlStateHighlighted) {
        name = [name stringByAppendingString:@"Highlighted"];
    }
    UIImage *image = [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 21.0, 0.0, 13.0)];
    return image;
}

- (UIImage *)toolbarBackgroundForBarMetrics:(UIBarMetrics)metrics
{
    NSString *name = @"toolbarBackground";
    if (metrics == UIBarMetricsLandscapePhone) {
        name = [name stringByAppendingString:@"Landscape"];
    }
    UIImage *image = [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 8.0, 0.0, 8.0)];
    return image;
}

- (UIImage *)searchBackground
{
    NSString *name = @"searchBackground";
    return [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
}

- (UIImage *)searchFieldImage
{
    NSString *name = @"searchField";
    UIImage *image = [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 16.0, 0.0, 16.0)];
    return image;
}

- (UIImage *)searchScopeButtonBackgroundForState:(UIControlState)state
{
    NSString *name = @"searchScopeButton";
    if (state == UIControlStateSelected) {
        name = [name stringByAppendingString:@"Selected"];
    }
    UIImage *image = [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 13.0, 0.0, 13.0)];
    return image;
}

- (UIImage *)searchScopeButtonDivider
{
    NSString *name = @"searchScopeDivider";
    return [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
}

- (UIImage *)searchImageForIcon:(UISearchBarIcon)icon state:(UIControlState)state
{
    NSString *name;
    if (icon == UISearchBarIconSearch) {
        name = @"searchIconSearch";
    } else if (icon == UISearchBarIconClear) {
        name = @"searchIconClear";
        if (state == UIControlStateHighlighted) {
            name = [name stringByAppendingString:@"Highlighted"];
        }
    }
    return (name ? [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]] : nil);
}

- (UIImage *)segmentedBackgroundForState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics;
{
    NSString *name = @"segmentedBackground";
    if (barMetrics == UIBarMetricsLandscapePhone) {
        name = [name stringByAppendingString:@"Landscape"];
    }
    if (state == UIControlStateSelected) {
        name = [name stringByAppendingString:@"Selected"];
    }
    UIImage *image = [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 13.0, 0.0, 13.0)];
    return image;
}

- (UIImage *)segmentedDividerForBarMetrics:(UIBarMetrics)barMetrics
{
    NSString *name = @"segmentedDivider";
    if (barMetrics == UIBarMetricsLandscapePhone) {
        name = [name stringByAppendingString:@"Landscape"];
    }
    return [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
}

- (UIImage *)tableBackground
{
    NSString *name = @"tableBackground";
    UIImage *image = [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsZero];
    return image;
}

- (UIImage *)onSwitchImage
{
    NSString *name = @"onSwitch";
    return [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
}

- (UIImage *)offSwitchImage
{
    NSString *name = @"offSwitch";
    return [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
}

- (UIImage *)sliderThumbForState:(UIControlState)state
{
    NSString *name = @"sliderThumb";
    if (state == UIControlStateHighlighted) {
        name = [name stringByAppendingString:@"Highlighted"];
    }
    return [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
}

- (UIImage *)sliderMinTrack
{
    NSString *name = @"sliderMinTrack";
    UIImage *image = [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
    
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 7.0, 0.0, 7.0)];
    return image;
}

- (UIImage *)sliderMaxTrack
{
    NSString *name = @"sliderMaxTrack";
    UIImage *image = [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 7.0, 0.0, 7.0)];
    return image;
}

- (UIImage *)speedSliderMinImage
{
    NSString *name = @"slowShip";
    return [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
}

- (UIImage *)speedSliderMaxImage
{
    NSString *name = @"fastShip";
    return [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
}

- (UIImage *)progressTrackImage
{
    NSString *name = @"progressTrack";
    UIImage *image = [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 7.0, 0.0, 7.0)];
    return image;
}

- (UIImage *)progressProgressImage
{
    NSString *name = @"progressProgress";
    UIImage *image = [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 7.0, 0.0, 7.0)];
    return image;
}

- (UIImage *)stepperBackgroundForState:(UIControlState)state
{
    NSString *name = @"stepperBackground";
    if (state == UIControlStateHighlighted) {
        name = [name stringByAppendingString:@"Highlighted"];
    } else if (state == UIControlStateDisabled) {
        name = [name stringByAppendingString:@"Disabled"];
    }
    UIImage *image = [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 13.0, 0.0, 13.0)];
    return image;
}

- (UIImage *)stepperDividerForState:(UIControlState)state
{
    NSString *name = @"stepperDivider";
    if (state == UIControlStateHighlighted) {
        name = [name stringByAppendingString:@"Highlighted"];
    }
    return [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
}

- (UIImage *)stepperIncrementImage
{
    NSString *name = @"stepperIncrement";
    return [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
}

- (UIImage *)stepperDecrementImage
{
    NSString *name = @"stepperDecrement";
    return [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
}

- (UIImage *)buttonBackgroundForState:(UIControlState)state
{
    NSString *name = @"button";
    if (state == UIControlStateHighlighted) {
        name = [name stringByAppendingString:@"Highlighted"];
    } else if (state == UIControlStateDisabled) {
        name = [name stringByAppendingString:@"Disabled"];
    }
    UIImage *image = [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 16.0, 0.0, 16.0)];
    return image;
}

- (UIImage *)tabBarBackground
{
    NSString *name = @"tabBarBackground";
    return [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
}

- (UIImage *)tabBarSelectionIndicator
{
    NSString *name = @"tabBarSelectionIndicator";
    return [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
}

- (UIImage *)imageForTab:(SSThemeTab)tab
{
    return nil;
}

- (UIImage *)finishedImageForTab:(SSThemeTab)tab selected:(BOOL)selected
{
    NSString *name = nil;
    if (tab == SSThemeTabDoor) {
        name = @"doorTab";
    } else if (tab == SSThemeTabPower) {
        name = @"powerTab";
    } else if (tab == SSThemeTabControls) {
        name = @"controlsTab";
    }
    if (selected) {
        name = [name stringByAppendingString:@"Selected"];
    }
    return (name ? [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]] : nil);
}

- (UIImage *)doorImageForState:(UIControlState)state
{
    NSString *name;
    if (state & UIControlStateDisabled) {
        name = @"doorDisabled";
    } else {
        if (state & UIControlStateSelected) {
            name = @"doorOpen";
        } else {
            name = @"doorClosed";
        }
        if (state & UIControlStateHighlighted) {
            name = [name stringByAppendingString:@"Highlighted"];
        }
    }
    UIImage *image = [[UIImage imageNamed:name] OverlayWithColor:[UIColor colorWithRed:ConvertFromRGB(196) green:ConvertFromRGB(121) blue:ConvertFromRGB(23) alpha:1.0]];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(16.0, 0.0, 15.0, 0.0)];
    return image;
}



@end
