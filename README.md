# lita-cheapshark

[![Circle CI](https://circleci.com/gh/mskog/lita-cheapshark.svg?style=svg)](https://circleci.com/gh/mskog/lita-cheapshark)

**lita-cheapshark** is a [Lita](https://github.com/litaio/lita) handler that returns the best deal for a video game from [Cheapshark](http://www.cheapshark.com)

## Installation

Add lita-cheapshark to your Lita instance's Gemfile:

``` ruby
gem "lita-cheapshark"
```

## Usage

To get the best deal for a game:

```
<me> lita: cheapshark Witcher 3
<lita> Cheapest deal for 'The Witcher 3: Wild Hunt': $29.9
<lita> http://www.cheapshark.com/redirect?dealID=zd5hlJ2%2F4dqiU6PCSdSsWheXOX27C2K4woBCnhpxLyA%3D
```
