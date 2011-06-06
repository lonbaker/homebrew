require 'formula'

class Freeswitch < Formula
  url "git://git.freeswitch.org/freeswitch.git", :tag => "v1.0.6"
  version '1.0.6'
  homepage 'http://www.freeswitch.org'

  def options
    []
  end

  def install
    system "./bootstrap.sh"

    args = ["--disable-debug",
            "--prefix=#{prefix}",
            "--with-openssl"]

    args << "--enable-64" if MacOS.prefer_64_bit?

    system "./configure", *args
    system "make"
    system "make install"
    system "make cd-sounds-install"
    system "make cd-moh-install"
    system "make uhd-sounds-install"
    system "make uhd-moh-install"
    system "make hd-sounds-install"
    system "make hd-moh-install"
    system "make sounds-install"
    system "make hd-moh-install"
    system "make moh-install"

  end

end
