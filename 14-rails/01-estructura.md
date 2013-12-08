!SLIDE bullets transition=uncover
# La estructura del proyecto

## Carpetas y archivos importantes

<table>
  <tr>
    <td>Gemfile</td>
    <td> Lists all the gems used by the application.</td>
  </tr>
  <tr>
    <td>Gemfile.lock</td>
    <td>Lists gem versions and dependencies.</td>
  <tr>
    <td>README.rdoc</td>
    <td>A page for documentation.</td>
  <tr>
    <td>app/</td>
    <td>Application folders and files.</td>
  </tr>
  <tr>
    <td>config/ </td>
    <td>Configuration folders and files.</td>
  </tr>
  <tr>
    <td>db/ </td>
    <td>Database folders and files.</td>
  </tr>
  <tr>
    <td>public/ </td>
    <td>Files for web pages that do not contain Ruby code, such as error
pages.</td>
  </tr>
</table>

!SLIDE smbullets transition=uncover
# La estructura del proyecto
## Carpetas y archivos no tan importantes
No son importantes cuando estamos aprendiendo rails...

<table>
  <tr>
    <td>Rakefile</td>
    <td>Directives for the Rake utility program.</td>
  </tr>
  <tr>
    <td>bin/ </td>
    <td>Folder for binary (executable) programs.</td>
  </tr>
  <tr>
    <td>config.ru </td>
    <td>Configuration file for Rack (a software library for web servers).</td>
  </tr>
  <tr>
    <td>lib/</td> 
    <td>Folder for miscellaneous Ruby code.</td>
  </tr>
  <tr>
    <td>log/ </td>
    <td>Folder for application server logfiles.</td>
  </tr>
  <tr>
    <td>tmp/ </td>
    <td>Temporary files created when your application is running.</td>
  </tr>
  <tr>
    <td>vendor/ </td>
    <td>Folder for Ruby software libraries that are not gems.</td>
  </tr>
</table>

!SLIDE smbullets small transition=uncover
# El directorio `app/`
* Si listamos el contenido del directorio, nos encontramos con seis carpetas que
  estarán presentes en todo proyecto rails:
  * assets
  * **controllers**
  * helpers
  * mailers
  * **models**
  * **views**
* Aquí se hace evidente el patrón *model view controller*
* La carpeta `mailers/` contempla código para el envío de mails
* La carpeta `helpers/` contiene *view helpers*, que son pequeñas porciones de
  código reusable que generan HTML. Podríamos definirnos como macros que
  expanden un pequeño comando en strings más extensos de tags HTML y contenido
* La carpeta `assets/` contiene estilos CSS y Javascripts que son procesados
  por *sprockets*
