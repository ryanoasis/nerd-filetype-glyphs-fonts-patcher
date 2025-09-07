                        Ubuntu Font Family Licensing FAQ

  Stylistic Foundations

   The Ubuntu Font Family is the first time that a libre typeface has been
   designed professionally and explicitly with the intent of developing a
   public and long-term community-based development process.

   When developing an open project, it is generally necessary to have firm
   foundations: a font needs to maintain harmony within itself even across
   many type designers and writing systems. For the [1]Ubuntu Font Family,
   the process has been guided with the type foundry Dalton Maag setting
   the project up with firm stylistic foundation covering several
   left-to-right scripts: Latin, Greek and Cyrillic; and right-to-left
   scripts: Arabic and Hebrew (due in 2011).

   With this starting point the community will, under the supervision of
   [2]Canonical and [3]Dalton Maag, be able to build on the existing font
   sources to expand their character coverage. Ultimately everybody will
   be able to use the Ubuntu Font Family in their own written languages
   across the whole of Unicode (and this will take some time!).

  Licensing

   The licence chosen by any free software project is one of the
   foundational decisions that sets out how derivatives and contributions
   can occur, and in turn what kind of community will form around the
   project.

   Using a licence that is compatible with other popular licences is a
   powerful constraint because of the [4]network effects: the freedom to
   share improvements between projects allows free software to reach
   high-quality over time. Licence-proliferation leads to many
   incompatible licences, undermining the network effect, the freedom to
   share and ultimately making the libre movement that Ubuntu is a part of
   less effective. For all kinds of software, writing a new licence is not
   to be taken lightly and is a choice that needs to be thoroughly
   justified if this path is taken.

   Today it is not clear to Canonical what the best licence for a font
   project like the Ubuntu Font Family is: one that starts life designed
   by professionals and continues with the full range of community
   development, from highly commercial work in new directions to curious
   beginners' experimental contributions. The fast and steady pace of the
   Ubuntu release cycle means that an interim libre licence has been
   necessary to enable the consideration of the font family as part of
   Ubuntu 10.10 operating system release.

   Before taking any decision on licensing, Canonical as sponsor and
   backer of the project has reviewed the many existing licenses used for
   libre/open fonts and engaged the stewards of the most popular licenses
   in detailed discussions. The current interim licence is the first step
   in progressing the state-of-the-art in licensing for libre/open font
   development.

   The public discussion must now involve everyone in the (comparatively
   new) area of the libre/open font community; including font users,
   software freedom advocates, open source supporters and existing libre
   font developers. Most importantly, the minds and wishes of professional
   type designers considering entering the free software business
   community must be taken on board.

   Conversations and discussion has taken place, privately, with
   individuals from the following groups (generally speaking personally on
   behalf of themselves, rather than their affiliations):
     * [5]SIL International
     * [6]Open Font Library
     * [7]Software Freedom Law Center
     * [8]Google Font API

    Document embedding

   One issue highlighted early on in the survey of existing font licences
   is that of document embedding. Almost all font licences, both free and
   unfree, permit embedding a font into a document to a certain degree.
   Embedding a font with other works that make up a document creates a
   "combined work" and copyleft would normally require the whole document
   to be distributed under the terms of the font licence. As beautiful as
   the font might be, such a licence makes a font too restrictive for
   useful general purpose digital publishing.

   The situation is not entirely unique to fonts and is encountered also
   with tools such as GNU Bison: a vanilla GNU GPL licence would require
   anything generated with Bison to be made available under the terms of
   the GPL as well. To avoid this, Bison is [9]published with an
   additional permission to the GPL which allows the output of Bison to be
   made available under any licence.

   The conflict between licensing of fonts and licensing of documents, is
   addressed in two popular libre font licences, the SIL OFL and GNU GPL:
     * [10]SIL Open Font Licence: When OFL fonts are embedded in a
       document, the OFL's terms do not apply to that document. (See
       [11]OFL-FAQ for details.
     * [12]GPL Font Exception: The situation is resolved by granting an
       additional permission to allow documents to not be covered by the
       GPL. (The exception is being reviewed).

   The Ubuntu Font Family must also resolve this conflict, ensuring that
   if the font is embedded and then extracted it is once again clearly
   under the terms of its libre licence.

    Long-term licensing

   Those individuals involved, especially from Ubuntu and Canonical, are
   interested in finding a long-term libre licence that finds broad favour
   across the whole libre/open font community. The deliberation during the
   past months has been on how to licence the Ubuntu Font Family in the
   short-term, while knowingly encouraging everyone to pursue a long-term
   goal.
     * [13]Copyright assignment will be required so that the Ubuntu Font
       Family's licensing can be progressively expanded to one (or more)
       licences, as best practice continues to evolve within the
       libre/open font community.
     * Canonical will support and fund legal work on libre font licensing.
       It is recognised that the cost and time commitments required are
       likely to be significant. We invite other capable parties to join
       in supporting this activity.

   The GPL version 3 (GPLv3) will be used for Ubuntu Font Family build
   scripts and the CC-BY-SA for associated documentation and non-font
   content: all items which do not end up embedded in general works and
   documents.

