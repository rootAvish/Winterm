##Cmder for windows power users.
This is a fork of user @dufferzafar's [Cmder](https://github.com/dufferzafar/Cmder) , won't show as a fork since i just copied the files onto my computer.

originally a fork of the awesome [Cmder](https://github.com/bliker/cmder/) project by bliker .

The original didn't seem to work so well for me , due to its heavy reliance on AutoHotkey( which as of february 2014 is not perfected on windows 8).

The new AHK launcher script does seem to work fine on windows 8.1 .

I've retained the "msysgit", "gow", "putty", "vim" packages (in the vendor folder).Credit for integrating them into the package goes to @dufferzafar  of course .

See the ".gitignore" file for the entire structure.

## Notes and Tips

Please download AHK from [here:]( http://ahkscript.org/download/ahk-install.exe), on older versions this script won't work. Also please note that a **lot** of paths are hardcoded. Please alter the init.bat script in the vendor folder and the AHK based launcher script.

## Table of Contents

* [What has been changed?](#changelog)
* [Stuff to do](#todo)
* [License](#license)

## <a name="changelog"></a>Things changed
* See the commit history(the git log) for a changelog.

## <a name="todo"></a>Todo

* ~~Try to decrease reliance on AHK .~~ Screw this, there is nothing better than AHK when it comes to Windows.
* Provide easy switching between the xterm and monokai color schemes.

##<a name="license"></a>LICENSE

All software included is bundled with own license

The MIT License (MIT)

Copyright (c) 2014 Avishkar Gupta

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
