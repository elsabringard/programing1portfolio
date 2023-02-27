print('welcome to Shape Tester, lets find the volumes, and surface area of shapes!')

#!/usr/bin/python3
from Box import Box
from Sphere import Sphere
from Pyramid import Pyramid
myShape = input ('Select a shape to find the calculations for: box = 1 sphere = 2 pyramid = 3 -')

#box
myShape = str(myShape)
if myShape == '1':
  b1 = Box()
  b1.l = input('enter vaule for box length')
  print(b1.l)
  b1.w = input('enter vaule for box width')
  print(b1.w)
  b1.h = input('enter vaule for box height')
  print(b1.h)
  print('Box Volume:',b1.calcVol())
  print('Box Surface Area:',b1.calcSA())

  print(' ')

#Sphere
elif myShape == '2':
  s1 = Sphere()
  s1.r = input('enter vaule for sphere radius')
  print(s1.r)
  print('Sphere volume:',s1.calcVol())
  print('Sphere Surface Area:', s1.calcSA())
  
  print(' ')

#pyramid
elif myShape == '3':
  p1 = Pyramid()
  p1.a = input('Enter value for Pyramid Base edge:')
  p1.h = input('Enter value for Pyramid height:')
  print('Pyramid Volume:', p1.calcVol())
  print('Pyramid Surface Area:',p1.calcSA())

else:
   print('Invalid Number, Restart Program.')