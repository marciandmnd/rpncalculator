![Icon](icon.png "RPN Calculator")

# RPN Calculator

Reverse Polish Notation (RPN) Calculator command line utility.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

```
git clone https://github.com/marciandmnd/RPNCalculator.git
cd RPNCalculator
bundle install
```

## Usage

There are two modes of operation. RPN calculations via interactive CLI and an RPN calculation via an expression argument.

**Starting an interactive CLI session**\  
Enter `./bin/rpncalculator -s` from the project root. 
Of course, you can navigate into the `bin` directory and enter `./rpncalculator -s`

The `-s` option is shorthand for `--start`, which may also be used begin an interactive CLI session.

**Evaluating an expression only**  
RPNCalculator may evaluate an expression via the -e option, without starting an interactive session. Currently the expression result is outputted to STDOUT. This may be useful for interfacing with other technologies (i.e. WebSocket, file, or TCP socket).

Examples: 
`./bin/rpncalculator -e '1 2 3 + -'`
or
`./bin/rpncalculator --expression='1 2 3 + -'`


### Prerequisites

What things you need to install the software and how to install them

Ruby v. 2+  
Bundler v. 1+

## Running the tests

RPNCalculator uses [Minitest](https://github.com/seattlerb/minitest) to run unit tests on the appliction's primary components.

To run the test suite, simply enter `rake test`.

### Style tests

[Rubocop](https://github.com/bbatsov/rubocop) is used to enforce styling rules.

Within the project directory, from the command line, run: `rubocop` to see style warnings.

## Built With

* [Ruby](https://www.ruby-lang.org/en/) - The programming language used

## Contributing

Pull requests welcome!

## Versioning

[SemVer](http://semver.org/) is used for versioning.

## Authors

* **Marcian Diamond** - *Initial work* - [MARCIAN.GURU](https://www.marcian.guru)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* On-Site
