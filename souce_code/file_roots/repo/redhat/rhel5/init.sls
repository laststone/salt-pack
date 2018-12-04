{% import "setup/redhat/map.jinja" as buildcfg %}

include:
  - repo.redhat

{{buildcfg.build_dest_dir}}:
  pkgbuild.repo:
    - order: last
{% if repo_keyid != 'None' %}
    - keyid: {{repo_keyid}}
    - use_passphrase: True
    - gnupghome: {{buildcfg.build_gpg_keydir}}
    - runas: {{buildcfg.build_runas}}
    - timeout: {{buildcfg.repo_sign_timeout}}
    - env:
        ORIGIN : 'SaltStack'
{% endif %}

