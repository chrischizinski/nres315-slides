# NRES 315 course slides

This repository hosts the public HTML lecture slides for **NRES 315: Human Dimensions of Fish and Wildlife Management**. Canvas remains the primary learning-management system for course schedules, assignments, quizzes, grades, announcements, deadlines, and submissions.

The website is intentionally small: it is a stable home for lecture slides and selected public resources. Do not add student information, grades, answer keys, private Canvas material, restricted assessments, unpublished sensitive data, or copyrighted material that cannot be publicly redistributed.

## Structure

- `index.qmd` is the student-facing slide directory. Only lectures linked here are advertised to students.
- `slides/` contains independent Quarto Reveal.js presentations. Use two-digit, lowercase, hyphenated filenames such as `07-habitat-selection.qmd`.
- `assets/` contains shared public images, figures, diagrams, and logos. Refer to them from a slide with a relative path, for example `![](../assets/images/mallard-habitat-selection.png)`.
- `styles/slides.scss` is the shared NRES 315 Reveal.js field-guide stylesheet used by every released deck.
- `source-footer.lua` supports the Week 4 decks' visible source-footnote workflow.
- `.github/workflows/publish.yml` renders and publishes the site after each push to `main`.

## Local workflow

Preview during development:

```bash
quarto preview
```

Before publishing a substantial change, render the complete site:

```bash
quarto render
```

Then commit and push:

```bash
git add .
git commit -m "Update lecture slides"
git push
```

For a focused change, use a descriptive commit message such as `Update habitat selection lecture` or `Add lecture 08 slides`.

## GitHub Pages publication

This repository has already completed its initial GitHub Pages publication. Subsequent pushes to `main` trigger the **Quarto Publish** GitHub Action automatically.

For a new course-slide repository, create an empty GitHub repository, push `main`, then enable **Settings → Actions → General → Workflow permissions → Read and write permissions**. Run `quarto publish gh-pages` once to initialize the publishing destination before relying on the Action.

For a repository named `nres315-slides` owned by `USERNAME`, the site URL will be approximately:

```text
https://USERNAME.github.io/nres315-slides/
```

The first lecture’s stable Canvas URL will be approximately:

```text
https://USERNAME.github.io/nres315-slides/slides/01-course-launch.html
```

Once a lecture is linked from Canvas, keep its filename unchanged. Editing the contents does not change its URL; renaming the file does.

## Adding a new lecture

Start with a recently released deck:

```bash
cp slides/07-implementation-learning.qmd slides/08-new-topic.qmd
```

Then:

1. Edit the YAML metadata and replace the copied slide content.
2. Add public images or figures under `assets/` with descriptive filenames.
3. Include alternative text for instructional images and avoid relying on color alone.
4. Preview locally with `quarto preview`.
5. Add the lecture link to `index.qmd` only when it is ready for students.
6. Render, commit, and push.

Future lecture files can remain in `slides/` without appearing in the course directory until their links are deliberately added to `index.qmd`.

The released website sources are the files in this repository’s `slides/` directory. If you also retain working copies elsewhere, update them deliberately rather than assuming the copies will synchronize automatically.

## Accessibility and PDF behavior

HTML is the primary format. Keep titles unique, text large enough for projection, images described, tables small, and navigation usable by keyboard and browser zoom. Reveal.js speaker notes remain available to the instructor and do not appear on the projected slide.

The presentations remain compatible with Reveal.js printing and `?print-pdf`. Do not treat a generated PDF as the primary accessible version unless it has separately passed a tagged-PDF and reading-order review.

## Semester archives

At the end of an offering, preserve its state with a Git tag:

```bash
git tag fall-2026
git push origin fall-2026
```

Continue updating `main` for later offerings. Tags such as `spring-2027` and `fall-2027` preserve prior versions without creating a new repository every semester.
