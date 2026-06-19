# Hyun Seok ("Huck") Lee faculty homepage

This repository contains the source for Hyun Seok ("Huck") Lee's faculty homepage. The live site is published at <https://lordya2.github.io> from the `master` branch using GitHub Pages.

The site is a Jekyll/GitHub Pages site. Most homepage content is data-driven: Markdown pages and Liquid templates read structured YAML files from `_data/`, then render the English and Korean pages, research pages, people pages, media pages, teaching pages, and other sections.

## Repository structure

- `_config.yml` — Jekyll configuration, site title/author metadata, production URL, Markdown settings, excludes, and optional analytics/search verification settings.
- `index.md` — English homepage entry point. It uses Liquid includes/layouts and `_data/` content to render the main faculty homepage.
- `ko/index.md` — Korean homepage entry point. Preserve Korean wording when editing localized content.
- `pages/` — Secondary Markdown pages for news, research, media, people, teaching, awards, and related static files.
- `_data/` — Structured YAML content used by pages and templates. Prefer editing these files for content updates instead of changing layouts.
- `_data/profile.yml` — Profile, contact, appointment, CV/headshot, external profiles, SEO/social, and navigation-related profile content.
- `_data/publications.yml` — Publications and working papers. Publication IDs are used by other data files, so keep them stable.
- `_data/research_themes.yml` — Featured research themes and ordering; representative papers reference publication IDs.
- `_data/media_impact.yml` — Media coverage, external impact links, and related labels/URLs.
- `_data/news.yml` — News items displayed by the site.
- `_data/people.yml` — Students, collaborators, alumni, placements, and related people content.
- `_data/teaching.yml` — Teaching entries and course information.
- `_data/awards_service.yml` — Awards, honors, service, and professional activities.
- `_data/opportunities.yml` — Student/research opportunity text and calls to action.
- `_includes/` — Reusable Liquid partials for analytics, structured data, and theme/page fragments.
- `_layouts/` — Jekyll layout templates that wrap pages and posts.
- `assets/` — Static files such as `CV.pdf`, `headshot.jpg`, favicon, theme CSS, and other downloadable or visual assets.
- `scripts/` — Ruby validation scripts for YAML, publications, Liquid balance, and links.
- `.github/workflows/site-checks.yml` — GitHub Actions workflow that validates and builds the site on pull requests and pushes to `master`.

## Common updates

- **Update profile/contact information:** edit `_data/profile.yml`. Check names, titles, email, office/contact fields, external profile links, SEO text, and any localized Korean/English wording.
- **Replace the CV:** replace `assets/CV.pdf` with the new PDF using the same path unless you also update every reference in `_data/profile.yml` or the pages that link to it.
- **Replace the headshot:** replace `assets/headshot.jpg` with the new image using the same path unless you also update the headshot path in `_data/profile.yml`.
- **Add a new publication:** add a new entry to `_data/publications.yml` with a stable, unique `id`, complete bibliographic fields, and any external links with both `label` and `url`.
- **Change featured research order:** edit `_data/research_themes.yml` for theme ordering and representative papers. For featured publications, edit `_data/publications.yml` so featured items use `featured: true` and unique `featured_order` values.
- **Add a working paper:** add it to `_data/publications.yml` in the working-paper area/metadata used by the existing file, and include a stable publication ID.
- **Add media coverage:** edit `_data/media_impact.yml`. Use the original article title, source, date, and link label/URL rather than generic placeholders.
- **Add news:** edit `_data/news.yml` and follow the existing date/title/description pattern.
- **Update people or student placements:** edit `_data/people.yml` and preserve current grouping and placement wording.
- **Update teaching:** edit `_data/teaching.yml` for courses, terms, descriptions, and links.
- **Update awards and service:** edit `_data/awards_service.yml` for honors, grants, editorial work, reviewing, conference service, and similar items.
- **Change navigation:** edit the navigation/profile fields in `_data/profile.yml` and, if needed, `_data/navigation.yml`. Avoid layout changes unless a navigation item cannot be represented in data.

## Validation and checks

Run these checks before opening a pull request:

```bash
ruby scripts/validate_yaml.rb
ruby scripts/validate_publications.rb
ruby scripts/check_liquid_balance.rb
bundle exec jekyll build --trace
ruby scripts/check_internal_links.rb
ruby scripts/check_external_links.rb || true
git diff --check
```

YAML validation, publication validation, Liquid delimiter balance, the Jekyll build, internal link checks, and whitespace checks are blocking checks. Fix failures before merging. External link checks are warning-only because publishers, journals, universities, and news sites may block automated bots even when links work in a browser.

GitHub Actions runs the site checks on pull requests and on pushes to `master` through `.github/workflows/site-checks.yml`.

## Data conventions

- Publication IDs in `_data/publications.yml` should be stable and unique. Do not rename IDs unless you also update every reference to them.
- `representative_papers` in `_data/research_themes.yml` must reference publication IDs from `_data/publications.yml`.
- Featured publications need `featured: true` and unique `featured_order` values.
- External links should include both `label` and `url`.
- Media entries should use original article titles, not generic placeholders such as "media article" or "news story."
- Preserve Korean and English wording where applicable, especially in `ko/index.md` and bilingual YAML fields.
- Avoid editing generated `_site` files. They are build output, not source content.
- Do not commit `vendor/bundle`, `.bundle`, `_site`, or other local build output.

## Deployment notes

The site is served by GitHub Pages, with `master` as the publishing branch. Changes should usually be made on feature branches and reviewed through pull requests before merging to `master`. After a pull request is merged, GitHub Pages may take a short time to rebuild and publish the updated site.

## Suggested Codex workflow

- Create one small pull request per task.
- Keep data/content changes separate from layout, template, SEO, analytics, or refactor changes.
- Run the site checks listed above before opening a pull request.
- Do not merge until required checks are green.
- Prefer conservative changes for layout, analytics, structured data, and SEO metadata.

## License and attribution

Earlier versions of this site were based on academic website tutorials by Marisa Carlos and Karl Broman. Site content owned by the repository owner is licensed under [CC BY 3.0](http://creativecommons.org/licenses/by/3.0/) unless otherwise noted.
