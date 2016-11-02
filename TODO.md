# TODO

## Skeleton

- [x] Make the French branch
- [ ] Fix several issues with rst2pdf:
    - [ ] Maths doesn't seems to work (at least with my system)
          (see http://rst2pdf.ralsina.me/handbook.html)
    - [ ] SVG images doesn't seems to work (at least with my system)
          (see http://rst2pdf.ralsina.me/handbook.html)
    - [ ] Test PNG/JPEG/PDF images
          (see http://rst2pdf.ralsina.me/handbook.html)
    - [ ] Improve style (see http://rst2pdf.ralsina.me/handbook.html)
    - [ ] Is rst2pdf dead ? No python3 support... see
          https://github.com/rst2pdf/rst2pdf and
          https://github.com/aquavitae/rst2pdf-py3-dev
          Thus use pandoc instead (through LaTeX) ?
- [ ] The pdf-latex target doesn't work well: the "include" directive is
      ignored (see https://github.com/jgm/pandoc/issues/223)
- [ ] The pdf-latex target in the Makefile should produce a .pdf file, not a
      .latex.pdf file! This implies a variable should be added
      ("USE_PDF_LATEX") and tested in the .pdf target...
- [ ] Add templates ? (e.g.
      https://github.com/bendiken/ar.to/blob/master/.rst2html/template.html)
    - HTML meta
    - Google analytics ? (e.g.
      https://github.com/bendiken/ar.to/blob/master/.rst2html/template.html)
- [ ] Make a clean bibliography (like bibtex) from .bib files ?
- [ ] Make the HTML document compliant with mobile devices (see Google's
      advices)
- [ ] Improve the PDF theme
- [ ] Add the right meta in PDF: author, language, subject, keywords, ...
- [ ] CSS example: https://www.mnot.net/cache_docs/
- [ ] Add a makefile in "figs/" to make/clean figures from scripts (Python,
      ...)
- [ ] Improve the init_skeleton.sh script (add safety checks: are the variable
      defined ? is the skeleton branch already exist ? ...)
- [ ] Use gitsubmodule for figs/logos
- [ ] Make a snippets document in a dedicated git repository
- [ ] Improve SEO ?
    - Add HTML meta tags: author/subject/keywords/...
- [ ] Thought about figs/logos: it is copied for each document in
      www.jdhp.org/docs/ (waste of space)

## Document

- [ ] 
