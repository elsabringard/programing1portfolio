import math
#import a
#import h
class Pyramid:
  #variables
  a = 0.0
  h = 0.0

  #constructor
  def __init__(self):
    self.a = 0.0
    self.h = 0.0

#Volume Calculation
  def calcVol(self):
    vol = float(self.a) * float(self.h) * (1/3)
    return vol

  #surface area calculation
  def calcSA(self):
    sa = (float(self.a)*float(self.a))+ (2 * float(self.a)) * math.sqrt ((float(self.a) * float(self.a) / 4) + float(self.h) * float(self.h))
    return sa