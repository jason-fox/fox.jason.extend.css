<h1>Extended CSS Plugin for DITA-OT</h1>

This is an abstract base DITA-OT Plug-in to extend HTML processing and allow additional plug-ins to add an extra CSS stylesheet to the `<header>` of each HTML page. By default the plug-in does nothing appart from creating a temporary file `extend.css.file` - it is designed to be extended so other plugins can add CSS to the blank file.

It offers three extension-points for further CSS processing.