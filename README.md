# NRES 315 course slides

This repository hosts the public HTML lecture slides for **NRES 315: Human Dimensions of Fish and Wildlife Management**. Canvas remains the primary learning-management system for course schedules, assignments, quizzes, grades, announcements, deadlines, and submissions.

The website is intentionally small: it is a stable home for lecture slides and selected public resources. Do not add student information, grades, answer keys, private Canvas material, restricted assessments, unpublished sensitive data, or copyrighted material that cannot be publicly redistributed.

## Structure

- `index.qmd` is the student-facing slide directory. Only lectures linked here are advertised to students.
- `slides/` contains independent Quarto Reveal.js presentations. Use two-digit, lowercase, hyphenated filenames such as `07-habitat-selection.qmd`.
- `assets/images/`, `assets/figures/`, and `assets/logos/` contain shared public assets. Refer to them from a slide with a relative path, for example `![](../assets/images/mallard-habitat-selection.png)`.
- `styles/slides.scss` supplies the shared Reveal.js visual defaults.
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

## First GitHub Pages publication

1. Create an empty GitHub repository for this directory, for example `nres315-slides`.
2. Add the GitHub remote and push the local `main` branch.
3. In GitHub, go to **Settings → Actions → General**.
4. Under **Workflow permissions**, select **Read and write permissions**, then save.
5. From this directory, run:

   ```bash
   quarto publish gh-pages
   ```

   This first publish creates the `gh-pages` destination and updates `_publish.yml` with the target record.

6. Subsequent pushes to `main` trigger the **Quarto Publish** GitHub Action automatically.

For a repository named `nres315-slides` owned by `USERNAME`, the site URL will be approximately:

```text
https://USERNAME.github.io/nres315-slides/
```

The first lecture’s stable Canvas URL will be approximately:

```text
https://USERNAME.github.io/nres315-slides/slides/01-introduction.html
```

Once a lecture is linked from Canvas, keep its filename unchanged. Editing the contents does not change its URL; renaming the file does.

## Adding a new lecture

Start with the example deck:

```bash
cp slides/01-introduction.qmd slides/07-new-topic.qmd
```

Then:

1. Edit the YAML metadata and replace the example slide content.
2. Add public images or figures under `assets/` with descriptive filenames.
3. Include alternative text for instructional images and avoid relying on color alone.
4. Preview locally with `quarto preview`.
5. Add the lecture link to `index.qmd` only when it is ready for students.
6. Render, commit, and push.

Future lecture files can remain in `slides/` without appearing in the course directory until their links are deliberately added to `index.qmd`.

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
