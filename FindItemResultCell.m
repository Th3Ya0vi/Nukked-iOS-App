//
//  FindItemResultCell.m
//  Nukkad
//
//  Created by Shiva Srivastava on 4/25/13.
//  Copyright (c) 2013 Fash. All rights reserved.
//

#import "FindItemResultCell.h"

@implementation FindItemResultCell

@synthesize lblPrice, lblStoreAddress, lblStoreName;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
