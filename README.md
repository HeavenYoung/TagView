# TagView
This View provides a support for layout tags with an array

it provides:
 - delegate for tap the tag
 - support AutoLayou
 
# How to use
    #import "TagLableView.h"
    TagLableView *labelView = [[TagLableView alloc] initWithFrame:CGRectMake(20, 10, 300, 300) title:@"title" titleFont:[UIFont systemFontOfSize:14] tagArray:array];
    labelView.delegate = self;
