AYCH
=============

Setup
---------------------
AYCH is the original AYCHClient and it builds the backbone of the network. It downloads and, by default, stores the entire history of Aych transactions (which is currently more than 7 GBs); depending on the speed of your computer and network connection, the synchronization process can take anywhere from a few hours to a day or more.

To download AYCH, visit [AYCH](https://www.aych.site).

Running
---------------------
The following are some helpful notes on how to run AYCH on your native platform.

### Unix

Unpack the files into a directory and run:

- `bin/aych-qt` (GUI) or
- `bin/aychd` (headless)

### Windows

Unpack the files into a directory, and then run aych-qt.exe.

### macOS

Drag AYCH to your applications folder, and then run AYCH.

### Need Help?

* See the documentation at the [AYCH Wiki](https://aych.site/)
for help and more information.
* For Developer Chat [#AYCH](http://gitter.im/aychr/).
* For User Community Help [#AYCH](http://twubs.com/aych) forums.

Building
---------------------
The following are developer notes on how to build AYCH on your native platform. They are not complete guides, but include notes on the necessary libraries, compile flags, etc.

- [Dependencies](dependencies.md)
- [macOS Build Notes](build-osx.md)
- [Unix Build Notes](build-unix.md)
- [Windows Build Notes](build-windows.md)
- [OpenBSD Build Notes](build-openbsd.md)
- [NetBSD Build Notes](build-netbsd.md)
- [Gitian Building Guide](gitian-building.md)

Development
---------------------
The AYCH repo's [root README](/README.md) contains relevant information on the development process and automated testing.

- [Developer Notes](developer-notes.md)
- [Release Notes](release-notes.md)
- [Release Process](release-process.md)
- [Translation Process](translation_process.md)
- [Translation Strings Policy](translation_strings_policy.md)
- [Travis CI](travis-ci.md)
- [Unauthenticated REST Interface](REST-interface.md)
- [Shared Libraries](shared-libraries.md)
- [BIPS](bips.md)
- [Dnsseed Policy](dnsseed-policy.md)
- [Benchmarking](benchmarking.md)

### Resources
* Discuss on the [AYCH](http://Twubs.com/aych/) forums.
* Discuss general development on [#AYCH](https://gitter.im/aychr/.

### Miscellaneous
- [Assets Attribution](assets-attribution.md)
- [Files](files.md)
- [Fuzz-testing](fuzzing.md)
- [Reduce Traffic](reduce-traffic.md)
- [Tor Support](tor.md)
- [Init Scripts (systemd/upstart/openrc)](init.md)
- [ZMQ](zmq.md)

License
---------------------
Distributed under the [MIT software license](/LICENSE), [the AGPL-3.0+](https://www.gnu.org/licenses/).
This product includes software developed by the OpenSSL Project for use in the [OpenSSL Toolkit](https://www.openssl.org/). This product includes
cryptographic software written by Eric Young ([eay@cryptsoft.com](mailto:eay@cryptsoft.com)), and UPnP software written by Thomas Bernard.
