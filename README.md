# StegTools

Stegano Tool is a custom steganography tool for analyzing strings in files.

## Features

- String analysis in files.
- Customizable flag starting pattern.
- Customizable delimiter for the end of the flag.

### Installation

Clone the repository:

```bash
git clone https://github.com/ibrahimly20/StegTools.git
cd StegTools
```

## Usage

### Ruby code
  You can use the Ruby version by executing this command:

  ```bash
  cd ruby/lib/
  ruby steg_tool.rb -f FILE -t TEXT_TO_SEARCH -p END_PATTERN
  ```
N.B: Even if you don't provide the arguments it will prompt you them

### Python code
  Instead of the ruby version, if you prefer the python version here is the command:

  ```bash
  cd python/
  python steg_tool.py -f FILE -t TEXT_TO_SEARCH -p END_PATTERN
  ```
N.B: As the ruby version, even if you don't provide the arguments it will prompt you them
