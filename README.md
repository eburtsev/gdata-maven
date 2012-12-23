maven.burtsev.net Maven Repository
==================================

About
-----

This repository contains following artifacts:  
 * google gdata libraries (more information can be found in [My Blog](http://burtsev.net/en/2012/01/29/149/))
 * My version of cloudhub-client-api library with some improvements ([sources](https://github.com/eburtsev/ion-client-api))
 * Eugene Burtsev's java libraries

How to use
----------
Just include following code to your ```pom.xml```:
```
<repositories>
  <repository>
      <id>burtsev-net-maven</id>
      <name>Burtsev.Net Maven Repository</name>
      <url>http://maven.burtsev.net</url>
  </repository>
</repositories>
```
Or you can use direct link to github:
```
<repositories>
  <repository>
      <id>gdata-maven-github</id>
      <name>Google Gdata Maven Repository</name>
      <url>https://raw.github.com/eburtsev/gdata-maven/master/</url>
  </repository>
</repositories>
```
But first way is preffered, because maven.burtsev.net uses github pages service to host files.
