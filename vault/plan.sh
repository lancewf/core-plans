pkg_origin=core
pkg_name=vault
pkg_version=0.9.5
pkg_description="A tool for managing secrets."
pkg_maintainer='The Habitat Maintainers <humans@habitat.sh>'
pkg_license=("MPL-2.0")
pkg_upstream_url=https://www.vaultproject.io/
pkg_source=https://releases.hashicorp.com/vault/${pkg_version}/vault_${pkg_version}_linux_amd64.zip
pkg_shasum=f6dbc9fdac00598d2a319c9b744b85bf17d9530298f93d29ef2065bc751df099
pkg_filename=${pkg_name}-${pkg_version}_linux_amd64.zip
pkg_deps=()
pkg_build_deps=(core/unzip)
pkg_bin_dirs=(bin)
pkg_svc_user=root
pkg_svc_group=root
pkg_exports=(
  [port]=listener.port
)
pkg_exposes=(port)

do_unpack() {
  cd "${HAB_CACHE_SRC_PATH}" || exit
  unzip ${pkg_filename} -d "${pkg_name}-${pkg_version}"
}

do_build() {
  return 0
}

do_install() {
  install -D vault "${pkg_prefix}"/bin/vault
}
