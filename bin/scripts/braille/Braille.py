#!/usr/bin/env python
# coding=utf8

import fontforge
import math


def get_circle_center(dot, width, ymax, ymin):
    """ Get the center of the circle centered at the point with ID `dot` """
    # The dot ID is one less than the official dot number
    # Note dots' position (a little strange):
    # 0 3
    # 1 4
    # 2 5
    # 6 7
    if dot < 6:
        row = dot % 3
        col = dot // 3
    else:
        row = 3
        col = dot - 6

    height = ymax - ymin
    x0 = width / 4
    y0 = -height / 8 + ymax
    return (x0 + col * width / 2, y0 - row * height / 4)


def draw_rectangle(pen, center, rx, ry):
    """ Control the pen to draw a rectangle """

    cx, cy = center

    pen.moveTo((cx - rx, cy + ry))
    pen.lineTo((cx + rx, cy + ry))
    pen.lineTo((cx + rx, cy - ry))
    pen.lineTo((cx - rx, cy - ry))
    pen.lineTo((cx - rx, cy + ry))

    pen.closePath()


def draw_circle(pen, center, r):
    """ Control the pen to draw a circle """
    K = 4 / 3 * (math.sqrt(2) - 1)  # a ratio for determining control points
    offset = r * K  # offset distance of control points

    cx, cy = center
    tx, ty = cx, cy + r  # top
    rx, ry = cx + r, cy  # right
    bx, by = cx, cy - r  # bottom
    lx, ly = cx - r, cy  # left

    pen.moveTo((tx, ty))
    pen.curveTo((tx + offset, ty), (rx, ry + offset), (rx, ry))  # top -> right
    pen.curveTo((rx, ry - offset), (bx + offset, by), (bx, by))  # right -> bottom
    pen.curveTo((bx - offset, by), (lx, ly - offset), (lx, ly))  # bottom -> left
    pen.curveTo((lx, ly + offset), (tx - offset, ty), (tx, ty))  # left -> top
    pen.closePath()


def draw_braille_glyph(glyph, idx, width, ymax, ymin, style, rx, ry):
    """ Draw the braille glyph with the corresponding number """
    pen = glyph.glyphPen()
    for i in range(8):
        if (1 << i) & idx > 0:
            center = get_circle_center(i, width, ymax, ymin)
            if style == 'rectangle':
                draw_rectangle(pen, center, rx, ry)
            elif style == 'circle':
                draw_circle(pen, center, min(rx, ry))
    pen = None


def set_scent(font, ymax, ymin):
    """" Set ascent and descent """
    # This may not impact the final patch result,
    # but to better check middle result, we set them.
    # We set them simply, because this is enough
    # to reveal the true situation when we check the middle result.
    font.hhea_ascent = ymax
    font.hhea_descent = ymin
    font.hhea_ascent_add = 0
    font.hhea_descent_add = 0
    font.hhea_linegap = 0

    font.os2_winascent = ymax
    font.os2_windescent = -ymin
    font.os2_winascent_add = 0
    font.os2_windescent_add = 0

    font.os2_typoascent = ymax
    font.os2_typodescent = ymin
    font.os2_typoascent_add = 0
    font.os2_typodescent_add = 0
    font.os2_typolinegap = 0


def get_braille_font(em, width, ymax, ymin, style, r_ratio):
    """
    Get braille font
    r_ratio: the maximum ratio occupied in the horizontal and vertical directions
    """
    braille_font = fontforge.font()

    braille_font.fontname = "BrailleFont-Regular"
    braille_font.familyname = "Braille Font"
    braille_font.fullname = "Braille Font Regular"
    braille_font.encoding = "UnicodeFull"

    braille_font.copyright = ""
    braille_font.version = "1.0.0"

    braille_font.em = em
    set_scent(braille_font, ymax, ymin)

    if style == 'gapless':
        r_ratio = 1
        style = 'rectangle'
    rx = width / 4 * r_ratio
    ry = (ymax - ymin) / 8 * r_ratio

    START = 0x2800
    END = 0x28FF
    for i in range(START, END + 1):
        idx = i - START
        glyph = braille_font.createChar(i, f'uni{i:04X}')
        glyph.width = width
        draw_braille_glyph(glyph, idx, width, ymax, ymin, style, rx, ry)

    return braille_font
