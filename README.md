# jeap-license-template

Third-party license list file template for the Maven License Plugin

 - Lists dependencies by license
 - Is formatted using markdown
 - Does not include version numbers in the list to avoid changing contents after merging from a snapshot-versioned
   branch to a branch that is using a non-snapshot numbering scheme. Version number information is available in the
   Maven POM file.


## Usage

Add the license template to the maven license plugin configuration in the POM file:

```xml
<plugin>
    <groupId>org.codehaus.mojo</groupId>
    <artifactId>license-maven-plugin</artifactId>
    <version>${license-maven-plugin.version}</version>
    <dependencies>
        <dependency>
            <groupId>org.jeap.dev</groupId>
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

## Changelog

This library is versioned using [Semantic Versioning](http://semver.org/) and all changes are documented in
[CHANGELOG.md](./CHANGELOG.md) following the format defined in [Keep a Changelog](http://keepachangelog.com/).

## Note

This repository is part the open source distribution of jEAP. See [github.com/jeap-admin-ch/jeap](https://github.com/jeap-admin-ch/jeap)
for more information.

## License

This repository is Open Source Software licensed under the [Apache License 2.0](./LICENSE).
