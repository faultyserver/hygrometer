# Hygrometer

A simple benchmarking library for Myst code.

# Usage

Hygrometer exposes a single top-level module, `Hygro`, that contains all of the benchmarking methods.

```myst
require "hygrometer"

# Simple block timing.
#
# The block will be run once, and the result will be a `Time`
# object with the real time elapsed while running the code.
elapsed = Hygro.time{ some_long_code }

# ips(duration = 10, name = "block", &block) -> Float
#
# Iterations per second.
#
# Run the block as many times as possible in `n` seconds (default 10),
# calculating the average number of iterations performed in each
# second. The results will be output to the screen. The method will
# return a Float representing the calculated iterations per second.
Hygro.ips(60) do
  some_long_code
end
```

# Installation

Myst doesn't currently have a dependency manager, so the simplest way to use hygrometer is to clone the single source file `hygrometer.mt`, and place it somewhere in your project directory.

# Development

Run the specs with `myst spec/hygrometer.mt`. The specs will take a long time to run, as many benchmarking methods default to long run time values for more accurate results. Currently, these specs rely on unreleased features of Myst (namely `assert`, as of `v0.5.0`). These changes should be available in the next release coming soon.

# The name

From [wikipedia](https://en.wikipedia.org/wiki/Hygrometer):

>A hygrometer /haɪˈɡrɒmɪtər/ is an instrument used for measuring the water vapor in the atmosphere, in soil, or in confined spaces.
