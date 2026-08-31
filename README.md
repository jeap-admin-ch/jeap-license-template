# jeap-license-template

A [FreeMarker](https://freemarker.apache.org/) template for the
[`license-maven-plugin`](https://www.mojohaus.org/license-maven-plugin/) that renders the third-party
dependencies of a Maven build into a Markdown file (`THIRD-PARTY-LICENSES.md`).

- Groups dependencies by license type
- Formatted as Markdown, so it renders on the repository host and the jEAP documentation site
- Omits version numbers, so the file does not churn when a branch switches between snapshot and
  release version schemes — version information lives in the `pom.xml`

## Documentation

| Topic | File |
|---|---|
| Add the template to a build (jEAP parent or standalone) | [docs/getting-started.md](docs/getting-started.md) |
| Generated file format, design decisions, customizing | [docs/template-and-output.md](docs/template-and-output.md) |

Quick start — declare the template as a plugin dependency and point `fileTemplate` at it:

```xml
<plugin>
    <groupId>org.codehaus.mojo</groupId>
    <artifactId>license-maven-plugin</artifactId>
    <dependencies>
        <dependency>
            <groupId>ch.admin.bit.jeap</groupId>
            <artifactId>jeap-license-template</artifactId>
            <version>${jeap-license-template.version}</version>
        </dependency>
    </dependencies>
    <configuration>
        <fileTemplate>/ch/admin/bit/jeap/third-party.md.ftl</fileTemplate>
        <!-- ... -->
    </configuration>
</plugin>
```

Projects that inherit the jEAP Maven parent already have this wired up — see
[Getting started](docs/getting-started.md).

## Changelog

This library is versioned using [Semantic Versioning](http://semver.org/) and all changes are documented in
[CHANGELOG.md](./CHANGELOG.md) following the format defined in [Keep a Changelog](http://keepachangelog.com/).

## Note

This repository is part the open source distribution of jEAP. See [github.com/jeap-admin-ch/jeap](https://github.com/jeap-admin-ch/jeap)
for more information.

## License

This repository is Open Source Software licensed under the [Apache License 2.0](./LICENSE).
