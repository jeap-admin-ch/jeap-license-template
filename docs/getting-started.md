# Getting started

`jeap-license-template` is a [FreeMarker](https://freemarker.apache.org/) template for the
[`license-maven-plugin`](https://www.mojohaus.org/license-maven-plugin/) (`org.codehaus.mojo`). The
plugin's `add-third-party` / `aggregate-add-third-party` goals render this template into a Markdown
file — by convention `THIRD-PARTY-LICENSES.md` at the repository root — that lists the third-party
dependencies of a build grouped by license.

See [Template and output](template-and-output.md) for the format of the generated file and how to
customize it.

## Coordinates

| | |
|---|---|
| Group / artifact | `ch.admin.bit.jeap:jeap-license-template` |
| Template path in the jar | `/ch/admin/bit/jeap/third-party.md.ftl` |
| Availability | Maven Central (since 1.0.3) |

## In a jEAP project (nothing to configure)

Projects that inherit the jEAP Maven parent
([`jeap-spring-boot-parent`](https://jeap-admin-ch.github.io/docs/building-blocks/spring-boot-starters/jeap-spring-boot-parent/)
→ `jeap-internal-spring-boot-parent`) already have `license-maven-plugin` configured with
`jeap-license-template` as a plugin dependency and `fileTemplate` pointing at
`/ch/admin/bit/jeap/third-party.md.ftl`. To activate it in a module, add the plugin to the build with
no further configuration:

```xml
<build>
  <plugins>
    <plugin>
      <groupId>org.codehaus.mojo</groupId>
      <artifactId>license-maven-plugin</artifactId>
    </plugin>
  </plugins>
</build>
```

`THIRD-PARTY-LICENSES.md` is then (re)generated at the repository root during the build
(`./mvnw verify`).

## Standalone (without the jEAP parent)

Add the `license-maven-plugin` and declare `jeap-license-template` as a **plugin dependency**, then
point `fileTemplate` at the template path:

```xml
<plugin>
  <groupId>org.codehaus.mojo</groupId>
  <artifactId>license-maven-plugin</artifactId>
  <version><!-- a current license-maven-plugin version --></version>
  <dependencies>
    <dependency>
      <groupId>ch.admin.bit.jeap</groupId>
      <artifactId>jeap-license-template</artifactId>
      <version><!-- a current jeap-license-template version --></version>
    </dependency>
  </dependencies>
  <executions>
    <execution>
      <id>add-third-party</id>
      <goals>
        <goal>add-third-party</goal>
      </goals>
      <configuration>
        <fileTemplate>/ch/admin/bit/jeap/third-party.md.ftl</fileTemplate>
        <outputDirectory>${project.basedir}</outputDirectory>
        <thirdPartyFilename>THIRD-PARTY-LICENSES.md</thirdPartyFilename>
      </configuration>
    </execution>
  </executions>
</plugin>
```

The `add-third-party` goal binds to the `generate-resources` phase by default, so a normal build
regenerates the file. This repository's own [`pom.xml`](../pom.xml) uses exactly this setup to test
the template on every build.

For a multi-module build, use the `aggregate-add-third-party` goal on the aggregator instead, so a
single file covers all modules.

## Related

- [jeap-license-template](../README.md) — what this repository is.
- [Template and output](template-and-output.md) — the generated file and how to customize it.
