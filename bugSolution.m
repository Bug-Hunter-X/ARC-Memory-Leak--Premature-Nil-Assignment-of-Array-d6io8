The correct approach involves ensuring all objects in the array are properly released *before* setting the array property to `nil`.  Several solutions exist:

**1. Clearing the Array:**

```objectivec
- (void)someMethod {
    [myArray addObject:@"Hello"];
    [myArray removeAllObjects]; // Release objects in the array
    myArray = nil; // Safe to set to nil now
}
```

**2. Using `self.myArray = nil;`:** In some cases, using `self.myArray = nil;` might be safer as it uses accessor method to release the array and its contents correctly in accordance with ARC.

```objectivec
- (void)someMethod {
    [myArray addObject:@"Hello"];
    self.myArray = nil; // Using the setter
}
```

**3. Weak References (if appropriate):** If the array's lifecycle doesn't need to be directly managed by the owning object, consider a weak reference instead of a strong one. This prevents the owning object from keeping the array alive.

Choosing the best approach depends on the specific context of your code.  `removeAllObjects` is generally preferred when you're done with the array's contents.  Using `self.myArray = nil;` is often sufficient when the setter is properly configured for memory management.  Weak references should only be used when appropriate for the object's lifecycle management.