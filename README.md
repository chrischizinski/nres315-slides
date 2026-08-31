# NRES 315 course slides

> This is a generated public release. The parent NRES 315 course workspace is
> the only editable source of truth for lectures, shared styling, and released
> assets. Use `python3 scripts/sync_course_slides.py --publish` from that
> workspace; do not edit `slides/`, `styles/`, `assets/`, or `index.qmd` here.

This repository hosts the public HTML lecture slides for **NRES 315: Human Dimensions of Fish and Wildlife Management**. Canvas remains the primary learning-management system for course schedules, assignments, quizzes, grades, announcements, deadlines, and submissions.

The website is intentionally small: it is a stable home for lecture slides and selected public resources. Do not add student information, grades, answer keys, private Canvas material, restricted assessments, unpublished sensitive data, or copyrighted material that cannot be publicly redistributed.

## Structure

- `index.qmd` is the student-facing slide directory. Only lectures linked here are advertised to students.
- `slides/` contains independent Quarto Reveal.js presentations. Use two-digit, lowercase, hyphenated filenames such as `07-habitat-selection.qmd`.
- `assets/` contains shared public images, figures, diagrams, and logos. Refer to them from a slide with a relative path, for example `![](../assets/images/mallard-habitat-selection.png)`.
- `styles/slides.scss` is the shared NRES 315 Reveal.js field-guide stylesheet used by every released deck.
- `source-footer.lua` supports the Week 4 decks' visible source-footnote workflow.
- `.github/workflows/publish.yml` renders and publishes the site after each push to `main`.

## Publication workflow

Edit and preview the canonical lecture in the course workspace. When it is
ready for public release, add it to `course-design/course-slides.toml` and run:

```bash
python3 scripts/sync_course_slides.py --publish
```

That command synchronizes the allowlisted public files, verifies a Quarto
render, commits the generated changes, and pushes them to `main`. The GitHub
Action then publishes the site. The full workflow is documented in the parent
course workspace at `docs/course-slides-sync.md`.

## GitHub Pages publication

This repository has already completed its initial GitHub Pages publication. Subsequent pushes to `main` trigger the **Quarto Publish** GitHub Action automatically.

For a new course-slide repository, create an empty GitHub repository, push `main`, then enable **Settings → Actions → General → Workflow permissions → Read and write permissions**. Run `quarto publish gh-pages` once to initialize the publishing destination before relying on the Action.

The live slide site is [chrischizinski.github.io/nres315-slides](https://chrischizinski.github.io/nres315-slides/).

The first lecture’s stable Canvas URL is [chrischizinski.github.io/nres315-slides/slides/01-course-launch.html](https://chrischizinski.github.io/nres315-slides/slides/01-course-launch.html).

Once a lecture is linked from Canvas, keep its filename unchanged. Editing the contents does not change its URL; renaming the file does.

## Adding a new lecture

Create and develop the lecture under `lectures/` in the course workspace. When
it is ready, add one entry to the appropriate module in
`course-design/course-slides.toml`, choose a permanent two-digit destination
filename, and run the publication command above. Future course lectures remain
private until they are explicitly listed in that manifest.

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
