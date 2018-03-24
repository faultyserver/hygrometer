require "stdlib/spec.mt"

require "../hygrometer.mt"

describe("Hygrometer") do
  describe("time") do
    it("returns a Float") do
      result = Hygro.time{ }

      assert(result.type.to_s).equals("Float")
    end

    it("calls the given block once") do
      calls = 0
      Hygro.time{ calls += 1 }

      assert(calls).equals(1)
    end
  end


  describe("ips") do
    it("returns the calculated iterations per second") do
      result = Hygro.ips(1){ }

      assert(result.type.to_s).equals("Float")
    end

    it("calls the block potentially multiple times") do
      calls = 0
      Hygro.ips(1){ calls += 1 }

      assert(calls).greater_or_equal(1)
    end

    it("defaults to 10 seconds when no argument is given") do
      STDOUT.puts("Starting 10 second test")
      start = Time.now
      Hygro.ips{ }
      finish = Time.now

      # Expect that the elapsed time is _at least_ 10 seconds, and within
      # 20 milliseconds more.
      assert(finish - start).between(10.000, 10.020)
    end

    it("changes the duration based on the given argument") do
      STDOUT.puts("Starting 2 second test")
      start = Time.now
      Hygro.ips(2){ }
      finish = Time.now

      # Expect that the elapsed time is _at least_ 10 seconds, and within
      # 10 milliseconds more.
      assert(finish - start).between(2.000, 2.010)
    end

    it("accepts a `name` parameter for naming the block") do
      Hygro.ips(1, "") { }
    end
  end
end


# Add a padding newline to the bottom of the specs.
STDOUT.puts("\n\nAll specs passed\n")
