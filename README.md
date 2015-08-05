# jumpstart
## a arch linux configuration jumpstart

jumpstart is a collection of scripts designed to

1. Install necessary packages
2. Build all configuration based on ONE theme file
3. Move all configuration files into the correct paths


* [Installation](#installation)
* [How it works](#works)
* [Roadmap](#roadmap)
* [FAQ](#faq)
* [License](#license)

## <a name="installation"></a> Installation

!!! Warning !!! Scaffolding files and packages are system specific. Do not run the install script unless you are confident all files and packages are accurate to your system.

#### Easy way

1. Make a tmp folder

  `mkdir tmp && cd tmp`

2. wget master script

  `wget https://raw.githubusercontent.com/btkostner/jumpstart/master/install`

3. Make script executable

  `chmod +x ./install`

4. Run script

  `./install`

5. (optional) Remove tmp folder

  `cd .. && rm -rf ./tmp`

#### Git way

1. Clone this repo to `<folder>`

  `git clone https://github.com/btkostner/jumpstart.git <folder>`

2. Run script

  `./install`

#### Build configuration files only

1. Clone this repo to `<folder>`

  `git clone https://github.com/btkostner/jumpstart.git <folder>`

2. Install dependencies (requires npm)

  `npm install`

4. Build files

  `node build.js`

## <a name="works"></a> How it works

All configuration files are kept in the scaffolding directory. Simple replace any variables you want to be changed on build with `$color.01` or equivalent. All variables are kept in the theme.js file for easy editing and sharing.

## <a name="roadmap"></a> Roadmap

### v1.0.0
* Clean up code
* Add install script
* Add all configuration files required for clean install

## <a name="faq"></a> FAQ

### Why javascript?

It seemed simple enough to work with.

### This does the same thing as X

Cool story. Now you have options.

### Can I help with adding this awesome feature I want.

Are you really asking permission for this?

### Can I use these scripts for my awesome setup / dotfiles?

Dude. Yes.

## <a name="license"></a> License

WTFPL. Enjoy.
