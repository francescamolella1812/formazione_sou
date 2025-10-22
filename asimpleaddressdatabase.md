This script demonstrates the use of associative arrays in bash 4 and later. 
Unlike normal indexed arrays (where elements are referenced by numbers), associative arrays allow you to use string keys much like dictionaries or hash tables in other programming languages. 

The script defines an associative array named 'address' that stores names as keys and postal addresses as values. 
It then retrives and prints specific elements from that array. 

declare -A address declares an associative array named address. The -A option is required. 
value[key] assigns a value (address) to the key "Charles"

${address[Key]} general syntax for referencing elements in an associative array.
${!address[*]} expands to all keys (indices) in the array. 
