# Template and output

## Generated file

The template renders a Markdown document titled **Third-Party Dependency Licenses**. Dependencies are
grouped under a heading per license type; within each group every dependency is one list item.

When the build has no third-party dependencies the body is a single sentence
(`This project is not using any third-party dependencies.`).

Otherwise each dependency line has one of three shapes, chosen by the `dependencyLine` macro from the
metadata the plugin resolved for that dependency:

- **name and URL** — the dependency name, a dash, then a Markdown link whose text is
  `groupId:artifactId` and whose target is the project URL.
- **name, no URL** — the dependency name, a dash, then a bare `groupId:artifactId`.
- **no name** (the plugin reports it as `Unnamed …`) — the `artifactId`, then
  `groupId:artifactId` and the URL (or the literal `no url provided`) in parentheses.

Example (first shape):

```markdown
Third-Party Dependency Licenses
===============================

Third-party dependencies grouped by their license type (see [pom.xml](/pom.xml) for version information):


Apache License Version 2.0
-------------------------------

 * Jackson-core - [com.fasterxml.jackson.core:jackson-core](https://github.com/FasterXML/jackson-core)
```

## Design decisions

- **No version numbers.** Versions change when a branch moves from a `-SNAPSHOT` numbering scheme to a
  release scheme, which would otherwise produce noisy diffs in the generated file on every merge. The
  authoritative version information is the `pom.xml`, which the header links to.
- **Markdown, not plain text.** The file renders directly on the repository host and on the jEAP
  documentation site.
- **License grouping.** Reading the file answers "which licenses does this build pull in" at a glance.
  Normalizing license spellings (e.g. the many spellings of "Apache 2.0") is the job of the
  `licenseMerges` configuration on `license-maven-plugin`, not of this template — the jEAP parent
  ships a set of merges.

## Template internals

The template is a single FreeMarker file, `src/main/resources/ch/admin/bit/jeap/third-party.md.ftl`.
It receives the standard `license-maven-plugin` data model, of which it uses:

- `licenseMap` — an ordered map of *license name → list of dependency objects*.
- each dependency object's `name`, `groupId`, `artifactId` and (optional) `url`.

The `dependencyLine` macro at the top of the file decides which of the three line shapes above to
emit.

## Customizing

The template is intentionally small. To change the output:

- **Different formatting for all jEAP projects** — change the template here and release a new version;
  consuming builds pick it up via the `jeap-license-template` plugin-dependency version (managed by
  the jEAP parent).
- **One-off, project-local formatting** — put your own `.ftl` file under
  `src/license/` (or any path) in your project and point `fileTemplate` at it instead; you then do
  not need `jeap-license-template` as a plugin dependency at all.

## Related

- [Getting started](getting-started.md) — adding the template to a build.
- [jeap-license-template](../README.md)
