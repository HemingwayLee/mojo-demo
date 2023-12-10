# mojo-demo
## Background
![image](https://github.com/HemingwayLee/mojo-demo/assets/8428372/2084899d-7c8e-44f7-af71-fe6aed0db2f0)

## lasagna architecture examples
* OSI network layers

![image](https://github.com/HemingwayLee/mojo-demo/assets/8428372/d07c681b-908f-449d-9748-d2f90eb93016)

* Programming language layers

![image](https://github.com/HemingwayLee/mojo-demo/assets/8428372/c6b8cf13-8d5e-47fb-8b72-52c215904ebd)

* The underlying implmentations matter
  * They generated the same results with different speed
 
```sql
select count(*) from Deposits
inner join households on households.id = deposits.HouseholdId
where CashierId = 'd89c8029-4808-4cea-b505-efd8279dc66d'
```


| The above SQL scripts can have different execution plan |
|---|
| ![image](https://github.com/HemingwayLee/mojo-demo/assets/8428372/2c4600fd-9b65-46d5-8f04-26044fddadd4) |
| ![image](https://github.com/HemingwayLee/mojo-demo/assets/8428372/57268c5b-1dce-4d47-b7b7-2e9f2415e9c4) |

## Which parts of python is slow for example?
* Python is easy to use
```python
a = "hello"
b = "world"
c = a + b
```

Equivalent C code

```c
#include <stdio.h>

int main() {
  // Define the two strings
  char a[] = "hello";
  char b[] = "world";

  // Calculate the combined string length
  int combinedLength = strlen(a) + strlen(b) + 1; // Add 1 for null terminator

  // Allocate memory for the combined string
  char c[combinedLength];

  // Manually copy each character
  for (int i = 0; i < strlen(a); i++) {
    c[i] = a[i];
  }

  // Append the second string after the first
  for (int i = strlen(a), j = 0; i < combinedLength; i++, j++) {
    c[i] = b[j];
  }

  // Add the null terminator
  c[combinedLength - 1] = '\0';

  return 0;
}
```

* python3 is dynamic type
```
a = 30
a = "aaa"
```

* [list](https://github.com/python/cpython/blob/5c22476c01622f11b7745ee693f8b296a9d6a761/Include/listobject.h#L22) is slow
  * NumPy arrays are significantly faster than Python lists for several reasons:
    1. Memory layout:
      * Numpy arrays: Stored contiguously in memory, meaning all elements of the same data type are stored together. This allows for faster access and manipulation as the CPU can read large chunks of data efficiently.
      * Python lists: Heterogeneous in memory, meaning elements can be of different data types and stored scattered across memory. This makes accessing and manipulating elements slower as the CPU needs to jump around memory to find the required data.
    3. Data type:
      * Numpy arrays: Homogeneous, meaning all elements are of the same data type (e.g., all integers or all floats). This allows for optimized operations and efficient use of memory.
      * Python lists: Heterogeneous, meaning different elements can have different data types. This requires more overhead for storing and manipulating data.
    4. Operations:
      * Numpy arrays: Optimized C code for vectorized operations, meaning operations are applied to entire arrays simultaneously. This is significantly faster than looping over individual elements in a list.
      * Python lists: Interpreted Python code for operations, meaning each operation is executed individually. This is slower and less efficient.
    5. Built-in functions:
      * Numpy arrays: Have a vast library of optimized functions for various mathematical, statistical, and linear algebra operations. These functions take advantage of the underlying C code and contiguously stored data for maximum performance.
      * Python lists: Lack dedicated functions for complex operations. These operations need to be implemented using loops, leading to slower execution.
    6. Parallelism:
      * Numpy arrays: Can leverage multi-core processors for parallel execution of operations. This further improves performance for large datasets.
      * Python lists: Primarily single-threaded, limiting the potential for performance improvement on modern hardware.

## Mojo vs Cython
* Both Cython and Mojo are language extensions for Python, designed to improve performance and efficiency.

* Parallelism
![image](https://github.com/HemingwayLee/mojo-demo/assets/8428372/778bfded-6f41-47c6-b2fb-c1b75950f11d)

