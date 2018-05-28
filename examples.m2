-- This file contains a collection of examples for benchmarking the
-- GroebnerWalk package. Each example has timings in seconds for the two walk
-- strategies and Macaulay2's standard gb function. Timings were performed on a
-- 2.3GHz i7-3615QM using Macaulay2 1.11.
--
-- sources:
--   AGK = Amrhein, Gloor, Kuchlin, "On the Walk"
--   Tran = Tran, "A Fast Algorithm for Groebner Basis Conversion and its
--     Applications"
--   ABR = Abbott, Bigatti, Robbiano, "Implicitization of Hypersurfaces"


-- example 1, random cubics
-- walk: 3.13709
-- gen walk: 4.02557
-- gb: 0.00966173
restart
needsPackage "GroebnerWalk"

KK = ZZ/32003
R1 = KK[a,b,c,d, MonomialOrder=>Weights=>{1,2,3,4}]
I1 = ideal(random(3,R1), random(3,R1), random(3,R1))
R2 = KK[a,b,c,d, MonomialOrder=>Weights=>{1000,100,10,1}]

G1 = elapsedTime groebnerWalk(I1, R2)
G2 = elapsedTime groebnerWalk(I1, R2, Strategy => Generic)
G3 = elapsedTime gb sub(I1, R2)

-- example 2, AGK ex4
-- walk: 2.09195
-- gen walk: 4.13324
-- gb: 2.7665
restart
needsPackage "GroebnerWalk"

KK = QQ
R1 = KK[x,y,z,u,v, MonomialOrder=>Weights=>{1,1,1,0,0}]
I1 = ideal(u + u^2 - 2*v - 2*u^2*v + 2*u*v^2 - x,
           -6*u + 2*v + v^2 - 5*v^3 + 2*u*v^2 - 4*u^2*v^2 - y,
	   -2 + 2*u^2 + 6*v - 3*u^2*v^2 - z)
R2 = KK[x,y,z,u,v, MonomialOrder=>Weights=>{0,0,0,1,1}]

G1 = elapsedTime groebnerWalk(I1, R2)
G2 = elapsedTime groebnerWalk(I1, R2, Strategy => Generic)
G3 = elapsedTime gb sub(I1, R2)

-- example 3, AGK ex5
-- walk: 0.700214
-- gen walk: 2.62612
-- gb: 0.486051
restart
needsPackage "GroebnerWalk"

KK = ZZ/32003
R1 = KK[x,y,z,u,v, MonomialOrder=>Weights=>{1,1,1,0,0}]
I1 = ideal(3 - 2*u + 2*u^2 - 2*u^3 - v + u*v + 2*u^2*v^3 - x,
           6*u + 5*u^2 - u^3 + v + u*v + v^2 - y,
	   -2 + 3*u - u*v + 2*u*v^2 - z)
R2 = KK[x,y,z,u,v, MonomialOrder=>Weights=>{0,0,0,1,1}]

G1 = elapsedTime groebnerWalk(I1, R2)
G2 = elapsedTime groebnerWalk(I1, R2, Strategy => Generic)
G3 = elapsedTime gb sub(I1, R2)

-- example 4, AGK ex6
-- walk: 8.70323
-- gen walk: 32.839
-- gb: 30.3876
restart
needsPackage "GroebnerWalk"

KK = QQ
R1 = KK[x,y,z,u,v, MonomialOrder=>Weights=>{1,1,1,0,0}]
I1 = ideal(2*u^3*v - u*v^2 + 6*u*v^3 - x,
           3*u^2 + 3*u*v - u^2*v + 4*u^3*v + v^2 - y,
	   -u*v + 4*u^2*v - 3*u^3*v + v^2 - z)
R2 = KK[x,y,z,u,v, MonomialOrder=>Weights=>{0,0,0,1,1}]

G1 = elapsedTime groebnerWalk(I1, R2)
G2 = elapsedTime groebnerWalk(I1, R2, Strategy => Generic)
G3 = elapsedTime gb sub(I1, R2)

