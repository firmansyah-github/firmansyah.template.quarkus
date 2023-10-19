<#-- 
${PRV_SYS_GEN_PATH|src/main/resources/META-INF/resources/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|index.html|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_ART|realworldapiservice|Description}
${PUB_APP_VER|1.0-SNAPSHOT|Description}
${PUB_APP_GROUP|org.example|Description}
-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${PUB_APP_ART} - ${PUB_APP_VER}</title>
    <style>
        h1, h2, h3, h4, h5, h6 {
            margin-bottom: 0.5rem;
            font-weight: 400;
            line-height: 1.5;
        }

        h1 {
            font-size: 2.5rem;
        }

        h2 {
            font-size: 2rem
        }

        h3 {
            font-size: 1.75rem
        }

        h4 {
            font-size: 1.5rem
        }

        h5 {
            font-size: 1.25rem
        }

        h6 {
            font-size: 1rem
        }

        .lead {
            font-weight: 300;
            font-size: 2rem;
        }

        .banner {
            font-size: 2.7rem;
            margin: 0;
            padding: 2rem 1rem;
            background-color: #00A1E2;
            color: white;
        }

        body {
            margin: 0;
            font-family: -apple-system, system-ui, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
        }

        code {
            font-family: SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
            font-size: 87.5%;
            color: #e83e8c;
            word-break: break-word;
        }

        .left-column {
            padding: .75rem;
            max-width: 75%;
            min-width: 55%;
        }

        .right-column {
            padding: .75rem;
            max-width: 25%;
        }

        .container {
            display: flex;
            width: 100%;
        }

        li {
            margin: 0.75rem;
        }

        .right-section {
            margin-left: 1rem;
            padding-left: 0.5rem;
        }

        .right-section h3 {
            padding-top: 0;
            font-weight: 200;
        }

        .right-section ul {
            border-left: 0.3rem solid #00A1E2;
            list-style-type: none;
            padding-left: 0;
        }

    </style>
</head>
<body>

<div class="banner lead">
    Your new Cloud-Native application is ready!
</div>

<div class="container">
    <div class="left-column">
        <p class="lead"> Congratulations, you have created a new Quarkus application.</p>

        <h2>Why do you see this?</h2>

        <p>This page is served by Quarkus. The source is in
            <code>src/main/resources/META-INF/resources/index.html</code>.</p>

        <h2>What can I do from here?</h2>

        <p>If not already done, run the application in <em>dev mode</em> using: <code>mvn compile quarkus:dev</code>.
        </p>
        <ul>
            <li>Add REST resources, Servlets, functions and other services in <code>src/main/java</code>.</li>
            <li>Your static assets are located in <code>src/main/resources/META-INF/resources</code>.</li>
            <li>Configure your application in <code>src/main/resources/application.properties</code>.
            </li>
        </ul>

        <h2>How do I get rid of this page?</h2>
        <p>Just delete the <code>src/main/resources/META-INF/resources/index.html</code> file.</p>
    </div>
    <div class="right-column">
        <div class="right-section">
            <h3>Application</h3>
            <ul>
                <li>GroupId: ${PUB_APP_GROUP}</li>
                <li>ArtifactId: ${PUB_APP_ART}</li>
                <li>Version: ${PUB_APP_VER}</li>
                <li>Quarkus Version: 0.21.1</li>
            </ul>
        </div>
        <div class="right-section">
            <h3>Next steps</h3>
            <ul>
                <li><a href="https://quarkus.io/guides/maven-tooling.html">Setup your IDE</a></li>
                <li><a href="https://quarkus.io/guides/getting-started-guide.html">Getting started</a></li>
                <li><a href="https://quarkus.io">Quarkus Web Site</a></li>
            </ul>
        </div>
    </div>
</div>


</body>
</html>
