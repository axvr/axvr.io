<title>Ascribe</title>

# Ascribe

### An alternative to [EditorConfig](https://editorconfig.org/).

Ascribe is a standard for software development tools (specifically editors) to
retrieve and handle information on the various files within a project through
the `.gitattributes` file already found in many software projects.

While EditorConfig does mostly achieve the same goal, it is solely focused on
editors, therefore it doesn't (_easily_) allow anyone to add additional options for
other types of development tools.

Ascribe is designed to allow software developers to keep all information about
the files in their projects in one place, and encourages the improvement of the
existing (and arguably, much more useful) `.gitattributes` parsers.

## Want to learn more?

- Why did I create Ascribe? (_WIP_)
- [Comparison between EditorConfig and Ascribe](comparison).
- [Using `.gitattributes` files](usage).
- [Ascribe specification](specification).
- [Project goals & scope](goals).

## Official extensions

- [Vim](https://github.com/axvr/ascribe.vim)
- GNU Emacs (_WIP_)
- Git CLI (_WIP_ - uses Git hooks)