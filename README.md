# CIU - Práctica 4

Autor: Héctor Miguel Martín Álvarez

## Introducción

Representación de un sistema planetario y simulación de una nave en Processing

## Desarrollo

El proyecto ha sido desarrollado empleando 6 ficheros: 
  - <b>CIU_4</b> </br><p>Fichero principal en el que se crean la estrella, los planetas y los satélites, se cargan las texturas de la estrella, los planetas, los satélites y el fondo, se implementan los eventos de teclado y ademas se implementan las 2 cámaras distintas que se emplean en la aplicación haciendo uso de la cámara integrada en el propio processing</p>
  - <b>AstronomicalObject</b> </br><p>Fichero que define una clase abstracta que representa cualquier objeto astronómico.</p>
  - <b>Star</b> </br><p>Fichero que define una clase que extiende de AstronomicalObject que representa una estrella y se utiliza para la creación de la estrella que se encuentra en el sistema solar.</p>
  - <b>Planet</b> </br><p>Fichero que define una clase que extiende de AstronomicalObject que representa un planeta y se utiliza para la creación de todos planetas del sistema solar.</p>
  - <b>Satellite</b> </br><p>Fichero que define una clase que extiende de AstronomicalObject que representa un satélite y se utiliza para la creación de los satélites de planetas del sistema solar.</p>
  - <b>SpaceShip</b> </br><p>Fichero que define una clase que representa una nave espacial.</p>

## Características

  - <b>Vista General del Sistema Solar.</b> </br> <p> Vista general simple que permite observar todo el sistema solar desde una posición fija.</p>
  - <b>Modo Nave.</b> </br> <p> El modo nave permite navegar por todo el sistema solar sin restricciones simulando el movimiento de una nave en 3 dimensiones.</p>

## Controles

|Tecla|Descripción|Disponible en Vista General|Disponible en Modo Nave|Inercia|
|:---:|:----------|:-------------------------:|:---------------------:|:-----:|
|W|Desplazarse hacia delante||X|X|
|A|Desplazarse hacia la izquierda||X|X|
|S|Desplazarse hacia atrás||X|X|
|D|Desplazarse hacia la derecha||X|X|
|Q|Rotar hacia la derecha||X||
|E|Rotar hacia la izquierda||X||
|Control|Descender||X||
|Espacio|Ascender||X||
|R|Restablecer posición||X||
|C|Alternar entre Vista General/Modo Nave|X|X||
|ESC|Cierra la Aplicación|X|X||


## Herramientas

  - Processing 3.5.4
  - Blender 3.0.1

## Referencia

  - Material de la asignatura Creando Interfaces de Usuario
  - Documentación de Processing https://processing.org/reference
  - Texturas del sol, todos los planetas, la Luna y el fondo https://www.solarsystemscope.com/textures/
  - Texturas de Fobos y Deimos http://www.planetaryvisions.com
  - "Spaceship macross yf-19" (https://skfb.ly/KU7O) by Aurielle Philippart is licensed under Creative Commons Attribution (http://creativecommons.org/licenses/by/4.0/).

![No Gif Here :(](https://github.com/HectorMartinAlvarez/CIU_4/blob/main/out-min.gif)
