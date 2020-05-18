# Big 2

Networked multiplayer implementation of the card game [Big 2](https://en.wikipedia.org/wiki/Big_two). The game is written in the [Muon programming language](https://github.com/nickmqb/muon), using [SDL](https://www.libsdl.org/) and OpenGL.

[The game rules can be found on Wikipedia](https://en.wikipedia.org/wiki/Big_two).

Platforms: only Windows is supported at the moment; [Linux version is planned](https://github.com/nickmqb/big2/issues/1). If you'd like to help out porting this to Linux/macOS, [let me know](https://github.com/nickmqb/big2/issues/2)!

<img src="https://github.com/nickmqb/big2/blob/master/docs/screenshot_0.png" width="512px">

## Build (Windows)

1. Install the latest version of the [Muon compiler](https://github.com/nickmqb/muon/blob/master/docs/getting_started.md).
2. Download [SDL2](https://www.libsdl.org/download-2.0.php).
3. Clone the big2 repo. Note: `../muon/lib/` is used to refer to the Muon standard libraries (part of the Muon compiler), which should be taken into account when choosing a local path. Alternatively, just edit `big2.args` before building.
4. Copy `SDL2.dll` (from your SDL2 directory, under `lib/x64`) to the root of the big2 repo.
5. Compile, e.g.: `mu --args big2.args && cl /I"`SDL2_path`/include" /Zi big2.c /link kernel32.lib user32.lib gdi32.lib `SDL2_path`/lib/x64/SDL2.lib opengl32.lib dbghelp.lib ws2_32.lib Advapi32.lib` (use any 64-bit C compiler; replace 'SDL2_path' placeholders with your SDL2 path)
6. Run the game! `big2` (See command line arguments below)

## Command line arguments

* `-name [yourname]`
* `-join [address]` (join game; address must be IPv4 address, port number is optional: e.g. `127.0.0.1`, `127.0.0.1:1234`, etc.)
* `-host`
* `-port [port]` (optional, host only; default port is 27191; protocol is TCP/IP, make sure any firewalls are configured to allow traffic)
* `-rounds [number]` (optional, host only; default is 8)
* `-ai [number]` (optional, host only; add N AI players)
* `-hostonly` (optional, host only; don't join game)

For example:
* Host game: `big2 -name Nick -host`
* Join game: `big2 -name Saul -join 127.0.0.1`

## Hotkeys

* `Enter`: Play selected cards
* `/`: Pass
* `F1`: Show FPS
* `F11`: Full screen

## Acknowledgements & license

SDL: [https://www.libsdl.org/](https://www.libsdl.org/)

stb_image.h: [https://github.com/nothings/stb](https://github.com/nothings/stb)

Card sprites are based on [https://code.google.com/archive/p/vector-playing-cards/](https://code.google.com/archive/p/vector-playing-cards/)

Marko One font: [https://fonts.google.com/specimen/Marko+One](https://fonts.google.com/specimen/Marko+One) ([view license](`docs/MarkoOne-OFL.txt`))

Card place sounds: [https://www.kenney.nl/assets/casino-audio](https://www.kenney.nl/assets/casino-audio) (modified)

Charm/Charm2 sound: [https://freesound.org/people/Scrampunk/sounds/344696/](https://freesound.org/people/Scrampunk/sounds/344696/) (modified) ([view license](https://creativecommons.org/licenses/by/3.0/))

Charm2 sound: [https://freesound.org/people/Alivvie/sounds/323438/](https://freesound.org/people/Alivvie/sounds/323438/) (modified)

Win sound: [https://freesound.org/people/humanoide9000/sounds/466133/](https://freesound.org/people/humanoide9000/sounds/466133/) (modified) ([view license](https://creativecommons.org/licenses/by/3.0/))

Graphics & audio tools: [BMFont](https://www.angelcode.com/products/bmfont/), [Paint.NET](https://www.getpaint.net/), [Audacity](https://www.audacityteam.org/)

All Muon code in this repo (.mu files) licensed under MIT license.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.