class String
  def method_missing(method, *args)
    # catch ghost_reverse if true, else fallback to super method_missing
    method == :ghost_reverse ? reverse : super
  end
end

require 'benchmark'

Benchmark.bm do |b|
  b.report 'Normal method' do
    1000000.times { "abc".reverse }
  end
  b.report 'Ghost method' do
    1000000.times { "abc".ghost_reverse }
  end
end