-- example 5, AGK ex8
-- walk: 8.58052
-- gen walk: 62.4791
-- gb: 24.1692
restart
needsPackage "GroebnerWalk"

KK = QQ
R1 = KK[x,y,z,u,v, MonomialOrder=>Weights=>{1,1,1,0,0}]
I1 = ideal(2 - 6*u + 6*u^2 + 6*v + u^2*v - 3*u^3*v - 2*v^2 - x,
           3 - 9*u + u^2 - 3*u^3 + 3*v^2 + 9*u*v^2 - y,
	   9*u^2 - 9*u^3 - u^2*v + 2*u^3*v + u^2*v^2 - z)
R2 = KK[x,y,z,u,v, MonomialOrder=>Weights=>{0,0,0,1,1}]

G1 = elapsedTime groebnerWalk(I1, R2)
G2 = elapsedTime groebnerWalk(I1, R2, Strategy => Generic)
G3 = elapsedTime gb sub(I1, R2)

-- example 6, Tran Example 3
-- walk: 8.22833
-- gen walk: 15.6687
-- gb: 213.924
restart
needsPackage "GroebnerWalk"

KK = QQ
R1 = KK[x,y,z, MonomialOrder=>Weights=>{1,1,1}]
I1 = ideal(5*x^4 + 13*y^2*z + 11*x^4*y*z^3 + 12*x^2*z^4 + 2*x^4*z^4 + 5*y*z^4 + 13*x^3*y*z^4,
           11*x*y + 15*y^3 + 4*x^2*y^4*z + 2*x*z^2 + 18*x^2*z^2 + 19*x^2*y*z^3,
	   3*x*y + 16*x*z^2 + 20*x^3*y*z^2 + 3*y*z^3 + 4*x*y^2*z^3 + 2*x^4*y^2*z^3)
R2 = KK[x,y,z, MonomialOrder=>Weights=>{1,0,0}]

G1 = elapsedTime groebnerWalk(I1, R2)
G2 = elapsedTime groebnerWalk(I1, R2, Strategy => Generic)
G3 = elapsedTime gb sub(I1, R2)

-- example 7, ABR 8.20
-- walk: 1493.08
-- gen walk: (memory overflow) 
-- gb: 9095.68
restart
needsPackage "GroebnerWalk"

KK = ZZ/32003
R1 = KK[s,t,u,w,f1,f2,f3,f4,f5, MonomialOrder=>Weights=>{0,0,0,0,1,1,1,1,1}]
I1 = ideal(s^2-t-u+w-f1, t^2-u-w-f2, s-t*u-f3, u^2-s*w-f4, s^2+t-u-w^2-f5)
R2 = KK[s,t,u,w,f1,f2,f3,f4,f5, MonomialOrder=>Weights=>{1,1,1,1,0,0,0,0,0}]

G1 = elapsedTime groebnerWalk(I1, R2)
G2 = elapsedTime groebnerWalk(I1, R2, Strategy => Generic)
G3 = elapsedTime gb sub(I1, R2)

-- example 8, ABR 8.22
-- walk: 213.421
-- gen walk: 43.5308
-- gb: 5095.79
restart
needsPackage "GroebnerWalk"

KK = ZZ/32003
R1 = KK[s,t,u,v,w,f1,f2,f3,f4,f5,f6, MonomialOrder=>Weights=>{0,0,0,0,0,1,1,1,1,1,1}]
I1 = ideal(s^3-u^2-t-3*s-u+w-f1, u^2-s*w-11-f2, s^2-5*u-v-f3,
           u^2-s-v-w-f4, u^2+7*s+t-f5, v^2+s^2-s-t-w-f6)
R2 = KK[s,t,u,v,w,f1,f2,f3,f4,f5,f6, MonomialOrder=>Weights=>{1,1,1,1,1,0,0,0,0,0,0}]

G1 = elapsedTime groebnerWalk(I1, R2)
G2 = elapsedTime groebnerWalk(I1, R2, Strategy => Generic)
G3 = elapsedTime gb sub(I1, R2)
