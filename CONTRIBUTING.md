# Contributing to FHV-Latex

Thank you for your interest in contributing to this project!

---

## Getting Started

1. Fork the repository
2. Clone your fork:
   ```
   git clone --recurse-submodules https://github.com/<your-username>/FHV-Latex.git
   ```
3. Create a feature branch from `main`:
   ```
   git checkout main
   git pull
   git checkout -b feature/your-feature
   ```

---

## Commit Message Convention

We follow [Conventional Commits v1.0.0](https://www.conventionalcommits.org).
For general commit message best practices, see [cbea.ms/git-commit](https://cbea.ms/git-commit/) and [this summary](https://gist.github.com/robertpainsi/b632364184e70900af4ab688decf6f53).

### Seven Golden Rules for Commits
1. Separate subject from body with a blank line
2. Limit the subject line to 72 characters
3. Capitalize the subject line; do not end with a period
4. Use the imperative mood: *"Add feature"* not *"Added feature"*
5. Wrap body lines at 72 characters
6. Explain *what* and *why* you changed something, not *how* (the diff shows that)
7. When needed, use bullet points with hanging indents for lists

### Format

```
<type>[optional scope]: <description>

[Body — explain what and why, not how]

[Footer — optional metadata]
Resolves: #42
See also: #10
```

Use lowercase after the type prefix. Limit the subject line to 72 characters. Use imperative mood (*"add"* not *"added"*).

### Types

| Type | Usage |
|------|-------|
| `feat` | New feature or functionality |
| `fix` | Bug fix |
| `docs` | Documentation only |
| `style` | Formatting (no code behavior change) |
| `refactor` | Code restructuring (no behavior change) |
| `test` | Tests added or modified |
| `ci` | CI/CD configuration |
| `chore` | Maintenance tasks, dependency updates |

### Example

```
fix(beamer): handle hyperref option clash with babel in TeX Live 2026

hyperref={breaklinks=true} in \def\documentclassOptions caused babel
to crash during macro expansion in babel v26.5. Moved the option to
\hypersetup to avoid the conflict.
```

---

## Branch Naming

| Prefix | Usage |
|--------|-------|
| `feature/` | New feature |
| `fix/` | Bug fix |
| `docs/` | Documentation |
| `refactor/` | Code restructuring |

### Branch Rules

- `main` is protected: no direct push, no force push, changes only via PR
- Feature branches: force push allowed only when PR is in draft

---

## Clean History

Use **rebase** (not merge) to keep your branch up to date:

```bash
git fetch origin
git rebase origin/main
```

Before marking your PR as ready, clean up your commits:

```bash
git rebase -i origin/main    # squash fixup/review commits
git push --force-with-lease --force-if-includes
```

**Merge strategy:** atomic features → squash merge; complex features with multiple meaningful commits → rebase cleanup + merge commit. Whoever merges is responsible for clean history.

---

## Building

All 8 build variants must pass before a PR can be merged:

```
make clean && make FHVMODE=<mode> LANGUAGE=<language> [FHVTITLEPAGE=<titlepage>]
```

| Mode | Language | Titlepage | Description |
|------|----------|-----------|-------------|
| 1 | ngerman | | Documentation |
| 2 | ngerman | | Thesis (default) |
| 2 | english | | Thesis (english) |
| 2 | ngerman | fhv | Thesis (FHV titlepage) |
| 2 | english | fhv | Thesis (FHV titlepage, english) |
| 3 | ngerman | | Summary |
| 5 | ngerman | | Presentation (beamer) |
| 9 | ngerman | | Paper |

### Testing with Docker

To test against the same TeX Live version used in CI:

```bash
docker run --rm -v "$(pwd):/work" -w /work texlive/texlive:latest bash -c \
  'make clean && make FHVMODE=5 LANGUAGE=ngerman'
```

---

## Beamer Mode (FHVMODE=5)

The beamer document class has specific constraints — **test it explicitly**:

- **Do not define commands that conflict with beamer builtins** (e.g. `\note`, `\pause`, `\alert`). Use unique names instead
- **Do not pass `hyperref={...}` in `\documentclassOptions`** — beamer loads hyperref internally. Use `\hypersetup{...}` instead
- **`scrhack` is not loaded for beamer** since `tocbasic` is unavailable
- **`\usepackage{hyperref}` is skipped for beamer** — use `\hypersetup` to configure it

---

## Pull Requests

- One logical change per PR — one commit per atomic change
- **All 8 build variants must pass**
- Do not rename existing public commands without a compelling reason

### PR Description

The PR body should answer:

- **What** — what does this PR change?
- **Why** — what is the motivation or problem being solved?
- **How** — how was it tested? Which build variants were verified?

### Review Checklist

- [ ] All 8 build variants pass
- [ ] Commit messages follow Conventional Commits
- [ ] One topic per commit (atomic)
- [ ] No unnecessary changes (whitespace, reformatting)

---

## Code Style

- Use `%` comments to explain non-obvious LaTeX logic
- Keep package loading order intentional — `fontenc` and `inputenc` must be loaded before `babel`
- Use `\ifthenelse` for conditionals (or TeX primitives `\if...\fi` where `ifthen` is not yet loaded)

---

## Do's and Don'ts

**Do:**
- Small, atomic commits
- Meaningful descriptions
- Always keep all build variants green
- Test FHVMODE=5 (beamer) explicitly

**Don't:**
- Force push on `main`
- Mix multiple topics in one commit
- Empty or generic messages ("fix stuff")
- Bundle unrelated changes in one PR
