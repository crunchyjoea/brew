class PgRepack < Formula
  desc "Reorganize tables in PostgreSQL databases with minimal locks"
  homepage ""
  url "https://github.com/reorg/pg_repack/archive/refs/tags/ver_1.5.0.tar.gz"
  sha256 "9a14d6a95bfa29f856aa10538238622c1f351d38eb350b196c06720a878ccc52"
  license "BSD-3-Clause"

  depends_on "postgresql@16"

  bottle do
    root_url "https://github.com/crunchyjoea/homebrew-pg_repack/raw/main/bottle/"
    sha256 arm64_sonoma: "e5d62f282115e1fc901c1b3de792008a0901e3a3b2e0b4c5139a3c888e1f4e0b"
  end

  def install
    system "make", "all"
    doc.install "COPYRIGHT"
    doc.install "doc/pgrepack.rst"
    bin.install "bin/pg_repack"
    lib.install "lib/pg_repack--1.5.0.sql"
    lib.install "lib/pg_repack.control"
  end

end
