#ifndef CLASS_H
#define CLASS_H

#include "macro.h"

#define _CLASS_DECL CLASS_BEGIN__

#define CLASS struct

#define CLASS_END(_name_,...) \
    CLASS _name_{void(*const destructor)(void*); _CLASS_LOOP(_CLASS_END(_name_))};\
    struct M_JOIN(_,_name_){void(*constructor)(void*); _CLASS_LOOP(_CLASS_END(_name_))};\
    extern const struct M_JOIN(_,_name_) *_name_()

#define CLASS_COMPILE(_name_) \
    void M_JOIN(_add_,_name_)(CLASS _name_*,char);\
    void M_JOIN(_dtor_,_name_)(CLASS _name_ *self){\
        M_FOREACH(_CLASS_DTR,M_JOIN(_CLASS_DECL,_name_))\
        M_JOIN(_add_,_name_)(self,0);\
        M_WHEN(_CLASS_BASE(_name_))( M_JOIN(_dtor_,_CLASS_BASE(_name_))((void*)self); )\
    }\
    CLASS _name_ *M_JOIN(_ctor_,_name_)(CLASS _name_ *self){\
        if(self){\
            M_WHEN(_CLASS_BASE(_name_))( M_JOIN(_ctor_,_CLASS_BASE(_name_))((void*)self); )\
            M_FOREACH(_CLASS_CTR,M_JOIN(_CLASS_DECL,_name_))\
            M_JOIN(_add_,_name_)(self,1);\
            *(void**)self=M_JOIN(_dtor_,_name_);\
        } return self;\
    }\
    const struct M_JOIN(_,_name_) *_name_(){\
        static struct M_JOIN(_,_name_) c[1]={{.constructor=(void*)0}};\
        if(!c->constructor){\
            M_WHEN(_CLASS_BASE(_name_))( _CLASS_BASE(_name_)(); )\
            _ctor_##_name_((void*)c); _dtor_##_name_((void*)c);\
            c->constructor=(void*)_ctor_##_name_;\
        } return c;\
    }\
    void M_JOIN(_add_,_name_)(CLASS _name_ *self, char ctor) _CLASS_COMPILE

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define _CLASS_INH_inherit(...) __VA_ARGS__
#define _CLASS_INH_public(...)
#define _CLASS_INH_private(...)
#define _CLASS_INH_constructor(...)
#define _CLASS_INH_destructor(...)

#define _CLASS_PBL_inherit(...)
#define _CLASS_PBL_public(...) __VA_ARGS__
#define _CLASS_PBL_private(...)
#define _CLASS_PBL_constructor(...)
#define _CLASS_PBL_destructor(...)

#define _CLASS_PRV_inherit(...)
#define _CLASS_PRV_public(...)
#define _CLASS_PRV_private(...) __VA_ARGS__
#define _CLASS_PRV_constructor(...)
#define _CLASS_PRV_destructor(...)

#define _CLASS_CTR_inherit(...)
#define _CLASS_CTR_public(...)
#define _CLASS_CTR_private(...)
#define _CLASS_CTR_constructor(...) __VA_ARGS__
#define _CLASS_CTR_destructor(...)

#define _CLASS_DTR_inherit(...)
#define _CLASS_DTR_public(...)
#define _CLASS_DTR_private(...)
#define _CLASS_DTR_constructor(...)
#define _CLASS_DTR_destructor(...) __VA_ARGS__

#define _CLASS_INH(...) M_WHEN(M_IS_ARG(__VA_ARGS__))( _CLASS_INH_##__VA_ARGS__ )
#define _CLASS_PBL(...) M_WHEN(M_IS_ARG(__VA_ARGS__))( _CLASS_PBL_##__VA_ARGS__ )
#define _CLASS_PRV(...) M_WHEN(M_IS_ARG(__VA_ARGS__))( _CLASS_PRV_##__VA_ARGS__ )
#define _CLASS_CTR(...) M_WHEN(M_IS_ARG(__VA_ARGS__))( _CLASS_CTR_##__VA_ARGS__ )
#define _CLASS_DTR(...) M_WHEN(M_IS_ARG(__VA_ARGS__))( _CLASS_DTR_##__VA_ARGS__ )

#define _CLASS_LOOP(...)  _CLASS_LOOP0(_CLASS_LOOP0(_CLASS_LOOP0(__VA_ARGS__)))
#define _CLASS_LOOP0(...) _CLASS_LOOP1(_CLASS_LOOP1(_CLASS_LOOP1(__VA_ARGS__)))
#define _CLASS_LOOP1(...) _CLASS_LOOP2(_CLASS_LOOP2(_CLASS_LOOP2(__VA_ARGS__)))
#define _CLASS_LOOP2(...) _CLASS_LOOP3(_CLASS_LOOP3(_CLASS_LOOP3(__VA_ARGS__)))
#define _CLASS_LOOP3(...) __VA_ARGS__

#define _CLASS_BASE(_name_) M_FOREACH(_CLASS_INH,M_JOIN(_CLASS_DECL,_name_))

#define _CLASS_COMPILE(...) {if(ctor){M_FOREACH(_CLASS_CTR,__VA_ARGS__) return;}{M_FOREACH(_CLASS_DTR,__VA_ARGS__)}}

#define __CLASS_END() _CLASS_END
#define _CLASS_END(_name_,...)\
    M_WHEN(_CLASS_BASE(_name_))( M_OBSTRUCT(__CLASS_END)()(_CLASS_BASE(_name_),_CLASS_BASE(_name_)) ) \
    M_FOREACH(_CLASS_PBL,M_JOIN(_CLASS_DECL,_name_))\
    M_IF(M_IS_ARG(__VA_ARGS__))(\
        M_WHEN(M_FOREACH(_CLASS_PRV,M_JOIN(_CLASS_DECL,_name_)))( struct{M_FOREACH(_CLASS_PRV,M_JOIN(_CLASS_DECL,_name_))}_pad##__VA_ARGS__[1][1][1]; ) , \
        M_FOREACH(_CLASS_PRV,M_JOIN(_CLASS_DECL,_name_))\
    )

#endif // CLASS_H
