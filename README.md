# Objective-C ARC Memory Leak: Premature Nil Assignment

This repository demonstrates a subtle memory leak in Objective-C when using Automatic Reference Counting (ARC). The issue stems from prematurely setting an array property to `nil` before the objects within the array have been released. This can lead to unexpected behavior, crashes, or increased memory pressure.

## Bug Description
The bug is present in `bug.m`.  It creates an array, adds an object, and then immediately sets the array property to `nil`. This prevents ARC from releasing the objects still held within the array.

## Solution
The solution, located in `bugSolution.m`, demonstrates the correct way to handle this situation.