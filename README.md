# ConsultingDetective

[![Build status](https://github.com/olekscode/ConsultingDetective/workflows/CI/badge.svg)](https://github.com/olekscode/ConsultingDetective/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/ConsultingDetective/badge.svg?branch=master)](https://coveralls.io/github/olekscode/ConsultingDetective?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/ConsultingDetective/master/LICENSE)

A tool to help library developers detect breaking changes before the release and reduce their negative effect on client systems.

## How to install it?

To install `ConsultingDetective`, go to the Playground (`Ctrl+OW`) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press `Do-it` button or `Ctrl+D`):

```Smalltalk
Metacello new
  baseline: 'ConsultingDetective';
  repository: 'github://olekscode/ConsultingDetective/src';
  load.
```

## How to depend on it?

If you want to add a dependency on `ConsultingDetective` to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'ConsultingDetective'
  with: [ spec repository: 'github://olekscode/ConsultingDetective/src' ].
```

If you are new to baselines and Metacello, check out the [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) tutorial on Pharo Wiki.

## How to use it?
