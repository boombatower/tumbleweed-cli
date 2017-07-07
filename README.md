# tumbleweed-cli

Command line interface for interacting with Tumbleweed snapshots.

## Installation

```bash
zypper addrepo -p 105 http://download.opensuse.org/repositories/home:boombatower:snapshot/openSUSE_Tumbleweed/ tw-snapshot
zypper in tumbleweed-cli
```

## Usage

See `tumbleweed --help` for reference. To get started utilizing snapshots:

```bash
tumbleweed init
```

The repos can be verified by ensuring that the URLs contain a snapshot version.

```bash
zypper lr -EUP
```

`zypper refresh && zypper dup` will no longer be the method for updating as the
repos will point to static snapshot versions. All other zypper operations will
behave the same. At any point `tumbleweed uninit` will return the repositories
to their original state.

Some common examples are as follows.

```bash
# present latest, target, and installed snapshot versions
tumbleweed status

# update to latest
tumbleweed update

# target 1234 snapshot and install
tumbleweed switch --install 1234

# list available snapshots
tumbleweed list

# target previous snapshot and install
tumbleweed revert --install

# list history of snapshots targeted
tumbleweed history
```

To operate more manually, the following is equivalent to `tumbleweed update`.

```bash
# switch to latest
tumbleweed switch

zypper ref
zypper dup
```

The repo URLs are effectively the only part of the `libzypp` configuration that
is being changed. This keeps the workflow changes to a minimum.
