#!/usr/bin/env python
# coding=utf8

import re
from FontnameTools import FontnameTools

class FontnameParser:
    """Parse a font name and generate all kinds of names"""

    def __init__(self, fontname, logger):
        """Parse a fontname and store the results"""
        self.parse_ok = False
        self.use_short_families = (False, False, False) # ( camelcase name, short styles, aggressive )
        self.keep_regular_in_family = None # None = auto, True, False
        self.suppress_preferred_if_identical = True
        self.family_suff = ''
        self.ps_fontname_suff = ''
        self.short_family_suff = ''
        self.name_subst = []
        [ self.parse_ok, self._basename, self.weight_token, self.style_token, self.other_token, self._rest ] = FontnameTools.parse_font_name(fontname)
        self.basename = self._basename
        self.rest = self._rest
        self.add_name_substitution_table(FontnameTools.SIL_TABLE)
        self.rename_oblique = True
        self.logger = logger

    def _make_ps_name(self, n, is_family):
        """Helper to limit font name length in PS names"""
        fam = 'family ' if is_family else ''
        limit = 31 if is_family else 63
        if len(n) <= limit:
            return n
        r = re.search('(.*)(-.*)', n)
        if not r:
            new_n = n[:limit]
        else:
            q = limit - len(r.groups()[1])
            if q < 1:
                q = 1
                self.logger.error('====-< Shortening too long PS {}name: Garbage warning'. format(fam))
            new_n = r.groups()[0][:q] + r.groups()[1]
        if new_n != n:
            self.logger.error('====-< Shortening too long PS {}name: {} -> {}'.format(fam, n, new_n))
        return new_n

    def _shortened_name(self):
        """Return a blank free basename-rest combination"""
        if not self.use_short_families[0]:
            return (self.basename, self.rest)
        else:
            return (FontnameTools.concat(self.basename, self.rest).replace(' ', ''), '')

    def set_keep_regular_in_family(self, keep):
        """Familyname may contain 'Regular' where it should normally be suppressed"""
        self.keep_regular_in_family = keep

    def set_expect_no_italic(self, noitalic):
        """Prevents rewriting Oblique as family name part"""
        # To prevent naming clashes usually Oblique is moved out in the family name
        # because some fonts have Italic and Oblique, and we want to generate pure
        # RIBBI families in ID1/2.
        # But some fonts have Oblique instead of Italic, here the prevential movement
        # is not needed, or rather contraproductive. This can not be detected on a
        # font file level but needs to be specified per family from the outside.
        # Returns true if setting was successful.
        if 'Italic' in self.style_token:
            self.rename_oblique = True
            return not noitalic
        self.rename_oblique = not noitalic
        return True

    def set_suppress_preferred(self, suppress):
        """Suppress ID16/17 if it is identical to ID1/2 (True is default)"""
        self.suppress_preferred_if_identical = suppress

    def inject_suffix(self, family, ps_fontname, short_family):
        """Add a custom additonal string that shows up in the resulting names"""
        self.family_suff = family.strip()
        self.ps_fontname_suff = ps_fontname.replace(' ', '')
        self.short_family_suff = short_family.strip()
        return self

    def enable_short_families(self, camelcase_name, prefix, aggressive):
        """Enable short styles in Family when (original) font name starts with prefix; enable CamelCase basename in (Typog.) Family"""
        # camelcase_name is boolean
        # prefix is either a string or False/True
        if isinstance(prefix, str):
            prefix = self._basename.startswith(prefix)
        self.use_short_families = ( camelcase_name, prefix, aggressive )
        return self

    def add_name_substitution_table(self, table):
        """Have some fonts renamed, takes list of tuples (regex, replacement)"""
        # The regex will be anchored to name begin and used case insensitive
        # Replacement can have regex matches, mind to catch the correct source case
        self.name_subst = table
        self.basename = self._basename
        self.rest = self._rest
        for regex, replacement in self.name_subst:
            base_and_rest = self.basename + (' ' + self.rest if len(self.rest) else '')
            m = re.match(regex, base_and_rest, re.IGNORECASE)
            if not m:
                continue
            i = len(self.basename) - len(m.group(0))
            if i < 0:
                self.basename = m.expand(replacement).rstrip()
                self.rest = self.rest[-(i+1):].lstrip()
            else:
                self.basename = m.expand(replacement) + self.basename[len(m.group(0)):]
        return self

    def drop_for_powerline(self):
        """Remove 'for Powerline' from all names (can not be undone)"""
        if 'Powerline' in self.other_token:
            self.other_token.remove('Powerline')
        if 'ForPowerline' in self.other_token:
            self.other_token.remove('ForPowerline')
        self._basename = re.sub(r'(\b|for\s?)?powerline\b', '', self._basename, 1, re.IGNORECASE).strip()
        self.add_name_substitution_table(self.name_subst) # re-evaluate
        return self

    ### Following the creation of the name parts:
    #
    # Relevant websites
    # https://www.fonttutorials.com/how-to-name-font-family/
    # https://docs.microsoft.com/en-us/typography/opentype/spec/name#name-ids
    # https://docs.microsoft.com/en-us/typography/opentype/spec/os2#fss
    # https://docs.microsoft.com/en-us/typography/opentype/spec/head#macstyle

    # Example (mind that they group 'semibold' as classic-group-of-4 Bold, while we will always only take bold as Bold):
    # Adobe Caslon Pro Regular            ID1: Adobe Caslon Pro         ID2: Regular
    # Adobe Caslon Pro Italic             ID1: Adobe Caslon Pro         ID2: Italic
    # Adobe Caslon Pro Semibold           ID1: Adobe Caslon Pro         ID2: Bold           ID16: Adobe Caslon Pro    ID17: Semibold
    # Adobe Caslon Pro Semibold Italic    ID1: Adobe Caslon Pro         ID2: Bold Italic    ID16: Adobe Caslon Pro    ID17: Semibold Italic
    # Adobe Caslon Pro Bold               ID1: Adobe Caslon Pro Bold    ID2: Regular        ID16: Adobe Caslon Pro    ID17: Bold
    # Adobe Caslon Pro Bold Italic        ID1: Adobe Caslon Pro Bold    ID2: Italic         ID16: Adobe Caslon Pro    ID17: Bold Italic

    # fontname === preferred_family + preferred_styles
    # fontname === family + subfamily
    #
    # familybase = basename + rest + other (+ suffix)
    # ID 1/2 just have self.style in the subfamily, all the rest ends up in the family
    # ID 16/17 have self.style and self.weight in the subfamily, the rest ends up in the family

    def fullname(self):
        """Get the SFNT Fullname (ID 4)"""
        styles = self.style_token
        weights = self.weight_token
        if self.keep_regular_in_family == None:
            keep_regular = FontnameTools.is_keep_regular(self._basename + ' ' + self._rest)
        else:
            keep_regular = self.keep_regular_in_family
        if ('Regular' in styles
                and (not keep_regular
                    or FontnameTools.check_contains_weight(self.weight_token))): # This is actually a malformed font name
            styles = list(self.style_token)
            styles.remove('Regular')
        # For naming purposes we want Oblique to be part of the styles
        (weights, styles) = FontnameTools.make_oblique_style(weights, styles)
        (name, rest) = self._shortened_name()
        if self.use_short_families[1]:
            [ weights, styles ] = FontnameTools.short_styles([ weights, styles ], self.use_short_families[2])
        return FontnameTools.concat(name, rest, self.other_token, self.short_family_suff, weights, styles)

    def psname(self):
        """Get the SFNT PostScriptName (ID 6)"""
        # This is almost self.family() + '-' + self.subfamily()
        (name, rest) = self._shortened_name()
        styles = self.style_token
        weights = self.weight_token
        if self.use_short_families[1]:
            styles = FontnameTools.short_styles(styles, self.use_short_families[2])
            weights = FontnameTools.short_styles(weights, self.use_short_families[2])
        fam = FontnameTools.camel_casify(FontnameTools.concat(name, rest, self.other_token, self.ps_fontname_suff))
        sub = FontnameTools.camel_casify(FontnameTools.concat(weights, styles))
        if len(sub) > 0:
            sub = '-' + sub
        fam = FontnameTools.postscript_char_filter(fam)
        sub = FontnameTools.postscript_char_filter(sub)
        return self._make_ps_name(fam + sub, False)

    def preferred_family(self, short_alternative = False):
        """Get the SFNT Preferred Familyname (ID 16)"""
        # When short_alternative we get the short named alternative needed for some Windows applications
        (name, rest) = self._shortened_name()
        if short_alternative:
            # Try to come up with a shortened family name
            # This is in principle the code from family() but without including weights
            # because weights shall still end up in ID 17
            other = self.other_token
            if self.use_short_families[1]:
                [ other ] = FontnameTools.short_styles([ other ], self.use_short_families[2])
            pfn = FontnameTools.concat(name, rest, other, self.short_family_suff)
            # Only return something if it is different to our standard behavior
            if pfn == self.preferred_family(False):
                return ''
            return pfn
        pfn = FontnameTools.concat(name, rest, self.other_token, self.family_suff)
        if self.suppress_preferred_if_identical and pfn == self.family():
            # Do not set if identical to ID 1
            return ''
        return pfn

    def preferred_styles(self, _ = False):
        """Get the SFNT Preferred Styles (ID 17)"""
        styles = self.style_token
        weights = self.weight_token
        # For naming purposes we want Oblique to be part of the styles
        (weights, styles) = FontnameTools.make_oblique_style(weights, styles)
        pfs = FontnameTools.concat(weights, styles)
        if self.suppress_preferred_if_identical and pfs == self.subfamily():
            # Do not set if identical to ID 2
            return ''
        return pfs

    def family(self):
        """Get the SFNT Familyname (ID 1)"""
        # We use the short form of the styles to save on number of chars
        (name, rest) = self._shortened_name()
        other = self.other_token
        weights = self.weight_token
        aggressive = self.use_short_families[2]
        if not self.rename_oblique:
            (weights, styles) = FontnameTools.make_oblique_style(weights, [])
        if self.use_short_families[1]:
            [ other, weights ] = FontnameTools.short_styles([ other, weights ], aggressive)
        weights = [ w if w != 'Oblique' else 'Obl' for w in weights ]
        return FontnameTools.concat(name, rest, other, self.short_family_suff, weights)

    def subfamily(self):
        """Get the SFNT SubFamily (ID 2)"""
        styles = self.style_token
        weights = self.weight_token
        if not self.rename_oblique:
            (weights, styles) = FontnameTools.make_oblique_style(weights, styles)
        if len(styles) == 0:
            if 'Oblique' in weights:
                return FontnameTools.concat(styles, 'Italic')
            return 'Regular'
        if 'Oblique' in weights and not 'Italic' in styles:
                return FontnameTools.concat(styles, 'Italic')
        return FontnameTools.concat(styles)

    def ps_familyname(self):
        """Get the PS Familyname"""
        fam = self.preferred_family(False)
        if len(fam) < 1:
            fam = self.family()
        return self._make_ps_name(fam, True)

    def macstyle(self, style):
        """Modify a given macStyle value for current name, just bits 0 and 1 touched"""
        b = style & (~3)
        b |= 1 if 'Bold' in self.style_token else 0
        b |= 2 if 'Italic' in self.style_token else 0
        return b

    def fs_selection(self, fs):
        """Modify a given fsSelection value for current name, bits 0, 5, 6, 8, 9 touched"""
        ITALIC = 1 << 0; BOLD = 1 << 5; REGULAR = 1 << 6; WWS = 1 << 8; OBLIQUE = 1 << 9
        b = fs & (~(ITALIC | BOLD | REGULAR | WWS | OBLIQUE))
        if 'Bold' in self.style_token:
            b |= BOLD
        # Ignore Italic if we have Oblique
        if 'Oblique' in self.weight_token:
            b |= OBLIQUE
            if not self.rename_oblique:
                # If we have no dedicated italic, than oblique = italic
                b |= ITALIC
        elif 'Italic' in self.style_token:
            b |= ITALIC
        # Regular is just the basic weight
        if len(self.weight_token) == 0 and not b & (ITALIC | BOLD | OBLIQUE):
            b |= REGULAR
        b |= WWS # We assert this by our naming process
        return b

    def checklen(self, max_len, entry_id, name):
        """Check the length of a name string and report violations"""
        if len(name) <= max_len:
            self.logger.debug('=====> {:18} ok       ({:2} <={:2}): {}'.format(entry_id, len(name), max_len, name))
        else:
            self.logger.error('====-< {:18} too long ({:2} > {:2}): {}'.format(entry_id, len(name), max_len, name))
        return name

    def check_weights(self, font):
        """ Check weight metadata for consistency """
        # Some weights are hidden in styles
        ignore_token = list(FontnameTools.known_widths) + list(FontnameTools.known_slopes)
        ignore_token += [ m + s
                        for s in list(FontnameTools.known_widths)
                        for m in list(FontnameTools.known_modifiers) ]
        restored_weight_token = [ w for w in self.style_token + self.weight_token if w not in ignore_token ]
        weight = ''.join(restored_weight_token)
        os2_weight = font.os2_weight
        ps_weight = FontnameTools.weight_string_to_number(font.weight)
        name_weight = FontnameTools.weight_string_to_number(weight)
        weightproblem = False
        if ps_weight is None:
            self.logger.warn('Can not parse PS-weight: {}'.format(font.weight))
            weightproblem = True
        if name_weight is None:
            self.logger.warn('Can not parse name for weight: {}'.format(weight))
            weightproblem = True
        if weightproblem or abs(os2_weight - ps_weight) > 50 or abs(os2_weight - name_weight) > 50:
            self.logger.warning('Possible problem with the weight metadata detected, check with --debug')
        self.logger.debug('Weight approximations: OS2/PS/Name: {}/{}/{} (from {}/\'{}\'/\'{}\')'.format(
            os2_weight, ps_weight, name_weight,
            font.os2_weight, font.weight, weight))

    def pfam_to_sfnt(self, name_function, entry, message, maxnum = 2):
        """Prepare SFNT entries for short and long form as two different languages"""
        languages = [ 'English (US)', 'English (British)' ]
        names = [ name_function(False), name_function(True) ]
        ret = [ ]
        for i in range(maxnum):
            if len(names[i]):
                ret += [( languages[i], entry, self.checklen(31, message, names[i]) )]
            else:
                break
        return ret

    def rename_font(self, font):
        """Rename the font to include all information we found (font is fontforge font object)"""
        font.fondname = None
        font.fontname = self.psname()
        font.fullname = self.fullname()
        font.familyname = self.ps_familyname()
        self.check_weights(font)

        # We have to work around several issues in fontforge:
        #
        # a. Remove some entries from SFNT table; fontforge has no API function for that
        #
        # b. Fontforge does not allow to set SubFamily (and other) to any value:
        #
        #    Fontforge lets you set any value, unless it is the default value. If it
        #    is the default value it does not set anything. It also does not remove
        #    a previously existing non-default value. Why it is done this way is
        #    unclear:
        #      fontforge/python.c SetSFNTName() line 11431
        #        return( 1 ); /* If they set it to the default, there's nothing to do */
        #
        #    Then is the question: What is the default? It is taken from the
        #    currently set fontname (??!). The fontname is parsed and everything
        #    behind the dash is the default SubFamily:
        #      fontforge/tottf.c DefaultTTFEnglishNames()
        #      fontforge/splinefont.c _GetModifiers()
        #
        #    To fix this without touching Fontforge we need to set the SubFamily
        #    directly in the SFNT table:
        #
        # c. Fontforge has the bug that it allows to write empty-string to a SFNT field
        #    and it is actually embedded as empty string, but empty strings are not
        #    shown if you query the sfnt_names *rolleyes*

        version_tag = ''
        sfnt_list = []
        TO_DEL = ['Family', 'SubFamily', 'Fullname', 'PostScriptName', 'Preferred Family',
                'Preferred Styles', 'Compatible Full', 'WWS Family', 'WWS Subfamily',
                'UniqueID', 'CID findfont Name']
        # Remove these entries in all languages and add (at least the vital ones) some
        # back, but only as 'English (US)'. This makes sure we do not leave contradicting
        # names over different languages.
        for l, k, v in list(font.sfnt_names):
            if not k in TO_DEL and l == 'English (US)':
                sfnt_list += [( l, k, v )]
                if k == 'Version':
                    version_tag = ' ' + v.split()[-1]

        sfnt_list += [( 'English (US)', 'Family', self.checklen(31, 'Family (ID 1)', self.family()) )] # 1
        sfnt_list += [( 'English (US)', 'SubFamily', self.checklen(31, 'SubFamily (ID 2)', self.subfamily()) )] # 2
        sfnt_list += [( 'English (US)', 'UniqueID', self.fullname() + version_tag )] # 3
        sfnt_list += [( 'English (US)', 'Fullname', self.checklen(63, 'Fullname (ID 4)', self.fullname()) )] # 4
        sfnt_list += [( 'English (US)', 'PostScriptName', self.checklen(63, 'PSN (ID 6)', self.psname()) )] # 6
        sfnt_plus  = self.pfam_to_sfnt(self.preferred_family, 'Preferred Family', 'PrefFamily (ID 16)') # 16
        sfnt_plus += self.pfam_to_sfnt(self.preferred_styles, 'Preferred Styles', 'PrefStyles (ID 17)', len(sfnt_plus)) # 17
        sfnt_list += sfnt_plus

        font.sfnt_names = tuple(sfnt_list)

        font.macstyle = self.macstyle(0)
        font.os2_stylemap = self.fs_selection(0)
