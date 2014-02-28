require "isnet93/version"

module Isnet93
  EARTH_RADIUS = 6378137.0
  FLATTENING   = 1/298.257222101
                                 # According to http://cocodati.lmi.is/cocodati/cocodati-manual.pdf
  LAMBERT_LOWER_PARALLEL = 64.25 # should be 64.15 ¿?
  LAMBERT_UPPER_PARALLEL = 65.75 # should be 65.45 ¿?
  CENTRAL_MERIDIAN_LAT   = 65.00
  CENTRAL_MERIDIAN_LNG   = 19.00

  FALSE_NORTHING         = 500000.0
  FALSE_EASTING          = 500000.0
  EPS                    = 0.00000000001

  FIRST_ECCENTRICITY = Math.sqrt(FLATTENING * (2 - FLATTENING))
  RHO = 45/Math.atan2(1.0, 1.0)

  def self.to_wgs84(east_coordinate, north_coordinate)
    dum = isometric(Math.sin(LAMBERT_LOWER_PARALLEL/RHO)) - isometric(Math.sin(LAMBERT_UPPER_PARALLEL/RHO))
    sint = 2 * (Math.log(fx(LAMBERT_LOWER_PARALLEL)) - Math.log(fx(LAMBERT_UPPER_PARALLEL))) / dum
    f2sin1 = isometric(Math.sin(LAMBERT_LOWER_PARALLEL / RHO))
    pol1 = fx(LAMBERT_LOWER_PARALLEL) / sint
    polc = f3(CENTRAL_MERIDIAN_LAT, pol1, f2sin1, sint) + FALSE_NORTHING
    peq = EARTH_RADIUS * Math.cos(CENTRAL_MERIDIAN_LAT/RHO) / (sint * Math.exp(sint*Math.log((45-CENTRAL_MERIDIAN_LAT/2)/RHO)))
    pol = Math.sqrt(((east_coordinate - FALSE_NORTHING)**2) + ((polc - north_coordinate)**2))
    lat = 90 - 2*RHO*Math.atan(Math.exp(Math.log(pol/peq)/sint))
    fact = RHO * Math.cos(lat/RHO) / sint / pol
    delta = 1.0
    while delta.abs > EPS
      delta = (f3(lat, pol1, f2sin1, sint) - pol) * fact
      lat += delta
    end
    lon = -(CENTRAL_MERIDIAN_LNG + RHO*Math.atan((FALSE_EASTING - east_coordinate)/(polc - north_coordinate))/sint)

    # http://gis.stackexchange.com/questions/8650/how-to-measure-the-accuracy-of-latitude-and-longitude
    # The eighth decimal place is worth up to 1.1 mm: this is good for charting motions of tectonic
    # plates and movements of volcanoes. Permanent, corrected, constantly-running GPS base stations
    # might be able to achieve this level of accuracy.
    # Max. estimated accuracy of any surveying device.
    [lat.round(8), lon.round(8)]
  end

  protected
  def self.fx(point)
    EARTH_RADIUS * Math.cos(point/RHO) / Math.sqrt(1-((FIRST_ECCENTRICITY * Math.sin(point/RHO))**2))
  end
  def self.f1(point)
    Math.log((1 - point) / (1 + point))
  end
  def self.isometric(point)
    return f1(point) - FIRST_ECCENTRICITY*f1(FIRST_ECCENTRICITY*point)
  end
  def self.f3(point, pol1, f2sin1, sint)
    iso = isometric(Math.sin(point/RHO))
    pol1 * Math.exp((iso - f2sin1)*sint/2)
  end
end