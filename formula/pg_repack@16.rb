class PgRepackAT16 < Formula
  desc "Reorganize tables in PostgreSQL databases with minimal locks"
  homepage ""
  url "https://github.com/reorg/pg_repack/archive/refs/tags/ver_1.5.0.tar.gz"
  sha256 "9a14d6a95bfa29f856aa10538238622c1f351d38eb350b196c06720a878ccc52"
  license "BSD-3-Clause"

  depends_on "postgresql@16"

  bottle do
    root_url "https://github.com/crunchyjoea/homebrew-pg_repack/raw/main/bottle/"
    sha256 arm64_sonoma: "f5cd776acaab85ab6949df730087de019dcd2c8a6fa4f4455dca8c0d04620573"
  end

  def postgresql
    Formula["postgresql@16"]
  end

  def install

    system "make", "all"
    mkdir "stage"
    system "make", "install", "DESTDIR=#{buildpath}/stage"
    postgresql_prefix = postgresql.prefix.realpath
    postgresql_stage_path = File.join("stage", postgresql_prefix)
    bin.install (buildpath/postgresql_stage_path/"bin").children

    stage_path = File.join("stage", "opt/homebrew/opt/postgresql@16/")
    lib.install (buildpath/stage_path/"lib").children
    share.install (buildpath/stage_path/"share").children

  end

end
