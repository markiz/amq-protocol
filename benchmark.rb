#!/usr/bin/env ruby
# encoding: binary

begin
  require "amq/spec"
rescue LoadError
  abort "You have to install the amqp gem in order to run the benchmark against its AMQP encoder/decoder."
end

require "benchmark"

Benchmark.bmbm do |bm|
  bm.report("Raw binary") do
    # TODO
  end

  bm.report("AMQP Gem") do
    # TODO
  end

  bm.report("AMQ Protocol Gem") do
    # TODO
  end
end
