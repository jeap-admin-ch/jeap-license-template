jeap-license-template
=====================

Third-party license list file template for the Maven License Plugin

- Lists dependencies by license
- Is formatted using markdown
- Does not include version numbers in the list to avoid changing contents after merging from a snapshot-versioned
  branch to a branch that is using a non-snapshot numbering scheme. Version number information is available in the
  Maven POM file.


Usage
-----

Add the license template to the maven license plugin configuration in the POM file:

```xml
<plugin>
    <groupId>org.codehaus.mojo</groupId>
    <artifactId>license-maven-plugin</artifactId>
    <version>2.4.0</version>
    <dependencies>
        <dependency>
            <groupId>org.jeap.dev</groupId>
            <artifactId>jeap-license-template</artifactId>
            <version>1.0.0</version>
        </dependency>
    </dependencies>
    <configuration>
        <fileTemplate>/org/codehaus/mojo/license/third-party-file-groupByLicense.ftl</fileTemplate>
        <!-- ... -->
    </configuration>
</plugin>
```
