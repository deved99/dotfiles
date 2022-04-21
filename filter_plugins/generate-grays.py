#!/usr/bin/env python3

class FilterModule(object):
    def filters(self):
        return {
            "generate_grays": self.generate_grays
        }
    def generate_grays(self, colorscheme: list):
        """Main function, takes to colors, give greys between them.
    
        Args:
            black: the color from which to start.
            white: the color to which end.
    
        Returns:
            list of 8 colors, the first element is black, the last
            is white and between them the greys.
        """
        get_and_convert = lambda i: rgb_to_dec( colorscheme[i] )
        black = get_and_convert(0)
        dgrey = get_and_convert(8)
        lgrey = get_and_convert(7)
        white = get_and_convert(15)
        # get function
        f = get_function(black,dgrey,lgrey,white)
        # greys in dec
        greys_dec = [ f(i) for i in range(8) ]
        # greys in rgb
        greys_rgb = [ dec_to_rgb(g) for g in greys_dec ]
        return greys_rgb

# Linear System
def get_function(black, dgrey, lgrey, white):
    # Vars
    N = 5 # Deg + 1 of the polynomial
    K = 0.5 # Derivative at 1
    # This generates the values of the coefficients.
    equation_from = lambda x,y: [ x**i for i in range(N) ] + [ y ]
    colors_to_xs = [
        (white, 7),
        (lgrey, 5),
        (dgrey, 3),
        (black, 0)
    ]
    matrixes = {
        "red": [],
        "green": [],
        "blue": []
    }
    for color,x in colors_to_xs:
        matrixes["red"].append( equation_from(x, color[0]) )
        matrixes["green"].append( equation_from(x, color[1]) )
        matrixes["blue"].append( equation_from(x, color[2]) )
    for part in ["red", "green", "blue"]:
        eq = [ i for i in range(N) ] + [ K ]
        matrixes[part].append(eq)
    solutions = {
        p: solve_system(matrixes[p])
        for p in ["red","green","blue"]
    }
    def fs(part):
        coeffs = solutions[part]
        def f(x):
            ret = 0
            for i,coeff in enumerate(coeffs):
                ret += coeff * ( x**i )
            return round(ret)
        return f
    return lambda x: ( fs("red")(x), fs("green")(x), fs("blue")(x) )

def solve_system(matrix):
    i = 0
    NUM_ROW = len(matrix)
    # Make the system triangular
    while i < NUM_ROW:
        # Pivot to 1, then store to temporary variable
        pivot = matrix[i][i]
        cur = matrix[i] = [ v/pivot for v in matrix[i] ]
        j = i+1
        while j < NUM_ROW:
            eq = matrix[j]
            matrix[j] = [ j-eq[i]*k for j,k in zip(eq,cur) ]
            j += 1
        i += 1
    # Substitute
    i = NUM_ROW - 1
    while i >= 0:
        # matrix[i][i] should == 1
        cur = matrix[i]
        j = 0
        while j < i:
            eq = matrix[j]
            matrix[j] = [ j-eq[i]*k for j,k in zip(eq,cur) ]
            j += 1
        i -= 1
    # Return solutions: reversed, this way we have [x0,x1,x2..]
    ret = [ row[-1] for row in matrix ]
    ret.reverse()
    return ret

# HELPERS
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

CS = [
    "#1d1f21",
    "#cc342b",
    "#198844",
    "#fba922",
    "#3971ed",
    "#a36ac7",
    "#3971ed",
    "#c5c8c6",
    "#969896",
    "#cc342b",
    "#198844",
    "#fba922",
    "#3971ed",
    "#a36ac7",
    "#3971ed",
    "#ffffff",
]

# def main():
#     m = FilterModule()
#     greys = m.generate_grays(CS)
#     for g in greys:
#         print(g)

# if __name__ == "__main__":
#     main()
