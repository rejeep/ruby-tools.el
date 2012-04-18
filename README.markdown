# Ruby tools
Ruby tools mode is a minor mode for Emacs containing various handy
functions for `ruby-mode`.

## Installation
I recommend installing via ELPA, but manual installation is simple as well:

    (add-to-list 'load-path "/path/to/ruby-tools")
    (require 'ruby-tools)

## Usage
When `ruby-mode` is started, `ruby-tools-mode` will automatically start.

Once started, this functionality is available:

### Convert symbol to string

Insert:

    foo(:bar)

Place cursor on `:bar`, then press `C-'` and you will see:

    foo('bar')

### Convert string to symbol

Insert:

    foo('bar')
    foo("bar")

Place cursor on `bar`, then press `C-:` and you will see:

    foo(:bar)
    foo(:bar)

### Convert single quote string to double quote string and reverse

Insert:

    foo('bar')

Place cursor on `bar`, then press `C-"` and you will see:

    foo("bar")

### Convert double quote string to single quote string

Insert:

    foo("bar")

Place cursor on `bar`, then press `C-'` and you will see:

    foo('bar')

### Clear string content

Insert:

    foo('bar')

Place cursor on `bar`, then press `C-;` and you will see:

    foo('')

### String interpolation

Insert:

    foo('bar')
    foo("bar")
    `bar`
    %(bar)

Place cursor on `bar`, then press `#` and you will see:

    foo('b#ar')
    foo("b#{}ar")
    `b#{}ar`
    %(b#{}ar)

## Contribution
Contribution is much welcome! Ruby tools is tested using
[Ecukes](http://ecukes.info). When Adding new features, please write
tests for them!

To fetch Ecukes:

    $ cd /path/to/ruby-tools
    $ git submodule init
    $ git submodule update

Run the tests with:

    $ ./util/ecukes/ecukes features
