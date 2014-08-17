emacs.d
=======

My emacs config

My rebuilt emacs settings.
I'm starting from scratch to remove old cruft and make it more modular.

Based on Technomancy's [Better Defaults](https://github.com/technomancy/better-defaults)
With many ideas from: 
    [BBatsov's prelude](https://github.com/bbatsov/prelude)
    [flyingmachine's settings](https://github.com/flyingmachine/emacs.d)
    [Emacs Live](https://github.com/overtone/emacs-live)

Including instructions on how to compile and install emacs on in local directories on Fedora Linux [install-fedora.md](./doc/install-fedora.md)

A handy key binding reference: [key-bind.org](./doc/key-bind.org) acsessible with the C-h C-d key combo.

*Directories*

```custom```      contains customization files for various modules and custom lisp code

```vendor```      contains lisp modules not in any of the ```elpa``` repositories

```melpa```       contains ```elpa``` installed elisp modules.

```doc```         contains various usefull (hmm, to me) files.

*Modularity*

I have an idea to use git branches to provide some organization and modularity to my emacs settings.  I will use branches to store different configurations. Different cofiguration mashups may be composed by merging various branches.

Some of the branches will be as follows:

```base```        will store basic configurations common to all modes.

```programming``` will store customizations common to all programming modes and
                  some ```elisp``` settings.

```experiment```  will store experiments that may be folded into the main branches.

```master```      will contain the whole kit.  I you want to use just my basic setting
              check out ```base``` branch.

Various branches, such as ```clojure``` ```haskell``` etc. will store items specific to those programming languages.

If you want to use a light editor for any specific language check out that languages branch. If you want to use a setup that includes more than one set up, create a new branch and merge specific branches.

```base``` will be merged to ```programming```, ```programming``` will be merged to the various language modules. Every thing will be merged to ```master```. Very little development will be done in ```master```.

May be too complecated, but this is only an experiment.

This software is under the GPL3 license.
