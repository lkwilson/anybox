# anybox

Basically a dot files repo. Make changes here, and use ./ab to show the detla,
capture live updates and apply new changes.

# Usage

## diff

show the active diff between this and live. Run this to understand what we're
about to change.

```bash
./ab d[iff]
```

## see

like diff but only shows levels (so diff -q)

```bash
./ab s[ee]
```

## install

the actual install. this is destructive, so use it carefully (ie run diff first)

```bash
./ab i[nstall]
```

## capture

for all local files, go grab production and copy it here. useful for editing
live and then capturing it here for update

```bash
./ab c[apture]
```