Ubuntu Font Licence

   For the short-term only, the initial licence is the [14]Ubuntu Font
   License (UFL). This is loosely inspired from the work on the SIL
   OFL 1.1, and seeks to clarify the issues that arose during discussions
   and legal review, from the perspective of the backers, Canonical Ltd.
   Those already using established licensing models such as the GPL, OFL
   or Creative Commons licensing should have no worries about continuing
   to use them. The Ubuntu Font Licence (UFL) and the SIL Open Font
   Licence (SIL OFL) are not identical and should not be confused with
   each other. Please read the terms precisely. The UFL is only intended
   as an interim license, and the overriding aim is to support the
   creation of a more suitable and generic libre font licence. As soon as
   such a licence is developed, the Ubuntu Font Family will migrate to
   it—made possible by copyright assignment in the interium. Between the
   OFL 1.1, and the UFL 1.0, the following changes are made to produce the
   Ubuntu Font Licence:
     * Clarification:

    1. Document embedding (see [15]embedding section above).
    2. Apply at point of distribution, instead of receipt
    3. Author vs. copyright holder disambiguation (type designers are
       authors, with the copyright holder normally being the funder)
    4. Define "Propagate" (for internationalisation, similar to the GPLv3)
    5. Define "Substantially Changed"
    6. Trademarks are explicitly not transferred
    7. Refine renaming requirement

     Streamlining:
    8. Remove "not to be sold separately" clause
    9. Remove "Reserved Font Name(s)" declaration

   A visual demonstration of how these points were implemented can be
   found in the accompanying coloured diff between SIL OFL 1.1 and the
   Ubuntu Font Licence 1.0: [16]ofl-1.1-ufl-1.0.diff.html

References

   1. http://font.ubuntu.com/
   2. http://www.canonical.com/
   3. http://www.daltonmaag.com/
   4. http://en.wikipedia.org/wiki/Network_effect
   5. http://scripts.sil.org/
   6. http://openfontlibrary.org/
   7. http://www.softwarefreedom.org/
   8. http://code.google.com/webfonts
   9. http://www.gnu.org/licenses/gpl-faq.html#CanIUseGPLToolsForNF
  10. http://scripts.sil.org/OFL_web
  11. http://scripts.sil.org/OFL-FAQ_web
  12. http://www.gnu.org/licenses/gpl-faq.html#FontException
  13. https://launchpad.net/~uff-contributors
  14. http://font.ubuntu.com/ufl/ubuntu-font-licence-1.0.txt
  15. http://font.ubuntu.com/ufl/FAQ.html#embedding
  16. http://font.ubuntu.com/ufl/ofl-1.1-ufl-1.0.diff.html
