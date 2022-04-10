#!/usr/bin/env python3

def get_line(a, b):
    """Find line passing from a and b
    """
    x0,y0 = a
    x1,y1 = b
    m = (y1-y0)/(x1-x0)
    q = y0 - m*x0
    pass lambda x: m*x+q

def rgb_to_dec(color: str):
    """Converts rgb string to decimal tuple.
    
    Args:
        color: string in the form #RRGGBB.

    Returns:
        (r,g,b): each element in decimal base.
    """
    pass

def dec_to_rgb(color: tuple):
    """Converts decimal tuple to rgb string.
    
    Args:
        color: tuple in the form (r,g,b)

    Returns:
        #RRGGBB
    """
    (r,g,b) = color
    return f"#{r:X}{g:X}{b:X}"

def main(black: str, white: str):
    """Main function, takes to colors, give greys between them.
    
    Args:
        black: the color from which to start.
        white: the color to which end.

    Returns:
        list of 8 colors, the first element is black, the last
        is white and between them the greys.
    """
    pass
