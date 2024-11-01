<#function dependencyLine p>
    <#if p.name?index_of('Unnamed') &gt; -1>
        <#return p.artifactId + " (" + p.groupId + ":" + p.artifactId + " - " + (p.url!"no url provided") + ")">
    <#elseif p.url??>
        <#return p.name + " - [" + p.groupId + ":" + p.artifactId + "](" + p.url + ")">
    <#else>
        <#return p.name + " - " + p.groupId + ":" + p.artifactId>
    </#if>
</#function>

Third-Party Dependency Licenses
===============================

<#if licenseMap?size == 0>
This project is not using any third-party dependencies.
<#else>
Third-party dependencies grouped by their license type (see [pom.xml](/pom.xml) for version information):

    <#list licenseMap as e>
        <#assign licenseName = e.getKey()/>
        <#assign dependencies = e.getValue()/>
        <#if dependencies?size &gt; 0>

${licenseName}:
-------------------------------

            <#list dependencies as dependency>
 * ${dependencyLine(dependency)}
            </#list>
        </#if>
    </#list>
</#if>
