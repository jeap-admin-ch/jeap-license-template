# AGENTS.md

Guidance for AI coding agents working **in this repository**. For how to *use* the template in a
consuming build, read [README.md](README.md) and the [docs/](docs/) folder instead.

## Project

`jeap-license-template` is a single-module Maven project whose only real artifact is one
[FreeMarker](https://freemarker.apache.org/) file:

```
src/main/resources/ch/admin/bit/jeap/third-party.md.ftl   # the template
pom.xml                                                   # builds the jar; also runs the template against itself as a test
THIRD-PARTY-LICENSES.md                                   # generated output of running the template on this repo (checked in)
docs/                                                     # published on jeap-admin-ch.github.io
Jenkinsfile, publiccode.yml, CHANGELOG.md, LICENSE
```

The template is consumed by the [`license-maven-plugin`](https://www.mojohaus.org/license-maven-plugin/)
(`org.codehaus.mojo`): its `add-third-party` / `aggregate-add-third-party` goals render the template
into a Markdown file listing a build's third-party dependencies grouped by license, without version
numbers.

## Build & test

```bash
./mvnw verify        # builds the jar and runs license-maven-plugin's add-third-party against this repo
./mvnw install       # build and install locally
```

- This repo has **no Maven parent** — it configures `license-maven-plugin` itself in `pom.xml` (with
  `fileTemplate`, `outputDirectory=${project.basedir}`, `thirdPartyFilename=THIRD-PARTY-LICENSES.md`),
  so every build re-renders `THIRD-PARTY-LICENSES.md` and thereby exercises the template.
- There is no test framework and no Java source — a template change is verified by inspecting the
  regenerated `THIRD-PARTY-LICENSES.md`.

## Conventions

- The template must stay **valid Markdown** and render correctly both on the repository host and in
  Docusaurus (jEAP documentation site).
- **Do not add version numbers** to dependency lines — that is a deliberate design decision
  (see [docs/template-and-output.md](docs/template-and-output.md)); the header links to `pom.xml` for
  versions.
- License-name normalization (merging the many spellings of e.g. "Apache 2.0") is done via
  `licenseMerges` on `license-maven-plugin` in the **consuming** build (the jEAP parent ships a set),
  not in this template.
- When changing the rendered output, update [docs/template-and-output.md](docs/template-and-output.md)
  and, if the usage changes, [docs/getting-started.md](docs/getting-started.md).

## Docs

`docs/` is aggregated into the jEAP documentation site
([jeap-admin-ch.github.io](https://jeap-admin-ch.github.io)) — this repo appears under
*App Building Blocks → Tooling & Registries*, with `README.md` as the section landing page. Keep
`docs/getting-started.md` as the entry point (the site pins it first). To validate the Markdown/MDX
locally, build the site from the `jeap-admin-ch.github.io` repo with
`./preview.sh --local <path-to-this-repo> --no-autodiscover` (or `./dev.sh` for a fast hot-reload
check) — there is no standalone linter.

## Versioning

- Semantic Versioning; all changes documented in [CHANGELOG.md](./CHANGELOG.md) (Keep a Changelog format).
- This repository has no child modules; bump the project `<version>` in `pom.xml` directly.
- When working on a feature branch, use `x.y.z-SNAPSHOT` in the POM. Always keep the `-SNAPSHOT`
  postfix in the POM; CI removes it when releasing. Do not use the SNAPSHOT postfix elsewhere
  (CHANGELOG, publiccode.yml).
- Keep changelog entries concise and follow existing patterns.
- Keep commit messages short, use the JIRA ID from the branch name as a prefix, do not use
  conventional commits (for example: "JEAP-1234 Added feature X").
- When bumping the version, also update the changelog and update version/date in `publiccode.yml`.
