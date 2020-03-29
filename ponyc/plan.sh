
pkg_name=ponyc
pkg_origin=lancewf
pkg_version=0.32.0
pkg_upstream_url="http://mama.indstate.edu/users/ice/tree/"
pkg_description="A utility to display a tree view of directories."
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('gplv2+')
pkg_source=https://dl.bintray.com/pony-language/ponyc-source/${pkg_name}-${pkg_version}-1.tar.bz2
pkg_filename="${pkg_name}-${pkg_version}-1.tar.bz2"
pkg_dirname="${pkg_name}-${pkg_version}"
pkg_shasum=81b2d186262c01b8f27c5d228d56140dbf950b9f80c87fc8683488f7fccaa226
pkg_deps=(core/llvm)
pkg_build_deps=(core/make core/gcc/7.3.0 core/llvm core/which core/ncurses5 core/zlib core/clang)
pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib2)

do_build() {
  export LLVM_CONFIG="$(pkg_path_for llvm)/bin/llvm-config"
  make default_pic=true
  return 0
}

do_install() {
  make install
  mkdir -p bin
  chmod 777 -R bin
  cp build/release/ponyc bin/.
  # cp -r build/release/lib lib2
  return 0
}

do_unpack() {
  build_line "Unpacking..."
  mkdir -p $HAB_CACHE_SRC_PATH/${pkg_dirname}
  tar -xjf $HAB_CACHE_SRC_PATH/${pkg_name}-${pkg_version}-1.tar.bz2 -C $HAB_CACHE_SRC_PATH/${pkg_dirname}
}