# C class system

class.h allow to create classes in C.

main.c contains 4 classes example and main.E contains code after preprocessing main.c.

Keywords:
 - constructor  (may have parameters)
 - destructor   (have empty list parameters)
 - extends      (one parameter - base class)
 - abstract     
 - public
 - private      (invisible in childs)

All keywords are optional.

Creation starts with defining:  #define CLASS_BEGIN__someName keyword,keyword,keyword

Then type must be genereted with calling: CLASS_END(someName);

Class can be compilled by calling:  CLASS_COMPILE(someName)(keyword, ... )
Its unnesessary if you want only fields inheritance.
CLASS_COMPILE know only constructor & destructor keywords.

constructor & destructor are consist of two parts: visible to user (by CLASS_BEGIN__someName) and hide (by CLASS_COMPILE).






