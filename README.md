Go Ethereum Cookbook
================

This is a [Chef] cookbook to install, manage and deploy configuration for [geth].

## Repository
```
https://github.com/nikitasobolevsky/chef-geth
```
## Supported OS
This cookbook was tested on Amazon & Ubuntu Linux and expected to work on other RHEL platforms.

## Cookbook Dependency
* toml
* tar

## Core Attributes
* `default['geth']['conf_file']` (default: `/etc/geth.toml`): Geth configuration file.
* `default['geth']['uri']` uri to gzip archive Go Ethereum Node.
* `default['geth']['sha']` sha256 control sum of gzip archive.
* `default['geth']['config']['Node']['DataDir']` (default: `/opt/geth`): Geth datadir
* `default['geth']['config']['Eth.Ethash']['DatasetDir']` (default: `/opt/ethash`): Geth DatasetDir

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests (`rake & rake knife`), ensuring they all pass
6. Write new resource/attribute description to `README.md`
7. Write description about changes to PR
8. Submit a Pull Request using Github

## Copyright & License

Authors: Nikita Sobolevsky and [Contributors]

Licensed under the [GNU Lesser General Public License v3.0](https://www.gnu.org/licenses/lgpl-3.0.en.html), also included in our repository in the `LICENSE` file.

[Chef]: https://www.chef.io/
[Geth]: https://github.com/ethereum/go-ethereum
