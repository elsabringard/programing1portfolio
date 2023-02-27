import math
class Sphere:
  #variables
  r = 0.0

#constructor
  def __init__(self):
      self.r = 0.0
    
#Volume Calculation
  def calcVol(self):
    #vol = (4/3)*math.pi*float(self.r**'3')
    vol = (4/3) * math.pi * (float(self.r)*float(self.r))
    return vol
    
#Surface area calculation
  def calcSA(self):
    #sa = 4 * math.pi *float(self.r**'2')
    sa = 4 * math.pi * (float(self.r)*float(self.r))
    return sa