# Hygro
#
# A simple benchmarking library for Myst code.
defmodule Hygro
  # time(&block) -> Float
  #
  # Run the given block once and return a `Float` representing the real time
  # (in seconds) elapsed while running the block.
  def time(&block)
    start = Time.now
    block()
    finish = Time.now

    finish - start
  end

  # ips(duration = 10, name = "block", &block) -> Float
  #
  # Run the block as many times as possible in `duration` seconds (default 10),
  # calculating the average number of iterations performed in each second. The
  # results will be output to STDOUT. The method will return a Float
  # representing the calculated iterations per second.
  def ips(duration : Integer, name : String, &block)
    STDOUT.puts("Running `<(name)>` for <(duration)> seconds:")

    iterations = 0
    start = Time.now
    while (Time.now - start) < duration
      block()
      iterations += 1
    end

    ips = 1.0 * iterations / duration

    STDOUT.puts("\titerations/second: <(ips)>")

    ips
  end
  def ips(duration : Integer, &block); ips(duration, "block", &block); end
  def ips(name : String, &block); ips(10, name, &block); end
  def ips(&block); ips(10, "block", &block); end
end
