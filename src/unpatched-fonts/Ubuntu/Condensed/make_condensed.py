#!/usr/bin/env python
# coding=utf8
# Nerd Fonts Version: 3.0.1

import sys

class TableHEADWriter:
    """ Access to the HEAD table without external dependencies """
    def getlong(self, pos = None):
        """ Get four bytes from the font file as integer number """
        if pos:
            self.goto(pos)
        return (ord(self.f.read(1)) << 24) + (ord(self.f.read(1)) << 16) + (ord(self.f.read(1)) << 8) + ord(self.f.read(1))

    def getshort(self, pos = None):
        """ Get two bytes from the font file as integer number """
        if pos:
            self.goto(pos)
        return (ord(self.f.read(1)) << 8) + ord(self.f.read(1))

    def putlong(self, num, pos = None):
        """ Put number as four bytes into font file """
        if pos:
            self.goto(pos)
        self.f.write(bytearray([(num >> 24) & 0xFF, (num >> 16) & 0xFF ,(num >> 8) & 0xFF, num & 0xFF]))
        self.modified = True

    def putshort(self, num, pos = None):
        """ Put number as two bytes into font file """
        if pos:
            self.goto(pos)
        self.f.write(bytearray([(num >> 8) & 0xFF, num & 0xFF]))
        self.modified = True

    def calc_checksum(self, start, end, checksum = 0):
        """ Calculate a font table checksum, optionally ignoring another embedded checksum value (for table 'head') """
        self.f.seek(start)
        for i in range(start, end - 4, 4):
            checksum += self.getlong()
            checksum &= 0xFFFFFFFF
        i += 4
        extra = 0
        for j in range(4):
            extra = extra << 8
            if i + j <= end:
                extra += ord(self.f.read(1))
        checksum = (checksum + extra) & 0xFFFFFFFF
        return checksum

    def find_table(self, tablenames, idx):
        """ Search all tables for one of the tables in tablenames and store its metadata """
        # Use font with index idx if this is a font collection file
        self.f.seek(0, 0)
        tag = self.f.read(4)
        if tag == b'ttcf':
            self.f.seek(2*2, 1)
            self.num_fonts = self.getlong()
            if (idx >= self.num_fonts):
                raise Exception('Trying to access subfont index {} but have only {} fonts'.format(idx, num_fonts))
            for _ in range(idx + 1):
                offset = self.getlong()
            self.f.seek(offset, 0)
        elif idx != 0:
            raise Exception('Trying to access subfont but file is no collection')
        else:
            self.f.seek(0, 0)
            self.num_fonts = 1

        self.f.seek(4, 1)
        numtables = self.getshort()
        self.f.seek(3*2, 1)

        for i in range(numtables):
            tab_name = self.f.read(4)
            self.tab_check_offset = self.f.tell()
            self.tab_check = self.getlong()
            self.tab_offset = self.getlong()
            self.tab_length = self.getlong()
            if tab_name in tablenames:
                return True
        return False

    def find_head_table(self, idx):
        """ Search all tables for the HEAD table and store its metadata """
        # Use font with index idx if this is a font collection file
        found = self.find_table([ b'head' ], idx)
        if not found:
            raise Exception('No HEAD table found in font idx {}'.format(idx))


    def goto(self, where):
        """ Go to a named location in the file or to the specified index """
        if isinstance(where, str):
            positions = {'checksumAdjustment': 2+2+4,
                         'flags': 2+2+4+4+4,
                         'lowestRecPPEM': 2+2+4+4+4+2+2+8+8+2+2+2+2+2,
                         'avgWidth': 2,
                         'widthClass': 2+2+2,
                }
            where = self.tab_offset + positions[where]
        self.f.seek(where)


    def calc_full_checksum(self, check = False):
        """ Calculate the whole file's checksum """
        self.f.seek(0, 2)
        self.end = self.f.tell()
        full_check = self.calc_checksum(0, self.end, (-self.checksum_adj) & 0xFFFFFFFF)
        if check and (0xB1B0AFBA - full_check) & 0xFFFFFFFF != self.checksum_adj:
            sys.exit("Checksum of whole font is bad")
        return full_check

    def calc_table_checksum(self, check = False):
        tab_check_new = self.calc_checksum(self.tab_offset, self.tab_offset + self.tab_length - 1, (-self.checksum_adj) & 0xFFFFFFFF)
        if check and tab_check_new != self.tab_check:
            sys.exit("Checksum of 'head' in font is bad")
        return tab_check_new

    def reset_table_checksum(self):
        new_check = self.calc_table_checksum()
        self.putlong(new_check, self.tab_check_offset)

    def reset_full_checksum(self):
        new_adj = (0xB1B0AFBA - self.calc_full_checksum()) & 0xFFFFFFFF
        self.putlong(new_adj, 'checksumAdjustment')

    def close(self):
        self.f.close()


    def __init__(self, filename):
        self.modified = False
        self.f = open(filename, 'r+b')

        self.find_head_table(0)

        self.flags = self.getshort('flags')
        self.lowppem = self.getshort('lowestRecPPEM')
        self.checksum_adj = self.getlong('checksumAdjustment')


print('Tweaking {}'.format(sys.argv[1]))
font = TableHEADWriter(sys.argv[1])
font.find_table([b'OS/2'], 0)
width = font.getshort('widthClass')
font.putshort(3, 'widthClass') # 3 == Condensed
font.reset_table_checksum()
font.reset_full_checksum()
font.close()
