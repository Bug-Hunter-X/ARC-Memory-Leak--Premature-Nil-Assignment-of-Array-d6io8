In Objective-C, a common yet subtle error arises when dealing with memory management using ARC (Automatic Reference Counting).  Consider this scenario: 

```objectivec
@property (strong, nonatomic) NSMutableArray *myArray;

- (void)someMethod {
    [myArray addObject:@"Hello"];
    myArray = nil; // ERROR! 
}
```

This code appears harmless.  However, setting `myArray` to `nil` relinquishes ownership *before* ARC has a chance to release the objects within the array.  This leads to a memory leak because the objects in `myArray` are not released.