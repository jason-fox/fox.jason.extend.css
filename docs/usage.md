<h1>Usage</h1>

Run any HTML dita transform e.g.:

```console
PATH_TO_DITA_OT/bin/dita -f html5 -o out -i document.ditamap
```

Each HTML output file will include an additional line in the `<head>`

```html
<head>
    ...
    <link rel="stylesheet" type="text/css" href="common-extended.css">
</head>
```

The file `common-extended.css` will include any CSS added via the extension points described below.

## Extension points

CSS rules are always position dependent - the rule defined last in a file will
supercede previous definitions. This plug-in is  offers three extension points where CSS can be appended to a file so that CSS rules can be added in order.

-   `extend.css.process.pre` - Runs an additional Ant target before the extended css processing stage.

-   `extend.css.process` - Runs an additional Ant target as part of the extended css processing stage.

-   `extend.css.process.post` - Runs an additional Ant target after the extended css processing.



### Example

The following `plugin.xml` will invoke an extension point and append additional CSS to `extend.css.file` which is copied to the output

<h4><code>plugin.xml</code> Configuration</h4>

```xml
<plugin id="com.example.extended.css">
  <feature extension="ant.import" file="build.xml"/>
  <require plugin="fox.jason.extend.css"/>
  <feature extension="extend.css.process" value="example.css.copy"/>
</plugin>
```

<h4> ANT build file: <code>build.xml</code></h4>

```xml
<project name="com.example.extended.css">
  <target name="example.css.copy">
    <loadfile property="extra.css" srcFile="/path/to/css"/>
    <echo append="true" message="${line.separator}${extra.css}" file="${extend.css.file}"/>
  </target>
</project>
```

Working examples can be found in the [DITA-OT Swagger plug-in](http://swaggerdita-ot.rtfd.io/) and [DITA-OT Prism-JS plug-in](https://prismjsdita-ot.rtfd.io/)
repositories.
