-- list of examples for testing the Groebner walk
-- sources:  AGK = Amrhein, Gloor, Kuchlin, "On the Walk"
--          Tran = Tran, "A Fast Algorithm for Groebner Basis Conversion and its Applications" 
--           ABR = Abbott, Bigatti, Robbiano, "Implicitization of Hypersurfaces"


-- example 1, random cubics
-- walk: 3.07081
-- gen walk: 3.89484
-- gb: 0.012803
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
-- walk: 1.95955
-- gen walk: 3.90081
-- gb: 2.85142
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
-- walk: 0.684128
-- gen walk: 2.49397
-- gb: 0.498124
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
-- walk: 8.02008
-- gen walk: 32.5516
-- gb: 30.9351
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
-- walk: 9.73
-- gen walk: 66.7532
-- gb: 24.4185
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
-- walk: 9.06356
-- gen walk: 16.812
-- gb: 214.464
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
-- walk: 1499.26
-- gen walk: overflow 
-- gb: 9163.53
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
-- walk: 211.17
-- gen walk: 42.3336
-- gb: 5373.89
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
