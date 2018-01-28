# bk22lsmv

A tool for converting a bizhawk .bk2 file into an lsnes .lsmv file.

## Usage

Download the binary and add it to your `PATH` then run the following command:

```
$ bk22lsmv path\to\input_bk2.bk2 path\to\lsmv_to_modify.lsmv > path\to\output_file.lsmv
```

The program will take the input log from `input_bk2.bk2` and inject it into a copy of `lsmv_to_modify.lsmv`. The result will be written to STDOUT, and can be redirected to a file, in this case `output_file.lsmv`

## Compilation

Compilation is performed using the haskell stack. Installation instructions for the haskell stack can be found at [the stack documentation site](https://docs.haskellstack.org)

You will need to clone the repository into a local folder. After this has been done, navigate into the folder and simply run:

```
$ stack build
```

If stack gives you any trouble, try running `stack init` and `stack setup` beforehand.

You can now execute the program in the working directory using:

```
$ stack exec bk22lsmv-exe <arguments>
```

Running `stack install` will copy the executable into a local directory. The binary should now be able to run using:

```
$ bk22lsmv-exe <arguments>
```

from any directory. If it does not, check that the stack bins directory is in your `PATH`. The stack bins directory can be found using

```
$ stack path --local-bin
```

For more information on how to use stack, check the (stack documentation website)[https://docs.haskellstack.org]