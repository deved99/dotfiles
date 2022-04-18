#!/usr/bin/env python3

class FilterModule(object):
    def filters(self):
        return {
            "generate_grays": self.generate_grays
        }
    def generate_grays(self, colorscheme: dict):
        """Main function, takes to colors, give greys between them.
    
        Args:
            black: the color from which to start.
            white: the color to which end.
    
        Returns:
            list of 8 colors, the first element is black, the last
            is white and between them the greys.
        """
        black = colorscheme[0]
        white = colorscheme[15]
        # convert to tuples
        black_dec = rgb_to_dec(black)
        white_dec = rgb_to_dec(white)
        # to coordinates
        black_xy = tuple([ (0,i) for i in black_dec ])
        white_xy = tuple([ (7,i) for i in white_dec ])
        coordinates = zip(black_xy, white_xy)
        # lines for each color
        r,g,b = [ get_line(a,b) for a,b in coordinates ]
        # greys in dec
        greys_dec = [ (r(i), g(i), b(i)) for i in range(8) ]
        # greys in rgb
        greys_rgb = [ dec_to_rgb(g) for g in greys_dec ]
        return greys_rgb
        

# HELPERS
def get_line(a, b):
    """Find line passing from a and b
    """
    x0,y0 = a
    x1,y1 = b
    m = (y1-y0)/(x1-x0)
    q = y0 - m*x0
    return lambda x: round(m*x+q)

def rgb_to_dec(color: str):
    """Converts rgb string to decimal tuple.
    
    Args:
        color: string in the form #RRGGBB.

    Returns:
        (r,g,b): each element in decimal base.
    """
    # cut string
    r = color[1:3]
    g = color[3:5]
    b = color[5:7]
    # convert
    foo = [ int(i, base=16) for i in [r,g,b] ]
    return tuple(foo)

def dec_to_rgb(color: tuple):
    """Converts decimal tuple to rgb string.
    
    Args:
        color: tuple in the form (r,g,b)

    Returns:
        #RRGGBB
    """
    (r,g,b) = color
    return f"#{r:02X}{g:02X}{b:02X}"

# def main():
#     greys = generate_grays("#1d1f21", "#ffffff")
#     for g in greys:
#         print(g)

# if __name__ == "__main__":
#     main()
